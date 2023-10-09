package com.culture.user.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.api.payment.service.MvorderdetailService;
import com.culture.api.payment.vo.MvOrderDetailVO;
import com.culture.user.login.service.UserLoginService;
import com.culture.user.login.vo.UserLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("userLogin/*")
@SessionAttributes("userLogin")
@Slf4j
public class UserLoginController {
	
	@Setter(onMethod_ = @Autowired)
	public UserLoginService userService;
	
	@Setter(onMethod_ = @Autowired)
	public MvorderdetailService mvorderdetailService;
	
	@GetMapping("/loginUser")
	public String login() {
		log.info("로그인 페이지 성공");
		return "userLogin/loginUser";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public String loginForm(UserLoginVO uvo, String model) {
		log.info("정상 or 탈퇴 or 틀렸는지 가려보자고");
		UserLoginVO userLogin = userService.userLogin(uvo);	//로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login 
		log.info("확인" +userLogin);
		
		if(userLogin == null) {//세션에 안담김
			model = "1";
		} else if(userLogin.getUserDelete() == 1) {	//탈퇴회원
			model = "2";
		} else {//정상접근
			model = "3";
		}	
		return model;
	}

	  @PostMapping("/loginProcess") 
	  public String loginProcess(UserLoginVO uvo, Model model,RedirectAttributes ras) { 
		  log.info("이게 진짜 로그인이야 "); 
		  UserLoginVO userLogin = userService.userLogin(uvo); // 로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login
		  log.info("userLogin" + userLogin); 
		  String url;
		  if(userLogin != null) {
			  model.addAttribute("userLogin", userLogin);
			  log.info("로그인 성공");
			  url = "redirect:/";
		  } else {
			  log.info("알 수 없는 오류발생,, 모가 문제지?");
			  url = "/userLogin/login";
		  }
		  return url;
	  }


	@RequestMapping("/logout")
	   public String logout(SessionStatus sessionStatus) {
	      log.info("user 로그아웃 처리");
	      sessionStatus.setComplete();
	      return "redirect:/";
	   }
	
	@GetMapping("/signUpForm")
	public String signUpForm() {
		log.info("성공");
		return "userLogin/signUpForm";
	}
	
	@ResponseBody
	@PostMapping("/idChk")
	public String idChk(String model, UserLoginVO uvo) {
		log.info("idChk 실행");
		int idChk = userService.idChk(uvo);
		
		if(idChk==0) {
			model = "사용가능";
		} else {
			model = "불가능";
		}
		log.info(model.toString());
		return model;
	}
	
	@PostMapping("/signUp")
	public String signUp(UserLoginVO uvo) {
		log.info("회원가입폼전달완료");
		int result = userService.signUp(uvo);
		
		String url=null;
		
		if(result == 1) {
			url="userLogin/loginUser";
		} else {
			url="userLogin/signUpForm";
		}
		return url;
	}
	

	@GetMapping("/myPage")
	public String myPage() {
		log.info("마이페이지 진입성공");		
		return "userLogin/myPage";	
	}
	
	@GetMapping("/main")
	public String main() {
		log.info("메인페이지로 갈거야");
		return "redirect:/";
	}

	@GetMapping("/enterPw")
	public String enterPw() {
		log.info("정보수정을 위한 비밀번호 입력");
		return "userLogin/enterPw";
	}

	@ResponseBody
	@PostMapping("/pwChk")
	public String pwdConfirm(String model, UserLoginVO uvo) {
		log.info("pwChk 실행");
		int pwChk = userService.pwChk(uvo);
		log.info("id = " + uvo.getUserId());
		if(pwChk == 1) {
			model = "같다";
		} else {
			model = "다르다";
		}
		log.info(model.toString());
		return model;
	}
	

	@PostMapping("/updateMyPageForm")
	public String updateMyPageForm(UserLoginVO uvo) {
		log.info("마이페이지 수정폼이다");
		log.info("userId = " + uvo.getUserId());

		return "userLogin/updateMyPage";
	}


	@PostMapping("/updateMyPage") 
	public String updateMyPage(UserLoginVO uvo, Model model, SessionStatus sessionStatus) { 
		log.info("마이페이지 수정폼을 넘기고 있다." + uvo.getUserId()); 
		int result = userService.updateMyPage(uvo);
		log.info("마이페이지 수정폼을 넘겼다 result : " + result);
		String url=null;
		if(result == 1) {
			UserLoginVO newSession = userService.myPage(uvo);
			
			log.info(newSession.toString());
			model.addAttribute("userLogin", newSession);
			url =  "redirect:/userLogin/myPage";
		}
		return url;
	}
	
	@GetMapping("/enterPw2")
	public String enterPw2() {
		log.info("탈퇴를 위한 비밀번호 입력");
		return "userLogin/enterPw2";
	}
	
	@PostMapping("/deleteAccount")
	public String deleteAccount(UserLoginVO uvo, SessionStatus sessionStatus) {
		log.info("탈퇴쿼리문직전");
		int result = userService.deleteAccount(uvo);
		log.info("result : " + result);
		//log.info(uvo.getUserDelete());
		String url = null;
		if(result==1) {
			log.info("user 탈퇴성공");
			sessionStatus.setComplete();
		    url = "redirect:/";
		} else {
			log.info("user 탈퇴 실패");
			url = "userLogin/enterPw2";
		}
		return url;
	}
	

	

	//id 찾기 방법 선택 페이지로 이동
	@GetMapping("/findIdSelect")
	public String findIdSelect() {
		log.info("성공");
		return "userLogin/findIdSelect";
	}
	
	//email로 아이디 찾기 폼
	@GetMapping("/findIdEmailForm")
	public String findIdEmailForm() {
		log.info("성공");
		return "userLogin/findIdEmailForm";
	}
	
	//입력한 정보가 기존의 정보와 같은지 확인
	@ResponseBody
	@PostMapping("/personalInfoEmail") 
	public String personalInfoEmail(UserLoginVO uvo) {
		int result = userService.personalInfoEmail(uvo); 
		  if(result == 1) {
			  return "같다";
		  }else {
			  return "다르다";
		  }
	  }
	
	//아이디 조회해서 userIdInfo에 담아서 사용자한테 보여주러 간다.
	@PostMapping("/findId")
	public String findId(Model model, UserLoginVO uvo) {
		UserLoginVO userIdInfo = userService.findId(uvo);
		String url =null;
		if(userIdInfo != null) {
			model.addAttribute("userIdInfo", userIdInfo);
			url = "/userLogin/userIdInfoEmail";
		}
		return url;
	}
	
	
	//id 사용자에게 보여준다.
	@GetMapping("/userIdInfo")
	public String userIdInfo() {
		return "userLogin/userIdInfo";
	}
	
	//비밀번호 재설정폼 
	@GetMapping("/pwReset")
	public String pwReset() {
		return "userLogin/pwReset";
	}
	
	//phone으로 아이디 찾기 폼
	@GetMapping("/findIdPhoneForm")
	public String findIdPhoneForm() {
		log.info("성공");
		return "userLogin/findIdPhoneForm";
	}
	

	//비밀번호 찾기 방법 선택 페이지로 이동
	@GetMapping("/findPwSelect")
	public String findPwSelect() {
		log.info("성공");
		return "userLogin/findPwSelect";
	}
	
	//email로 비밀번호 찾기 폼
	@GetMapping("/findPwEmailForm")
	public String findPwEmailForm() {
		log.info("성공");
		return "userLogin/findPwEmailForm";
	}
	
	//입력한 정보가 기존의 정보와 같은지 확인
	@ResponseBody
	@PostMapping("/personalPwInfoEmail") 
	public String personalPwInfoEmail(UserLoginVO uvo) {
		int result = userService.personalPwInfoEmail(uvo); 
		  if(result == 1) {
			  return "같다";
		  }else {
			  return "다르다";
		  }
	  }
	
	@ResponseBody
	@PostMapping("/personalInfoPhone")
	public String personalInfoPhone(UserLoginVO uvo) {
		int result = userService.personalInfoPhone(uvo);
		if(result == 1) {
			return "같다";
		} else {
			return "다르다";
		}
	}
	
	//아이디 조회해서 userIdInfo에 담아서 사용자한테 보여주러 간다.
	@PostMapping("/userIdInfoPhone")
	public String findIdPhone(Model model, UserLoginVO uvo) {
		UserLoginVO userIdInfo = userService.findIdPhone(uvo);
		String url =null;
		if(userIdInfo != null) {
			model.addAttribute("userIdInfo", userIdInfo);
			url = "/userLogin/userIdInfoPhone";
		}
		return url;
	}
	

	@PostMapping("/updatePw") 
	public String updatePw(UserLoginVO uvo) {
		int result = userService.updatePw(uvo);
		String url=null;
		if(result == 1) {
			url = "redirect:/";
		}
		return url;
	}
		
	//id 사용자에게 보여준다.
	@GetMapping("/userPwInfo")
	public String userPwInfo() {
		return "userLogin/userPwInfo";
	}
	
	//phone으로 비밀번호 찾기 폼
	@GetMapping("/findPwPhoneForm")
	public String findPwPhoneForm() {
		log.info("성공");
		return "userLogin/findPwPhoneForm";
	}
	
	//입력한 정보가 기존의 정보와 같은지 확인
	@ResponseBody
	@PostMapping("/personalPwInfoPhone") 
	public String personalPwInfoPhone(UserLoginVO uvo) {
		int result = userService.personalPwInfoPhone(uvo); 
		  if(result == 1) {
			  return "같다";
		  }else {
			  return "다르다";
		  }
	  }
	
	@GetMapping("/orderDetail")
	public String orderDetail() {
		log.info("나의 결제정보를 내놔!");
		return "/userLogin/orderDetail";
	}
		
	@GetMapping("/myOrderList")
	public String myOrderList(@SessionAttribute(value = "userLogin", required = false) UserLoginVO uvo ,Model model) {
		log.info("나의 예매내역 진입");

		List<MvOrderDetailVO> orderDetails = mvorderdetailService.getSelectedOrderDetails(uvo);
		model.addAttribute("orderDetails", orderDetails);
        log.info("orderDetails를 확인해봐야겠다." + orderDetails);
		return "/userLogin/myOrderList";
	}
	

}
