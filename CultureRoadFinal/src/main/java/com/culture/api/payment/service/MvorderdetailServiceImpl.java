package com.culture.api.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.api.payment.dao.MvOrderDetailDAO;
import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.api.payment.vo.PaymentVO;
import com.culture.user.login.vo.UserLoginVO;

@Service
public class MvorderdetailServiceImpl implements MvorderdetailService {

    @Autowired
    private MvOrderDetailDAO mvorderdetailDAO;
    
    @Override
    public int insertOrderDetail(MvOrderDetailVO orderDetail) {
        return mvorderdetailDAO.insertOrderDetail(orderDetail);
    }
    

    @Override
    public List<MvOrderDetailVO> getSelectedOrderDetails(UserLoginVO uvo) {
        return mvorderdetailDAO.getSelectedOrderDetails(uvo);
    }
    


    @Override
    public List<MvOrderDetailVO> getAllOrderDetails(MvOrderDetailVO dvo) {
        return mvorderdetailDAO.getAllOrderDetails(dvo);
    }

	@Override
	public MvOrderDetailVO getBill(MvOrderDetailVO mvo) {
		return mvorderdetailDAO.getBill(mvo);
	}


	@Override
	public int getAllOrderDetailsCnt(MvOrderDetailVO mvo) {
		return mvorderdetailDAO.getAllOrderDetailsCnt(mvo);
	}

	@Override
	public int payStatusUpdate(MvOrderDetailVO mvo) {
		return mvorderdetailDAO.payStatusUpdate(mvo);
	}
}
