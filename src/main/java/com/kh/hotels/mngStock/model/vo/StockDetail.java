package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StockDetail {
	private String lcategory;
	private String mcategory;
	private String scategory;
	private int ino;
	private int vos;
	private int vat;
	private int up;
	private String mfg;
	private String cnname;
	private String strgname;
	private String areaname;
}
