package com.kh.hotels.mngClient.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StayAndRsv {

	private String checkIn;
	private String checkOut;
	private int rmNo;
	private String rmNum; // 객실호실	private int rmNo;
	private int price;
	private String rsvDate;
	private String status;
	
}


