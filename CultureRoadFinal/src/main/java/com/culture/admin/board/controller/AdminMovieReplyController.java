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
import com.culture.user.board.service.MovieReplyService;
import com.culture.user.board.vo.MovieBoardVO;
import com.culture.user.board.vo.MovieReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/reply/*")
@Slf4j
public class AdminMovieReplyController {
	
	@Setter(onMethod_ = @Autowired)
	public MovieReplyService movieReplyService;
	
	@GetMapping("/all")
	public String noticeDetail(MovieReplyVO mrvo, Model model) {
		
		List<MovieReplyVO> mvReply = movieReplyService.movieReplyAllList(mrvo);
		// 총 레코드 수 확인
		int total = movieReplyService.movieReplyTotal(mrvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(mrvo, total));
		for(MovieReplyVO i : mvReply) {
			i.setMv_re_content(i.getMv_re_content().toString().replaceAll("\n", "<br />"));
		}
		model.addAttribute("mvReply", mvReply);

		return "admin/movieBoard/mvReply";
	}
	
	@PostMapping("/mvReplyHidden")
	public String mvReplyHidden(@ModelAttribute MovieReplyVO mrvo, @RequestParam("pageNum") int pageNum) {
		movieReplyService.movieReplyHidden(mrvo);
		
		return "redirect:/admin/reply/all?pageNum=" + pageNum + "&amount=15";
	}
	
}
