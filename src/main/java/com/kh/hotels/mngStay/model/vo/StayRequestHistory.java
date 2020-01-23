package com.kh.hotels.mngStay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StayRequestHistory {

	private int stayNo;
	private String reqDate;
	private String reqContent;
	private String hdrDate;
	private String hdrStatus;
	
	
}
