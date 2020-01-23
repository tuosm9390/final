package com.kh.hotels.mngReserv.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceRsvHistory {

	private String rsvNo;
	private String svcCode;
	private String modCol;
	private String modDate;
	private String befData;
	private String aftData;
	private String modRsn;
	
}
