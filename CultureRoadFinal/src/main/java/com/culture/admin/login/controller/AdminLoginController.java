package com.culture.admin.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.admin.login.service.AdminLoginService;
import com.culture.admin.login.vo.AdminLoginVO;
import com.culture.api.payment.controller.PaymentCommonController;
import com.culture.api.payment.service.MvorderdetailService;
import com.culture.api.payment.service.PaymentService;
import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.api.payment.vo.PaymentVO;
import com.culture.common.vo.PageDTO;
import com.culture.user.login.service.UserLoginService;
import com.culture.user.login.vo.UserLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
@Slf4j
public class AdminLoginController extends PaymentCommonController {

	@Setter(onMethod_ = @Autowired)
	public AdminLoginService adminLoginService;
	
	@Setter(onMethod_ = @Autowired) 
	public UserLoginService userLoginService;
	
	@Setter(onMethod_ = @Autowired)
	public PaymentService paymentService;
	
	@Setter(onMethod_ = @Autowired)
	public MvorderdetailService mvorderdetailService;
	
	@GetMapping("/login/adminLogin")
	public String login() {
		return "/admin/login/adminLogin";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public String loginForm(AdminLoginVO alvo, String model) {
		log.info("정상 or 탈퇴 or 틀렸는지 가려보자고");
		AdminLoginVO adminLogin = adminLoginService.adminLogin(alvo);	//로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login 
		log.info("확인" +adminLogin);
		
		if(adminLogin != null) {
			model = "1";
		} else {
			model = "2";
		}	
		return model;
	}
	
	@PostMapping("/loginProcess") 
	public String loginProcess(AdminLoginVO alvo, Model model, RedirectAttributes ras) {
		log.info("관리자 로그인 세션 담기");
		AdminLoginVO adminLogin = adminLoginService.adminLogin(alvo);
		log.info("adminLogin 세션 확인 " + adminLogin);
		String url;
		if(adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			log.info("관리자 로그인 성공");
			url = "redirect:/admin/main";
		} else {
			log.info("로그인 실패");
			url = "/admin/login/adminLogin";
		}
		return url;
	}
	
	@RequestMapping("logout")
	   public String logout(SessionStatus sessionStatus) {
	      log.info("관리자 로그아웃 처리");
	      sessionStatus.setComplete();
	      return "redirect:/";                             
	   }

	@GetMapping("/main")
	public String main(Model model) {
		int userCnt = adminLoginService.userCount();
		int replyCnt = adminLoginService.replyCount();
		int commentCnt = adminLoginService.commentCount();
		int BoardCount = adminLoginService.boardCount();
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("replyCnt", replyCnt);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("BoardCount", BoardCount);
		return "/admin/main/adminDashboard";
	}

	@GetMapping("/user/manageUsers")
	public String userList(@ModelAttribute UserLoginVO uvo, Model model) {
		log.info("사용자 관리 성공하고싶슴다,,,");
		List<UserLoginVO> userList = userLoginService.userList(uvo);
		model.addAttribute("userList", userList);
		log.info("userList 받아와라 얼른 " + userList.toString());
		int total = userLoginService.userCnt(uvo);
		
		model.addAttribute("paging", new PageDTO(uvo, total));
		return "/admin/main/manageUsers";
		
	}

	@PostMapping("/user/userStatusUpdate")
	public String userHidden(@ModelAttribute UserLoginVO uvo, @RequestParam("pageNum") int pageNum) {
		log.info("유저상태 업데이트 되나요?");
		int result = userLoginService.userStatusUpdate(uvo);
		log.info("유저상태 업데이트 결과 내놔ㅏㅏㅏㅏㅏ "+result);
		return "redirect:/admin/user/manageUsers?pageNum="+ pageNum +"&amount=10";
	}
	

	@PostMapping("/user/manageUsers")
	public String managerUsers() {
		return "/admin/main/manageUsers";
	}
	
	
	@GetMapping("/paymentList")
    public String getAllOrderDetails(@ModelAttribute MvOrderDetailVO dvo, Model model,
    		@RequestParam(name="message", required = false) String message) {
    	log.info("사용자의 모든 결제정보를 받아올거야");
    	
    	if(message != null) {
    		model.addAttribute("message", message);
    	}
    	List<MvOrderDetailVO> order = mvorderdetailService.getAllOrderDetails(dvo);
        model.addAttribute("order", order);
        log.info("결제정보확인" + order);
        
        int total = mvorderdetailService.getAllOrderDetailsCnt(dvo);
        log.info("total" + total);
        model.addAttribute("paging", new PageDTO(dvo, total));
        
        return "admin/order/adminOrder";
    }
	
	@PostMapping("/paymentCancel")
    public void cancelPayment(HttpServletResponse response, PaymentVO payment, MvOrderDetailVO dvo) throws IOException {
        if(payment == null || payment.getMvPaymentId() == 0) {
            log.error("MvPaymentId 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
            return;
        }

        String accessToken = getPaymentAccessToken();

        // payment 유효성 확인 AccessToken 없는 경우
        /*
         * 결제 취소를 진행하기 위해서는 취소할 결제에 대한 정보가 필요하므로, 
         * payment 객체가 null이거나 mvPaymentId가 0이면 유효하지 않은 데이터로 간주하고 
         * 오류 처리를함
         */
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
                alertMessage(response, ADMIN_CANCEL_SUCCESS_MESSAGE);
            } else {
                alertMessage(response, CANCEL_FAIL_MESSAGE);
            }
        } else { // 결제 취소 실패
            log.error("결제 취소 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
        }
    }
	
	
}
