package com.kh.hotels.mngReserv.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceRsv {

	private String rsvNo;
	private String svcCode;
	private int svcCnt;
	private String status;
	private String modDate;
	
}
