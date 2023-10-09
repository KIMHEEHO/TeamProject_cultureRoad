package com.culture.openapi.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.culture.openapi.data.service.DataService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/data/*")
@Slf4j
public class DataController {

	@Setter(onMethod_ = @Autowired)
	private DataService dataService;
		
	@GetMapping(value="/showView")
	public String showView() throws Exception {
		log.info(" 리스트 ");
		return "/userLogin/show/showView";	//WEB-INF/views/userLogin/show/showView.jsp
	}
	
	@ResponseBody
	@GetMapping(value="/showList", produces = "application/xml; charset=UTF-8")
	public String showList() throws Exception {
		log.info(" 리스트 나와라 뚝딱");
		StringBuffer sb = dataService.showList();
		log.info(sb.toString());
		return sb.toString();
	}
	
	
	@ResponseBody
	@GetMapping(value="/showViewDetail/{title}", produces=MediaType.APPLICATION_XML_VALUE)
	public String showViewDetail(String title) throws Exception{
		log.info(" 상세페이지 ");
		
		StringBuffer sb = dataService.showViewDetail(title);
		log.info(sb.toString());
		return sb.toString();
		
	}
}
