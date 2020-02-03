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
	private String rmNum; // 객실호실
	private int rmNo;
	private int rtNo; // 방유형번호
	private String rtName; // 방이름
	private int mno;
	private Date checkIn;
	private Date checkOut;
	private String stayStatus;
	private String stayType;
	private int price;
	private int payment;
	private String modDate;
	private String rsvNo;
	private String rsvDate;
	
}
