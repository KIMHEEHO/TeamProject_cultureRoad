package com.culture.api.payment.controller;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;

import com.culture.api.payment.service.MvorderdetailService;
import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.user.login.vo.UserLoginVO;

//둘중하나 해야되는데 selected 영수증 안됨
//@RestController  
@Controller
@RequestMapping("/mvorderdetail/*")
@Slf4j
public class MvorderdetailController {
//영수증 컨트롤러
    @Autowired
    private MvorderdetailService mvorderdetailService;
    
    //결제정보를 결제내역으로 insert
    @ResponseBody
    @PostMapping("/orderDetail")
    public String insertOrderDetail(@RequestBody MvOrderDetailVO orderDetail) {
        int result = mvorderdetailService.insertOrderDetail(orderDetail);
        if (result == 1) {
            return "Order detail inserted 성공";
        } else {
            return "insert order detail 실패";
        }
    }

    /*
//    영수증 테이블 http://localhost:9090/api/mvorderdetail/selected
    @GetMapping("/selected")
    @ResponseBody
    public List<MvorderdetailVO> getSelectedOrderDetails(UserVO uvo) {
        return mvorderdetailService.getSelectedOrderDetails(uvo);
    }
    */
    
    //결제내역페이지 
    //결제내역을 조회하고 그정보를 모델에추가하고 뷰로 포워딩
    @GetMapping("/orderDetails")
    public String showOrderDetails(@SessionAttribute(value = "userLogin", required = false) UserLoginVO uvo ,Model model) {
        log.info("orderDetails 결제내역페이지");
        log.info("결제페이지 로그확인용 user정보는?" + uvo);
 
        List<MvOrderDetailVO> orderDetails = mvorderdetailService.getSelectedOrderDetails(uvo);

        model.addAttribute("orderDetails", orderDetails);
        log.info("orderDetails를 확인해봐야겠다." + orderDetails);
        String url = "/userLogin/orderDetail";  // orderDetails.jsp 뷰로 포워딩
        return url;
    }
}
