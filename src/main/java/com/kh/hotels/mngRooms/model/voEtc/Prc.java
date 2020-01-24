package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Prc {

	private int rpNo;
	private int rtNo;
	private String termType;
	private String dayType;
	private String stayType;
	private int price;
	private String regDate;
	
}
