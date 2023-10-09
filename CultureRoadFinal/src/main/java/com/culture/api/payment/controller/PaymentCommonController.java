package com.culture.api.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentCommonController {

	//RestTemplate=>HTTP요청을 보내는데 사용
    protected RestTemplate restTemplate = new RestTemplate();

    protected static final String CANCEL_SUCCESS_MESSAGE = "<script>alert('결제 취소요청이 완료되었습니다. 24시간 이내에 금액이 환불될 예정입니다.'); location.href='/mvorderdetail/orderDetails';</script>";
    protected static final String CANCEL_FAIL_MESSAGE = "<script>alert('결제 취소에 실패하였습니다.'); history.back();</script>";

    protected static final String ADMIN_CANCEL_SUCCESS_MESSAGE = "<script>alert('관리자에 의해 결제가 취소되었습니다.'); location.href='/admin/paymentList';</script>";

    /**
     * 결제 API Access Token 얻기
     * RestTemplate을 사용하여 API에 POST요청을 보내고 응답을 파싱하여 액세스 토큰을 반환
     * @return
     */
    protected String getPaymentAccessToken() {
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.set("imp_key", "1310463875335678");
        params.set("imp_secret", "WXfvIyOgRsY1rvsACHrNG38cXL3aJB6mMQuYZr1bhsOW4j4tH575zrtgaalRkhc2wGMTIe9GGytVZ9Gm");

        ResponseEntity<String> httpResponse = restTemplate.postForEntity("https://api.iamport.kr/users/getToken", params, String.class);
        JSONObject jsonObject = new JSONObject(httpResponse.getBody());
        
        log.info("결제취소 토큰 Retrieved: {}", jsonObject.getJSONObject("response").getString("access_token"));
        return jsonObject.getJSONObject("response").getString("access_token");
    }

    /**
     * 결제 취소 API 호출
     * @param accessToken
     * @param mvPaymentId
     * @return
     * 결제취소api호출 결제성공 실패 여부 반환
     */
    protected boolean doCancelPayment(String accessToken, String mvPaymentId) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + accessToken);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.set("imp_uid", "imp15631721");
        params.set("merchant_uid", mvPaymentId);

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);
        try {
            ResponseEntity<String> httpResponse = restTemplate.postForEntity("https://api.iamport.kr/payments/cancel", entity, String.class);
            return httpResponse.getStatusCode().equals(HttpStatus.OK);
        } catch (HttpClientErrorException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * alert 메시지
     * @param response
     * @param message
     * @throws IOException
     * 사용자에게 반환 메시지
     */
    protected void alertMessage(HttpServletResponse response, String message) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println(message);
        out.flush();
    }
}
