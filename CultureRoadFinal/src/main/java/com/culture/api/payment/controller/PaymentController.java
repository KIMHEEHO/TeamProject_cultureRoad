 package com.culture.api.payment.controller;

import com.culture.api.payment.service.MvorderdetailService;
import com.culture.api.payment.service.PaymentService;
import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.api.payment.vo.PaymentVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller  // @RestController 대신 @Controller를 사용
@RequestMapping("/payment/*")  // 맵핑 주소
@Slf4j
@RequiredArgsConstructor
public class PaymentController extends PaymentCommonController{

    private final PaymentService paymentService;
    private final MvorderdetailService mvorderdetailService;

    @PostMapping("/ajax/save")  // 데이터 vo에 저장
    public @ResponseBody Map<String, Object> savePayment(@RequestBody PaymentVO paymentVO) {
        return paymentService.savePaymentAndReturn(paymentVO);
    }
 
    /**
     * 환불하기
     * @param response
     * @param payment
     * @throws IOException
     * 사용자가 취소하는 경우
     */
    @PostMapping("/cancel")
    public void cancelPayment(HttpServletResponse response, PaymentVO payment, MvOrderDetailVO dvo) throws IOException {
        //  사용자 검증 추가

        if(payment == null || payment.getMvPaymentId() == 0) {
            log.error("MvPaymentId 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
            return;
        }

        String accessToken = getPaymentAccessToken();

        // AccessToken 없는 경우
        if(accessToken == null || accessToken.isEmpty()) {
            log.error("accessToken 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
            return;
        }

        if(doCancelPayment(accessToken, String.valueOf(payment.getMvPaymentId()))) { // 결제 취소 성공
        	 log.info("결제 취소 성공");
             int result = paymentService.cancelPayment(payment);
             if(result == 1) {
            	mvorderdetailService.payStatusUpdate(dvo);
             	log.info("결과내놔" + mvorderdetailService.payStatusUpdate(dvo));
                alertMessage(response, CANCEL_SUCCESS_MESSAGE);
            } else {
                alertMessage(response, CANCEL_FAIL_MESSAGE);
            }
        } else { // 결제 취소 실패
            log.error("결제 취소 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
        }
    }
}
