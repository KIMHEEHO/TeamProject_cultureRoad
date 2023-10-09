package com.culture.api.payment.service;

import com.culture.api.payment.dao.PaymentDAO;
import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.api.payment.vo.PaymentVO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentDAO paymentDAO;

    @Autowired
    private MvorderdetailService orderService;  // 추가

    @Override
    public Map<String, Object> savePaymentAndReturn(PaymentVO paymentVO) {
        Map<String, Object> resultMap = new HashMap<>();
        log.info("paymentVO - " + paymentVO);

        //  로그인 정보를 세션에서 받아와 넣어야 함
//        paymentVO.setUserNo(1);
        int mvPaymentId = paymentDAO.paymentNumber();
        log.info("paymentId 받아왔는지 확인" + mvPaymentId);
        
        paymentVO.setMvPaymentId(mvPaymentId);
        
        int result = paymentDAO.insertPayment(paymentVO);
        if(result == 1) {
//             MVORDERDETAIL에 데이터를 추가하는 부분
            MvOrderDetailVO detailVO = new MvOrderDetailVO();
            log.info("여기까지왔다1");
//             필드 설정
//             mvOrderId는 DB에서 자동으로 생성되므로 설정하지 않음
            detailVO.setMvPaymentId(mvPaymentId);	//결제번호
            detailVO.setUserNo(paymentVO.getUserNo());		//유저번호
            detailVO.setUserName(paymentVO.getUserName());
            detailVO.setMvHeadcnt(paymentVO.getMvHeadcnt());		//인원
            detailVO.setMvPrice(paymentVO.getMvPrice());			//가격
            detailVO.setSelectedDate(paymentVO.getSelectedDate());
            detailVO.setMvTitle(paymentVO.getMvTitle());
            detailVO.setMvPayStatus(paymentVO.getMvPayStatus());
           
//             MVORDERDETAIL에 데이터를 추가
            orderService.insertOrderDetail(detailVO);  // 추가
            log.info("여기까지왔다2");
            MvOrderDetailVO mvo = orderService.getBill(detailVO);
            log.info("여기까지왔다3");

            resultMap.put("status", "success");
            resultMap.put("message", "결제가 성공적으로 완료되었습니다");
            resultMap.put("paymentDetail", paymentVO);
        } else {
            resultMap.put("status", "fail");
            resultMap.put("message", "결제가 취소되었습니다");
        }
        return resultMap;
    }   
    
    @Override
    public int cancelPayment(PaymentVO payment) {
       return paymentDAO.cancelPayment(payment.getMvPaymentId());  // 2는 취소 상태를 의미
        
    }
    @Override
    public PaymentVO getPaymentInfo(int mvPaymentId) {  // New method
        return paymentDAO.getPaymentInfo(mvPaymentId);
    }






}
