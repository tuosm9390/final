package com.kh.hotels.mngStay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceUseHistory {

	private int stayNo;
	private String svcCode;
	private String modCol;
	private String modDate;
	private String befDate;
	private String aftDate;
	private String modRsn;
	
}
