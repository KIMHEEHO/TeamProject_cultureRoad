package com.culture.api.payment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.api.payment.vo.PaymentVO;
import com.culture.user.login.vo.UserLoginVO;

@Mapper 
public interface MvOrderDetailDAO {
    int insertOrderDetail(MvOrderDetailVO orderDetail);
    //특정 사용자 영수증
    List<MvOrderDetailVO> getSelectedOrderDetails(UserLoginVO uvo);
    MvOrderDetailVO getSelectedOrderDetails(MvOrderDetailVO orderDetail);
    //관리자용 사용자 전체영수증
    List<MvOrderDetailVO> getAllOrderDetails(MvOrderDetailVO dvo);
	MvOrderDetailVO getBill(MvOrderDetailVO mvo);
	int getAllOrderDetailsCnt(MvOrderDetailVO mvo);
    int payStatusUpdate(MvOrderDetailVO mvo);
}

