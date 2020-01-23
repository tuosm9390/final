package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CalHis {

	private String modCol;
	private String modDate;
	private int calNo;
	private String befData;
	private String aftData;
	private String modRsn;
	
}
