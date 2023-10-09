package com.culture.api.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.culture.api.movie.service.ApiMovieService;
import com.culture.api.movie.vo.ApiMovieCredits;
import com.culture.api.movie.vo.ApiMovieVO;
import com.culture.user.comment.service.CommentService;
import com.culture.user.comment.vo.UserCommentVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ApiController {

	
	@Autowired
	private ApiMovieService apiMovieService;
	
	@Setter(onMethod_ = @Autowired)
	private CommentService commentService;
	
	
	@GetMapping("/")
	public String nowPlayingMovie(Model model) {
		List<UserCommentVO> best = commentService.bestComment();
		log.info("asfdasdf" + best.toString());
		List<ApiMovieVO> movies = apiMovieService.getNowPlayingMovies();
		List<ApiMovieVO> popular = apiMovieService.getPopularMovies();
		List<ApiMovieVO> upcoming = apiMovieService.getUpcomingMovies();
		model.addAttribute("movies",movies);
		model.addAttribute("popular",popular);
		model.addAttribute("upcoming",upcoming);
		model.addAttribute("best",best);
		
		return "index";
	}
	
	/*
	 * @PostMapping("/movieCredits/{id}") public String
	 * getMovieCredits(@PathVariable String id, Model model) { List<ApiMovieCredits>
	 * movies = apiMovieService.getMovieCredits(id); log.info("name 오기 성공~" );
	 * model.addAttribute("movies",movies);
	 * 
	 * return "movice/movieDetail"; }
	 */
	
	@PostMapping("/movieDetail/{id}")
	public String getDetail(@PathVariable String id, Model model) {
	    // 영화 정보 가져오기
	    ApiMovieVO movie = apiMovieService.getMovieDetail(id);  
	    // 크레딧 정보 가져오기
	    List<ApiMovieCredits> movies = apiMovieService.getMovieCredits(id);
	    // 영화 개요 처리
	    String overview = movie.getOverview();
	    if (overview == null || overview.isEmpty()) {
	        overview = "준비중 입니다.";
	    }
	    movie.setOverview(overview);
	    model.addAttribute("movie", movie);
	    model.addAttribute("movies", movies);
	    // "movie/movieDetail" 뷰로 이동
	    return "movie/movieDetail";
	}

	@PostMapping("/SelectReservationDate/{id}")
	public String SelectReservationDate(@PathVariable String id, Model model) throws Exception{
		ApiMovieVO movie = apiMovieService.SelectReservationDate(id);
		model.addAttribute("movie", movie);
		return "/movie/SelectReservationDate";
	}
	/*
	@PostMapping("/MovieSeatBooking/{id}")
	public String MovieSeatBooking(@PathVariable String id, Model model) throws Exception {
		ApiMovieVO movie = apiMovieService.MovieSeatBooking(id);
		model.addAttribute("movie",movie);
		return "movie/MovieSeatBooking";
	}
	*/
	@RequestMapping("/MovieSeatBooking/{id}")
	public String MovieSeatBooking(@PathVariable String id, Model model) throws Exception {
		ApiMovieVO movie = apiMovieService.MovieSeatBooking(id);
		model.addAttribute("movie",movie);
		return "movie/MovieSeatBooking";
	}

}
