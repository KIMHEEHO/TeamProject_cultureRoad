package com.culture.api.phone.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.culture.api.phone.service.PhoneService;
import com.culture.api.phone.vo.MessageDTO;
import com.culture.api.phone.vo.SmsResponseDTO;
import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ApiPhoneController {
	private final PhoneService smsService;

	@PostMapping("sms/send")
	public SmsResponseDTO sendSms(MessageDTO messageDTO) throws UnsupportedEncodingException,
		URISyntaxException, NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {

		SmsResponseDTO responseDTO = smsService.sendSMS(messageDTO);
		return responseDTO;
	   }

}
