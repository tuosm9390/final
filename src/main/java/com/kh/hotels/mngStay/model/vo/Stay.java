package com.kh.hotels.mngStay.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Stay {

	private int stayNo;
	private int rmNo;
	private int mno;
	private Date checkIn;
	private Date checkOut;
	private String stayStatus;
	private String stayType;
	private int price;
	private int payment;
	private String modDate;
	private String rsvNo;
	
}
