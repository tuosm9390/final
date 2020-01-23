package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	
	private int rmNo;
	private int rtNo;
	private String termType;
	private String dayType;
	private String stayType;
	private int price;
	private String regDate;
	private String rmStatus;

}
