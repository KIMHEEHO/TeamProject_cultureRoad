package com.culture.user.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.culture.common.vo.PageDTO;
import com.culture.user.board.service.CultureBoardService;
import com.culture.user.board.service.CultureReplyService;
import com.culture.user.board.vo.CultureBoardVO;
import com.culture.user.board.vo.CultureReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/culture/*")
public class CultureBoardController {

	@Setter(onMethod_ = @Autowired)
	private CultureBoardService cultureBoardService;
	
	@Setter(onMethod_ = @Autowired)
	private CultureReplyService cultureReplyService;
	
	
	@GetMapping("/board")
	public String CultureBoardList(@ModelAttribute CultureBoardVO cvo, Model model, @ModelAttribute CultureReplyVO crvo) {
		
		List<CultureBoardVO> list = cultureBoardService.cultureBoardList(cvo);
		model.addAttribute("ctBoard", list);
		
		// 총 레코드 수 확인
		int total = cultureBoardService.cultureBoardtotal(cvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(cvo, total));
		log.info("영화 자유게시판 호출" + total);
		return "userLogin/cultureBoard/cultureBoard";
	}
	
	@GetMapping("/boardDetail")
	public String noticeDetail(CultureBoardVO cvo, CultureReplyVO crvo, Model model) {
		cultureBoardService.cultureBoardReadCntUpdate(cvo);
		
		CultureBoardVO detail = cultureBoardService.cultureBoardDetail(cvo);
		List<CultureReplyVO> list = cultureReplyService.cultureReplyList(crvo);
		detail.setCtBoContent(detail.getCtBoContent().toString().replaceAll("\n", "<br />"));
		for(CultureReplyVO i : list) {
			i.setCtReContent(i.getCtReContent().toString().replaceAll("\n", "<br />"));
		}
		crvo.setCtBoNum(cvo.getCtBoNum());
		model.addAttribute("detail", detail);
		model.addAttribute("reply", list);

		return "userLogin/cultureBoard/cultureBoardDetail";
	}
	
	@PostMapping("/replyInsert")
	public String CultureReplyInsert(@ModelAttribute CultureReplyVO crvo) {
		cultureReplyService.cultureReplyInsert(crvo);
		int ctBoNum = crvo.getCtBoNum();
		return "redirect:/culture/boardDetail?ctBoNum="+ctBoNum;
	}
	
	@PostMapping("/replyUpdate")
	public String CultureReplyUpdate(CultureReplyVO crvo) {
		cultureReplyService.cultureReplyUpdate(crvo);
		int ctBoNum = crvo.getCtBoNum();
		return "redirect:/culture/boardDetail?ctBoNum="+ctBoNum;
	}
	@PostMapping("/replyDelete")
	public String CultureReplyDelete(CultureReplyVO crvo) {
		cultureReplyService.cultureReplyDelete(crvo);
		int ctBoNum = crvo.getCtBoNum();
		return "redirect:/culture/boardDetail?ctBoNum="+ctBoNum;
	}
	
	@GetMapping("/boardInsertForm")
	public String cultureInsertForm() {
		return "userLogin/cultureBoard/CultureBoardInsert";
	}
	
	@PostMapping("/boardInsert")
	public String cultureInsert(CultureBoardVO cvo, Model model) {
		cultureBoardService.cultureBoardInsert(cvo);
		return "redirect:/culture/board";
	}
	
	@PostMapping("/boardDelete")
	public String cultureBoardDelete(CultureBoardVO cvo) {
		cultureBoardService.cultureBoardDelete(cvo);
		return "redirect:/culture/board";
	}
	
	@PostMapping("/boardUpdateForm")
	public String cultureBoardUpdateForm(CultureBoardVO cvo, Model model ) {
		CultureBoardVO detail = cultureBoardService.cultureBoardDetail(cvo);
		model.addAttribute("update", detail);
		return "userLogin/cultureBoard/CultureBoardUpdate";
	}
	
	@PostMapping("/boardUpdate")
	public String cultureBoardUpdate(CultureBoardVO cvo) {
		cultureBoardService.cultureBoardUpdate(cvo);
		int ctBoNum = cvo.getCtBoNum();
		return "redirect:/culture/boardDetail?ctBoNum="+ctBoNum;
	}
}
