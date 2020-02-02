package com.kh.hotels.mngClient.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueFilter {

	private String all;
	private String online;
	private String offline;
	private String unQue;
	
}
