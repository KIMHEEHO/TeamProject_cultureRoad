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
import com.culture.user.board.service.MovieBoardService;
import com.culture.user.board.service.MovieReplyService;
import com.culture.user.board.vo.MovieBoardVO;
import com.culture.user.board.vo.MovieReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/movie/*")
@Slf4j
public class MovieBoardController {
	
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
		return "userLogin/movieBoard/mvBoardFrame";
	}
	
	@GetMapping("/mvBoardDetail")
	public String noticeDetail(MovieBoardVO mvo, MovieReplyVO mrvo, Model model) {
		movieBoardService.movieBoardReadCntUpdate(mvo);
		
		MovieBoardVO detail = movieBoardService.movieBoardDetail(mvo);
		List<MovieReplyVO> list = movieReplyService.movieReplyList(mrvo);
		detail.setMv_bo_content(detail.getMv_bo_content().toString().replaceAll("\n", "<br />"));
		for(MovieReplyVO i : list) {
			i.setMv_re_content(i.getMv_re_content().toString().replaceAll("\n", "<br />"));
		}
		mrvo.setMv_bo_num(mvo.getMv_bo_num());
		model.addAttribute("detail", detail);
		model.addAttribute("reply", list);

		return "userLogin/movieBoard/mvBoardDetailFrame";
	}
	
	@PostMapping("/replyInsert")
	public String MovieReplyInsert(@ModelAttribute MovieReplyVO mrvo) {
		movieReplyService.movieReplyInsert(mrvo);
		int bo_num = mrvo.getMv_bo_num();
		return "redirect:/movie/mvBoardDetail?mv_bo_num="+bo_num;
	}
	
	@PostMapping("/replyUpdate")
	public String MovieReplyUpdate(MovieReplyVO mrvo) {
		movieReplyService.movieReplyUpdate(mrvo);
		int bo_num = mrvo.getMv_bo_num();
		return "redirect:/movie/mvBoardDetail?mv_bo_num="+bo_num;
	}
	@PostMapping("/replyDelete")
	public String MovieReplyDelete(MovieReplyVO mrvo) {
		movieReplyService.movieReplyDelete(mrvo);
		int bo_num = mrvo.getMv_bo_num();
		return "redirect:/movie/mvBoardDetail?mv_bo_num="+bo_num;
	}
	
	@GetMapping("/mvBoardInsertForm")
	public String movieInsertForm() {
		return "userLogin/movieBoard/mvBoardInsert";
	}
	
	@PostMapping("/mvBoardInsert")
	public String movieInsert(MovieBoardVO mvo, Model model) {
		movieBoardService.movieBoardInsert(mvo);
		return "redirect:/movie/mvBoard";
	}
	
	@PostMapping("/mvBoardDelete")
	public String movieBoardDelete(MovieBoardVO mvo) {
		movieBoardService.movieBoardDelete(mvo);
		return "redirect:/movie/mvBoard";
	}
	
	@PostMapping("/mvBoardUpdateForm")
	public String movieBoardUpdateForm(MovieBoardVO mvo, Model model ) {
		MovieBoardVO detail = movieBoardService.movieBoardDetail(mvo);
		model.addAttribute("update", detail);
		return "userLogin/movieBoard/mvBoardUpdate";
	}
	
	@PostMapping("/mvBoardUpdate")
	public String movieBoardUpdate(MovieBoardVO mvo) {
		movieBoardService.movieBoardUpdate(mvo);
		int bo_num = mvo.getMv_bo_num();
		return "redirect:/movie/mvBoardDetail?mv_bo_num="+bo_num;
	}
}
