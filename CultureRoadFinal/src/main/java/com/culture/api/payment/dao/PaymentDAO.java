package com.culture.api.payment.dao;

import org.apache.ibatis.annotations.Mapper;

import com.culture.api.payment.vo.PaymentVO;

@Mapper
public interface PaymentDAO {
    int insertPayment(PaymentVO paymentVO);		//정보 저장
    PaymentVO getPaymentInfo(int mvPaymentId);  // paymentid 받아올거
    int cancelPayment(int mvPaymentId);	//0 1 2
    PaymentVO seq(PaymentVO paymentVO);	//pamentid 받아올거 테스트
    int paymentNumber();	//pamentid 받아올거 테스트

}
