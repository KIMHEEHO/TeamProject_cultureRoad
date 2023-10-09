package com.culture.api.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.culture.api.email.service.ApiEmailService;

import lombok.Setter;

@Controller
@RequestMapping("/userLogin/*")
public class ApiEmailController {
	
	@Setter(onMethod_ = @Autowired)
    public ApiEmailService randomStringService;
	
	//email 보내기
	@PostMapping("/sendRandomString")
	@ResponseBody
	public String sendRandomString(@RequestParam String userEmail) {
		String randomString = randomStringService.generateRandomString(userEmail);
		return randomString;
		}
	
	
}
