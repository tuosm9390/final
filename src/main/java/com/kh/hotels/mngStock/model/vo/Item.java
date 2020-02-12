package com.kh.hotels.mngStock.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Item {

	private int ino;
	private String iname;
	private int up;
	private int vat;
	private int vos;
	private String mfg;
	private int amount;
	private String itemStatus;
	private String brkStatus;
	private String useStatus;
	private int typeNo;
	private String cnCode;
	private String siteType;
	private String siteCode;
	private String strgNo;
	private int rmNo;
	private int areaNo;
	
}
