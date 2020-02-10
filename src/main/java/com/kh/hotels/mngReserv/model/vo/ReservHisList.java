package com.kh.hotels.mngReserv.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservHisList {
	
	private String rsvNo;
	private String rmType;
	private String rmNum;
	private String mname;
	private String phone;
	private String checkin;
	private String checkout;
	private String price;
	private int rsvPrc;
	private int rsvPay;
	private String rsvDate;
	private String modDate;
	private String rsvWay;
	private String rsvStatus;
	private String rfdPrice;
}
