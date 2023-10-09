package com.culture.user.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.culture.admin.notice.service.NoticeService;
import com.culture.admin.notice.vo.NoticeVO;
import com.culture.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class UserNoticeController {
	
	@Setter(onMethod_ = @Autowired)
	public NoticeService noticeService;

	@GetMapping("/list")
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		
		List<NoticeVO> list = noticeService.noticeList(nvo);
		model.addAttribute("notice", list);
		
		// 총 레코드 수 확인
		int total = noticeService.noticeCnt(nvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(nvo, total));
		
		log.info("공지 게시판 호출"+ total);
		return "userLogin/notice/noticeBoardFrame";
	}
	
	@PostMapping("/detail")
	public String noticeDetail(NoticeVO nvo, Model model) {
		noticeService.readCntUpdate(nvo);
		NoticeVO detail = noticeService.noticeDetail(nvo);
		log.info("공지 게시판 자세히 호출 : " + detail);
		model.addAttribute("detail", detail);
		
		return "userLogin/notice/noticeDetailFrame";
	}
}
