package com.kh.hotels.mngReserv.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {

	private String rsvNo;
	private int rmNo;
	private int mno;
	private Date checkIn;
	private Date checkOut;
	private int stayPrice;
	private String rsvDate;
	private String rsvStatus;
	private String rsvWay;
	private int adult;
	private int child;
	private String ciTime;
	
}
