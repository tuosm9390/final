package com.kh.hotels.mngClient.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueSearchCondition {
	
	private String clientName;
	private String clientPhone;
	private String queTitle;
	private String queType;

}
