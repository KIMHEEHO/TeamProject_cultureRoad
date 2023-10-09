package com.culture.api.phone.service;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.culture.api.phone.vo.MessageDTO;
import com.culture.api.phone.vo.SmsRequestDTO;
import com.culture.api.phone.vo.SmsResponseDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
   
@Service

public class PhoneServiceImpl implements PhoneService {
   
	@Value("${naver-cloud-sms.accessKey}") private String accessKey; 
	@Value("${naver-cloud-sms.secretKey}") private String secretKey;  
	@Value("${naver-cloud-sms.serviceId}") private String serviceId;  
	@Value("${naver-cloud-sms.senderPhone}") private String phone;
	
	public String makeSignature(String time) throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException {
	      String space = " ";
	      String newLine = "\n";
	      String method = "POST";
	      String url = "/sms/v2/services/" + this.serviceId + "/messages";
	      String timestamp = time;
	      String accessKey = this.accessKey;
	      String secretKey = this.secretKey;

	      String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(timestamp)
	            .append(newLine).append(accessKey).toString();

	      SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
	      Mac mac = Mac.getInstance("HmacSHA256");
	      mac.init(signingKey);

	      byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
	      String encodeBase64String = Base64.encodeBase64String(rawHmac);

	      return encodeBase64String;
	   }

	   @Override
	   public SmsResponseDTO sendSMS(MessageDTO messageDTO) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
	      String createSmsKey = createSmsKey();
	      Long time = System.currentTimeMillis();
	      
	      
	      messageDTO.setContent("[문화빛길] 인증번호 [" + createSmsKey + "]를 입력해주세요.");

	      HttpHeaders headers = new HttpHeaders();
	      headers.setContentType(MediaType.APPLICATION_JSON);
	      headers.set("x-ncp-apigw-timestamp", time.toString());
	      headers.set("x-ncp-iam-access-key", accessKey);
	      headers.set("x-ncp-apigw-signature-v2", makeSignature(time.toString()));

	      List<MessageDTO> messages = new ArrayList<>();
	      messages.add(messageDTO);

	      SmsRequestDTO request = SmsRequestDTO.builder()
	            .type("SMS").contentType("COMM")
	            .countryCode("82").from(phone)
	            .content(messageDTO.getContent())
	            .messages(messages).build();

	      ObjectMapper objectMapper = new ObjectMapper();
	      String body = objectMapper.writeValueAsString(request);
	      HttpEntity<String> httpBody = new HttpEntity<>(body, headers);

	      RestTemplate restTemplate = new RestTemplate();
	      restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
	      SmsResponseDTO response = restTemplate.postForObject(
	            new URI("https://sens.apigw.ntruss.com/sms/v2/services/" + serviceId + "/messages"), httpBody,
	            SmsResponseDTO.class);

	      response.setCreateSmsKey(createSmsKey);
	      return response;
	   }

	   // 6자리의 난수를 조합을 통해 인증코드 만들기
	   public static String createSmsKey() {
	      StringBuffer key = new StringBuffer();
	      Random rnd = new Random();

	      for (int i = 0; i < 6; i++) { // 인증코드 5자리
	         key.append((rnd.nextInt(10)));
	      }
	      return key.toString();
	   }

}
