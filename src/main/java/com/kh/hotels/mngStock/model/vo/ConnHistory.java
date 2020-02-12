package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConnHistory {

	private String cnCode;
	private String modCol;
	private String modDate;
	private String befData;
	private String aftData;
	private String modRsn;
	
}
