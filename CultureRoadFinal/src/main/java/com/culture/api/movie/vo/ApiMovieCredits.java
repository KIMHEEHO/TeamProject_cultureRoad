package com.culture.api.movie.vo;

import lombok.Data;

@Data
public class ApiMovieCredits {
	private Boolean adult;
	private int gender;
	private int id;
	private String known_for_department;
	private String name;
	private String original_name;
	private int popularity;
	private String profile_path;
	private int cast_id;
	private String character;
	private String credit_id;
	private int order;
}
