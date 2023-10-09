package com.culture.openapi.data.service;

import java.net.URLEncoder;

import org.springframework.stereotype.Service;

import com.culture.common.openapi.URLConnectUtil;
import com.culture.openapi.data.vo.OpenApiDTO;

@Service
public class DataServiceImpl implements DataService {

	@Override
	public StringBuffer showList() throws Exception {
		StringBuffer site = new StringBuffer("http://api.kcisa.kr/openapi/CNV_060/request");
		site.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=e80fc622-f65e-427f-9233-e22900d98c3c");
		site.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8"));
		site.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", "application/xml", null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}

	@Override
	public StringBuffer showViewDetail(String title) throws Exception {
		StringBuffer site = new StringBuffer("http://api.kcisa.kr/openapi/CNV_060/request");
		site.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=e80fc622-f65e-427f-9233-e22900d98c3c");
		site.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		site.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", "application/xml", null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}

	
}
