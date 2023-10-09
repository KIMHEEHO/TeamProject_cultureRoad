package com.culture.api.movie.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.culture.api.movie.vo.ApiMovieCredits;
import com.culture.api.movie.vo.ApiMovieVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ApiMovieServiceImpl implements ApiMovieService {

	@Autowired
	private RestTemplate restTemplate;
	private final String API_KEY = "a56acee23242b46d2a8b07c40f907286";
	
	@Override
	public List<ApiMovieVO> getNowPlayingMovies() {
		int page=1;
		String url = "https://api.themoviedb.org/3/movie/now_playing?api_key=" + API_KEY +"&language=ko-KO&watch_region=kr&page="+page;
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		String responseBody = response.getBody();
		
		List<ApiMovieVO> data = new ArrayList<>();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode rootNode = objectMapper.readTree(responseBody);
            JsonNode results = rootNode.path("results");

            for (JsonNode node : results) {
            	ApiMovieVO movieVO = new ApiMovieVO();
                
            	String title = node.path("title").asText();
                String overview = node.path("overview").asText();
                if(overview=="") {
                	overview = "준비중 입니다.";
                }
                String releaseDate = node.path("release_date").asText();
                String posterPath = node.path("poster_path").asText();
                String id = node.path("id").asText();

                movieVO.setTitle(title);
                movieVO.setOverview(overview);
                movieVO.setRelease_date(releaseDate);
                movieVO.setPoster_path(posterPath);
                movieVO.setId(id);
                
                data.add(movieVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return data;
	}
	
	@Override
	public ApiMovieVO getMovieDetail(String id) {
		String url = "https://api.themoviedb.org/3/movie/" + id + "?api_key=" + API_KEY + "&language=ko-KO";
		ApiMovieVO movie = restTemplate.getForObject(url, ApiMovieVO.class);
	    return movie;
	}
	
	@Override
	public List<ApiMovieVO>  searchMovie(String searchTitle) { /*primary_release_year=2023&*/
		String url = "https://api.themoviedb.org/3/search/movie?api_key=2f086445ca13875b5bf9a9f2fb2bfa36&language=ko-KO&include_adult=false&region=kr&year=2023&query="+searchTitle;
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		String responseBody = response.getBody();
		
		List<ApiMovieVO> data = new ArrayList<>();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode rootNode = objectMapper.readTree(responseBody);
            JsonNode results = rootNode.path("results");

            for (JsonNode node : results) {
            	ApiMovieVO movieVO = new ApiMovieVO();
                
            	String title = node.path("title").asText();
                String overview = node.path("overview").asText();
                if(overview=="") {
                	overview = "준비중 입니다.";
                }
                String releaseDate = node.path("release_date").asText();
                String posterPath = node.path("poster_path").asText();
                String id = node.path("id").asText();

                movieVO.setTitle(title);
                movieVO.setOverview(overview);
                movieVO.setRelease_date(releaseDate);
                movieVO.setPoster_path(posterPath);
                movieVO.setId(id);
                
                data.add(movieVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return data;
	}
	
	@Override
	public List<ApiMovieVO> getPopularMovies() {
		int page=1;
		String url = "https://api.themoviedb.org/3/movie/popular?api_key=" + API_KEY +"&language=ko-KO&watch_region=kr&page="+page;
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		String responseBody = response.getBody();
		
		List<ApiMovieVO> data = new ArrayList<>();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode rootNode = objectMapper.readTree(responseBody);
            JsonNode results = rootNode.path("results");
            
            int i = 1;
            for (JsonNode node : results) {
            	ApiMovieVO movieVO = new ApiMovieVO();
            	
            	String adult = node.path("adult").asText();
            	String backdrop_path = node.path("backdrop_path").asText();
            	String title = node.path("title").asText();
                String overview = node.path("overview").asText();
                String vote_average = node.path("vote_average").asText();
                String vote_count = node.path("vote_count").asText();
                if(overview=="") {
                	overview = "준비중 입니다.";
                }
                String releaseDate = node.path("release_date").asText();
                String posterPath = node.path("poster_path").asText();
                String id = node.path("id").asText();
                String original_title = node.path("original_title").asText();
                
                movieVO.setAdult(Boolean.parseBoolean(adult));
                movieVO.setBackdrop_path(backdrop_path);
                movieVO.setTitle(title);
                movieVO.setOverview(overview);
                movieVO.setRelease_date(releaseDate);
                movieVO.setPoster_path(posterPath);
                movieVO.setId(id);
                movieVO.setVote_average(vote_average);
                movieVO.setVote_count(Integer.parseInt(vote_count));
                movieVO.setRank(i);
                movieVO.setOriginal_title(original_title);
                
                data.add(movieVO);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return data;
	}
	
	@Override
	public List<ApiMovieVO> getUpcomingMovies() {
		int page=1;
		String url = "https://api.themoviedb.org/3/movie/upcoming?api_key=" + API_KEY +"&language=ko-KO&region=kr&page="+page;
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		String responseBody = response.getBody();
		
		List<ApiMovieVO> data = new ArrayList<>();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode rootNode = objectMapper.readTree(responseBody);
            JsonNode results = rootNode.path("results");

            for (JsonNode node : results) {
            	ApiMovieVO movieVO = new ApiMovieVO();
            	
            	String adult = node.path("adult").asText();
            	String backdrop_path = node.path("backdrop_path").asText();
            	String title = node.path("title").asText();
                String overview = node.path("overview").asText();
                String vote_average = node.path("vote_average").asText();
                String vote_count = node.path("vote_count").asText();
                if(overview=="") {
                	overview = "준비중 입니다.";
                }
                String releaseDate = node.path("release_date").asText();
                String posterPath = node.path("poster_path").asText();
                String id = node.path("id").asText();
                String original_title = node.path("original_title").asText();
                
                movieVO.setAdult(Boolean.parseBoolean(adult));
                movieVO.setBackdrop_path(backdrop_path);
                movieVO.setTitle(title);
                movieVO.setOverview(overview);
                movieVO.setRelease_date(releaseDate);
                movieVO.setPoster_path(posterPath);
                movieVO.setId(id);
                movieVO.setVote_average(vote_average);
                movieVO.setVote_count(Integer.parseInt(vote_count));
                data.add(movieVO);
                movieVO.setOriginal_title(original_title);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return data;
	}
	
	@Override
	public List<ApiMovieCredits> getMovieCredits(String id) {
		int page=1;
		String url = "https://api.themoviedb.org/3/movie/" + id + "/credits?language=ko-KO&api_key=" + API_KEY;
		
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		String responseBody = response.getBody();
		
		List<ApiMovieCredits> data = new ArrayList<>();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode rootNode = objectMapper.readTree(responseBody);
			JsonNode results = rootNode.path("cast");
			
			for (JsonNode node : results) {
				ApiMovieCredits movieVO = new ApiMovieCredits();
				
				String gender = node.path("gender").asText();
				String known_for_department = node.path("known_for_department").asText();
				String name = node.path("name").asText();
				String original_name = node.path("original_name").asText();
				String cast_id = node.path("cast_id").asText();
				String character = node.path("character").asText();
				String credit_id = node.path("credit_id").asText();
				String order = node.path("order").asText();
				String profile_path = node.path("profile_path").asText();
				
				movieVO.setGender(Integer.parseInt(gender));
				movieVO.setId(Integer.parseInt(id));
				movieVO.setKnown_for_department(known_for_department);
				movieVO.setName(name);
				movieVO.setOriginal_name(original_name);
				movieVO.setId(Integer.parseInt(id));
				movieVO.setCast_id(Integer.parseInt(cast_id));
				movieVO.setCharacter(character);
				movieVO.setCredit_id(credit_id);
				movieVO.setOrder(Integer.parseInt(order));
				movieVO.setProfile_path(profile_path);
				data.add(movieVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		log.info("adfasdfasf"+data.toString());
		return data;
	}
	
	@Override
	public ApiMovieVO SelectReservationDate(String id) {
		String url = "https://api.themoviedb.org/3/movie/" + id + "?api_key=" + API_KEY + "&language=ko-KO";
		ApiMovieVO movie = restTemplate.getForObject(url, ApiMovieVO.class);
		return movie;
	}
	
	@Override
	public ApiMovieVO MovieSeatBooking(String id) {
		String url = "https://api.themoviedb.org/3/movie/" + id + "?api_key=" + API_KEY + "&language=ko-KO";
		ApiMovieVO movie = restTemplate.getForObject(url, ApiMovieVO.class);
		return movie;
	}
}