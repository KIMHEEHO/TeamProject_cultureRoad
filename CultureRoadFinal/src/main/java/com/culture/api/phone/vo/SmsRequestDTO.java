package com.culture.api.phone.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SmsRequestDTO {
	private String type;
	private String contentType;
	private String countryCode;
	private String content;
	private String from;
	private List<MessageDTO> messages;
}
	