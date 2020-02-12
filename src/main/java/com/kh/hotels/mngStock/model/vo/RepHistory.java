package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RepHistory {

	private int repNo;
	private String repBegin;
	private String repEnd;
	private String repStatus;
	private int rptNo;
	private String rpTitle;
	
	
}
