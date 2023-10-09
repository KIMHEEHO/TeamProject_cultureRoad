package com.culture.openapi.data.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OpenApiDTO {
	private String siteName;
	private String method;
	private String accept;
	private String contentType;
}
