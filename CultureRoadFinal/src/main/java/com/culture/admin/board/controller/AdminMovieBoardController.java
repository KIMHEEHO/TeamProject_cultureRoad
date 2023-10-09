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
import com.culture.user.board.service.MovieBoardService;
import com.culture.user.board.service.MovieReplyService;
import com.culture.user.board.vo.MovieBoardVO;
import com.culture.user.board.vo.MovieReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/movie/*")
@Slf4j
public class AdminMovieBoardController {
	
	@Setter(onMethod_ = @Autowired)
	public MovieBoardService movieBoardService;
	@Setter(onMethod_ = @Autowired)
	public MovieReplyService movieReplyService;
	
	@GetMapping("/mvBoard")
	public String MovieBoardList(@ModelAttribute MovieBoardVO mvo, Model model, @ModelAttribute MovieReplyVO mrvo) {
		
		List<MovieBoardVO> list = movieBoardService.movieBoardList(mvo);
		model.addAttribute("mvBoard", list);
		
		// 총 레코드 수 확인
		int total = movieBoardService.movieBoardtotal(mvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(mvo, total));
		log.info("영화 자유게시판 호출" + total);
		return "admin/movieBoard/mvBoard";
	}
	
	@PostMapping("/mvBoardHidden")
	public String mvBoardHidden(@ModelAttribute MovieBoardVO mvo, @RequestParam("pageNum") int pageNum) {
		movieBoardService.movieHidden(mvo);
		String search = mvo.getKeyword();
		return "redirect:/admin/movie/mvBoard?pageNum="+ pageNum +"&amount=15";
	}
	
	@GetMapping("/mvBoardDetail")
	public String mvBoardDetail(MovieBoardVO mvo, Model model) {
//		movieBoardService.movieBoardReadCntUpdate(mvo);
		
		MovieBoardVO detail = movieBoardService.movieBoardDetail(mvo);
		detail.setMv_bo_content(detail.getMv_bo_content().toString().replaceAll("\n", "<br />"));
		model.addAttribute("detail", detail);

		return "admin/movieBoard/mvBoardDetail";
	}
	
}
