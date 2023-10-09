package com.culture.api.movie.vo;

import java.util.List;

import lombok.Data;

@Data
public class ApiMovieVO {
	private Boolean adult;
	private String backdrop_path;
	private List<ApiMovieGenre> genres;
	private String homepage;
	private String id;
	private String imdb_id;
	private String overview;
	private String popularity;
	private String poster_path;
	private String release_date;
	private String runtime;
	private String title;
	private String vote_average;
	private int vote_count;
	private int rank;
	private String original_title;
}
