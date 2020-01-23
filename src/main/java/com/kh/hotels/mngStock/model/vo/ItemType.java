package com.kh.hotels.mngStock.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemType {

	private int typeNo;
	private String type;
	private String lcategory;
	private String mcategory;
	private String scategory;
	
}
