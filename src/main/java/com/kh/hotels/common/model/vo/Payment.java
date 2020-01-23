package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {

	private int pno;
	private String pway;
	private int price;
	private String payDate;
	private String payStatus;
	private String modDate;
	private String rsvStatus;
	private String rsvNo;
	private int stayNo;
	
}
