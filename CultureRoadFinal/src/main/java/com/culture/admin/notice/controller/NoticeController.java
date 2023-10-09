package com.culture.admin.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.culture.admin.login.vo.AdminLoginVO;
import com.culture.admin.notice.service.NoticeService;
import com.culture.admin.notice.vo.NoticeVO;
import com.culture.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/notice/*")
@Slf4j
public class NoticeController {
	
	@Setter(onMethod_ = @Autowired)
	public NoticeService noticeService;
	
	@GetMapping("/board")
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		
		List<NoticeVO> list = noticeService.noticeList(nvo);
		model.addAttribute("notice", list);
		
		// 총 레코드 수 확인
		int total = noticeService.noticeCnt(nvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(nvo, total));
		
		log.info("공지 게시판 호출"+ total);
		return "admin/notice/noticeBoard";
	}
	
	@PostMapping("/noticeDetail")
	public String noticeDetail(NoticeVO nvo, Model model) {
		/*noticeService.readCntUpdate(nvo);*/
		NoticeVO detail = noticeService.noticeDetail(nvo);
		log.info("공지 게시판 자세히 호출 : " + detail);
		model.addAttribute("detail", detail);
		
		return "admin/notice/boardDetail";
	}
	
	@PostMapping("/noticeDelete")
	public String noticeDelete(NoticeVO nvo) {
		noticeService.noticeDelete(nvo);
		return "redirect:/admin/notice/board";
	}
	
	@GetMapping("/noticeInserForm")
	public String noticeInsertForm() {
		return "admin/notice/noticeInsert";
	}
	
	@PostMapping("/noticeInsert")
	public String noticeInsert(NoticeVO nvo) {
		noticeService.noticeInsert(nvo);
		return "redirect:/admin/notice/board";
	}
	
	@PostMapping("/noticeUpdateForm")
	public String noticeUpdateForm(NoticeVO nvo, Model model) {
		NoticeVO vo = noticeService.noticeDetail(nvo);
		vo.setNoc_content(vo.getNoc_content().toString().replaceAll("<br />", "\n"));
		model.addAttribute("detail", vo);
		return "admin/notice/noticeUpdate";
	}
	
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(NoticeVO nvo, Model model) {
		noticeService.noticeUpdate(nvo);
		NoticeVO detail = noticeService.noticeDetail(nvo);
		log.info("공지 게시판 자세히 호출 : " + detail);
		model.addAttribute("detail", detail);
		
		return "admin/notice/boardDetail";
	}
	
}
