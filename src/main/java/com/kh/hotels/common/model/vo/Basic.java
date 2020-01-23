package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Basic {

	private int bno;
	private String chkIn;
	private String chkOut;
	private String lentUnit;
	private String hname;
	private String ltype;
	
}
