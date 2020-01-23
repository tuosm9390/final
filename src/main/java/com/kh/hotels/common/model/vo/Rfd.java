package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rfd {

	private int rfdNo;
	private String ermType;
	private String dayType;
	private String rfdDate;
	private int rfdRate;
	private String hname;
	private String ltype;
	
}
