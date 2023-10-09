package com.culture.admin.board.controller;

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
import com.culture.user.board.service.CultureBoardService;
import com.culture.user.board.service.CultureReplyService;
import com.culture.user.board.vo.CultureBoardVO;
import com.culture.user.board.vo.CultureReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/culture/*")
@Slf4j
public class AdminCultureBoardController {
	
	@Setter(onMethod_ = @Autowired)
	public CultureBoardService cultureBoardService;
	
	@Setter(onMethod_ = @Autowired)
	public CultureReplyService cultureReplyService;
	
	@GetMapping("/board")
	public String CultureBoardList(@ModelAttribute CultureBoardVO cvo, Model model, @ModelAttribute CultureReplyVO crvo) {
		
		List<CultureBoardVO> list = cultureBoardService.cultureBoardList(cvo);
		model.addAttribute("board", list);
		
		// 총 레코드 수 확인
		int total = cultureBoardService.cultureBoardtotal(cvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(cvo, total));
		log.info("영화 자유게시판 호출" + total);
		return "admin/cultureBoard/cultureBoard";
	}
	
	@PostMapping("/boardHidden")
	public String cultureBoardHidden(@ModelAttribute CultureBoardVO cvo, @RequestParam("pageNum") int pageNum) {
		cultureBoardService.cultureHidden(cvo);
		//String search = cvo.getKeyword();
		return "redirect:/admin/culture/board?pageNum="+ pageNum +"&amount=15";
	}
	
	@GetMapping("/boardDetail")
	public String mvBoardDetail(CultureBoardVO cvo, Model model) {
		
		CultureBoardVO detail = cultureBoardService.cultureBoardDetail(cvo);
		detail.setCtBoContent(detail.getCtBoContent().toString().replaceAll("\n", "<br />"));
		model.addAttribute("detail", detail);

		return "admin/cultureBoard/cultureBoardDetail";
	}
	
	@GetMapping("/all")
	public String noticeDetail(CultureReplyVO crvo, Model model) {
		
		List<CultureReplyVO> reply = cultureReplyService.cultureReplyAllList(crvo);
		// 총 레코드 수 확인
		int total = cultureReplyService.cultureReplyTotal(crvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(crvo, total));
		for(CultureReplyVO i : reply) {
			i.setCtReContent(i.getCtReContent().toString().replaceAll("\n", "<br />"));
		}
		model.addAttribute("reply", reply);

		return "admin/cultureBoard/cultureReply";
	}
	
	@PostMapping("/replyHidden")
	public String mvReplyHidden(@ModelAttribute CultureReplyVO crvo, @RequestParam("pageNum") int pageNum) {
		cultureReplyService.cultureReplyHidden(crvo);
		
		return "redirect:/admin/culture/all?pageNum=" + pageNum + "&amount=15";
	}
	
}
