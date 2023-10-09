package com.culture.api.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.culture.api.map.service.MapService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/map/*")
@Slf4j
public class MapController {
	
	@Setter(onMethod_ = @Autowired)
	private MapService mapService;
	
	@GetMapping(value="/mapView")
	public String mapView() {
		log.info("지도 호출");
		
		return "map/mapView";
	}
	@ResponseBody
	@GetMapping(value="/mapList", produces="application/xml; charset=UTF-8")
	public String mapList() throws Exception{
		log.info("map");
		StringBuffer sb = mapService.mapList();
		return sb.toString();
	}

}
