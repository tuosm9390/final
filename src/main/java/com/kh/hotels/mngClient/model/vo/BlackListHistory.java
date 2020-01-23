package com.kh.hotels.mngClient.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlackListHistory {
	
	private String modCol;
	private int blackNo;
	private String modDate;
	private String befData;
	private String aftData;
	private String modRsn;

}
