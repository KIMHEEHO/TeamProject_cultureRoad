package com.culture.user.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.culture.common.vo.PageDTO;
import com.culture.user.qna.service.QnaService;
import com.culture.user.qna.vo.UserQnaVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna/*")
public class QnaClientController {
	
		@Setter(onMethod_ = @Autowired)
		public QnaService qnaService;
		
		//글 목록 구현하기(페이징 처리 목록 조회)
		@GetMapping("/qnaClient")
		public String qnaList(@ModelAttribute UserQnaVO qvo,Model model) {
			
			//전체 레코드 조회
			List<UserQnaVO> qnaList = qnaService.qnaList(qvo);
			
			model.addAttribute("qnaList", qnaList);
			
			//전체 레코드 수 반환
			int total = qnaService.qnaListCnt(qvo);
			
			//페이징 처리
			model.addAttribute("pageMaker",new PageDTO(qvo, total));
			//new PageDTO(CommonVO 또는 CommonVO 하위 클래스의 인스턴스(BoardVO), 총레코드수)
			
			return "/userLogin/qna/qnaClient";
		}/**********************조회******************************/
			
		
		
		@PostMapping("/deleteClientQna")
		public String deleteQna(@RequestParam("qna_id") int qna_id) {
		    int result = 0;
		    String url = "";
			result = qnaService.deleteQna(qna_id);
		    
		    if (result == 1) {
		        url = "/qna/qnaClient";
		    } else {
		        url = "error";
		    }
		    
		    return "redirect:" + url;
		}
		
		
		

	
		
		//글쓰기 폼 출력
		@GetMapping("/questionForm")
		public String questionForm() { 
			log.info("questionForm 메서드 호출");
			return "/userLogin/qna/questionForm";
		}

		
		@PostMapping("/insertQna")
		public String insertQna(UserQnaVO qvo, Model model) throws Exception {
			log.info("insertQna 메서드 호출");
			
			String url="";
			
			int result = qnaService.insertQna(qvo);
			
			if(result == 1) {
				url="/qna/qnaClient";
			} else {
				url="/qna/questionForm";
			}
			
			return "redirect:"+url;
		}
		
	/**************************글쓰기/글쓰기폼*******************************/
		
		
		
		@GetMapping("/qnaUpdateForm")
		public String qnaUpdateForm(@RequestParam("qna_id") int qna_id, Model model) {
		    UserQnaVO qvo = qnaService.getQnaById(qna_id); // qna_id를 사용하여 해당 질문 정보를 조회합니다.
		    model.addAttribute("qvo", qvo);
		    return "qna/qnaUpdateForm";
		}
		
		
		@PostMapping("/updateQna")
		public String updateQna(UserQnaVO qvo, Model model) throws Exception {
			
			qnaService.updateQna(qvo);
			
			return "redirect:/qna/qnaClient";
		}
		


}


