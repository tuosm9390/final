package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rule implements java.io.Serializable {

	private int rno;
	private String hname;
	private String rcontent;
	
}
