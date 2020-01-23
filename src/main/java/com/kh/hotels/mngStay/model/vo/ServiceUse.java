package com.kh.hotels.mngStay.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceUse {

	private int stayNo;
	private String svcCode;
	private int useCnt;
	private String useStatus;
	private String regDate;
	
}
