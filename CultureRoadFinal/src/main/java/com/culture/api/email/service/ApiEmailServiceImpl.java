package com.culture.api.email.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApiEmailServiceImpl implements ApiEmailService{


    @Setter(onMethod_= @Autowired)
    private JavaMailSender javaMailSender;
     

    //   @Cacheable(value = "randomStringCache", key = "#email")
    public String generateRandomString(String userEmail) {
        log.info("생성했니?");
       // 인증번호(랜덤 문자) 생성 
       Random rnd =new Random();
       StringBuffer buf =new StringBuffer();

       for(int i=0;i<10;i++){ //10자리
           // rnd.nextBoolean() 는 랜덤으로 true, false를 리턴. true일 시 랜덤한 소문자를, false 일 시 랜덤한 숫자를 StringBuffer에 append함
           if(rnd.nextBoolean()){
               buf.append((char)((int)(rnd.nextInt(26))+97)); //랜덤문자
           }else{
               buf.append((rnd.nextInt(10))); //랜덤숫자
           }
       }
       
        String randomString =buf.toString();
      
        // 이메일로 랜덤 문자 발송 로직
        try {
            //SimpleMailMessage mail = new SimpleMailMessage();
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message);
            
            helper.setFrom("culturelight0417@gmail.com","문화빛길"); //
            helper.setTo(userEmail);  // 수신자 이메일 주소
            helper.setSubject("문화빛길 회원가입을 위한 이메일 인증번호입니다");  // 메일 제목
            helper.setText("인증번호를 정확하게 입력해 주세요." + randomString);  // 메일 내용 (랜덤 문자)
           
            javaMailSender.send(message);
            
        } catch (Exception e) {
            return "Error sending email: " + e.getMessage();
        }

        log.info("randomString" + randomString);
        return randomString;
    }

}
