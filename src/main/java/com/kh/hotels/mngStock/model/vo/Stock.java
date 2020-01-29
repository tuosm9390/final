package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Stock {
	
	private String iname;
	private String scategory;
	private int amount;
	private int vos;
	private String mfg;
	private String cnname;
	private String type;
	private int cnt;
	
	
}
