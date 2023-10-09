package com.culture.user.movieList.vo;


import java.util.List;

import lombok.Data;

@Data
public class MovieVO {
	
	private Boolean adult;
	private String backdrop_path;
	private List<Genre> genres;
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
	private String vote_count;
	
}
