package com.culture.api.phone.service;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.web.client.RestClientException;

import com.culture.api.phone.vo.MessageDTO;
import com.culture.api.phone.vo.SmsResponseDTO;
import com.fasterxml.jackson.core.JsonProcessingException;

public interface PhoneService {

	public SmsResponseDTO sendSMS(MessageDTO messageDto) throws JsonProcessingException, RestClientException, URISyntaxException,
	InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException;

 }
