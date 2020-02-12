package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderHisDetail implements java.io.Serializable {

	private String rptDate;
	private String name;
	private int ino;
	private String lcategory;
	private String mcategory;
	private String scategory;
	private String iname;
	private int up;
	private int vat;
	private int vos;
	private String cnname;
	private int amount;
	
	
}
