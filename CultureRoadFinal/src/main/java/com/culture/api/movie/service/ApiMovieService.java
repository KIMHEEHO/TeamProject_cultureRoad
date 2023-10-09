package com.culture.api.movie.service;

import java.util.List;

import com.culture.api.movie.vo.ApiMovieCredits;
import com.culture.api.movie.vo.ApiMovieVO;

public interface ApiMovieService {
	List<ApiMovieVO> getNowPlayingMovies();
	ApiMovieVO getMovieDetail(String id);
	List<ApiMovieVO> searchMovie(String searchTitle);
	List<ApiMovieVO> getPopularMovies();
	List<ApiMovieVO> getUpcomingMovies();
	List<ApiMovieCredits> getMovieCredits(String id);
	ApiMovieVO SelectReservationDate(String id);
	ApiMovieVO MovieSeatBooking(String id);
}
