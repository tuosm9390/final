package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StrgHistory {

	private String strgNo;
	private String modDate;
	private String modCol;
	private String befData;
	private String aftData;
	private String modRsn;
	
}
