package com.culture.api.payment.service;

import java.util.List;

import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.api.payment.vo.PaymentVO;
import com.culture.user.login.vo.UserLoginVO;

public interface MvorderdetailService {
	int insertOrderDetail(MvOrderDetailVO orderDetail);
	
	// 특정 사용자의 결제 내역
	List<MvOrderDetailVO> getSelectedOrderDetails(UserLoginVO user);
	
	// 모든 사용자의 결제 내역
	List<MvOrderDetailVO> getAllOrderDetails(MvOrderDetailVO dvo);
	
	MvOrderDetailVO getBill(MvOrderDetailVO mvo);

	int getAllOrderDetailsCnt(MvOrderDetailVO mvo);
	
    int payStatusUpdate(MvOrderDetailVO dvo);
}
