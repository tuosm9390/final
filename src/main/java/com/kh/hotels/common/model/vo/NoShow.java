package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoShow implements java.io.Serializable{

	private int nsNo;
	private String nsUnit;
	private int nsRate;
	private String hname;
	private String ltype;
	
}
