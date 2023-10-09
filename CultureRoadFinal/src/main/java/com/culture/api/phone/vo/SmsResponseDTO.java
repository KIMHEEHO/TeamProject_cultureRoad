package com.culture.api.phone.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SmsResponseDTO {
	private String requestId;
	private LocalDateTime requestTime;
	private String statusCode;
	private String statusName;
	private String createSmsKey;
}
