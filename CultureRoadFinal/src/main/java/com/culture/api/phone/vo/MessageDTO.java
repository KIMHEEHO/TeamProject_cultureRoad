package com.culture.api.phone.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MessageDTO {
	private String to;
	private String content;
}
