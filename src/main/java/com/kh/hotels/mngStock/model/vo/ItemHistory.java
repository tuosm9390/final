package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemHistory {

	private int ino;
	private String modDate;
	private String modCol;
	private String befData; 
	private String aftData;
	private String modRsn;
	private int unit; 
	private String befName;
	private String aftName;
	private String befStrgName;
	private String aftStrgName;
	private String befRmNum;
	private String aftRmNum;
	private String iname;
	private String type;
	private String amount;
	
	
}
