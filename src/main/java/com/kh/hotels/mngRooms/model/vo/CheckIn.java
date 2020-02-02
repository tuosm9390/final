package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CheckIn implements java.io.Serializable {
	
	private int clientNo;
	private String clientName;
	private String clientPhone;
	private String clientEmail;
	private String checkinTime;
	private String checkoutTime;
	private boolean rentYN;
	private String lentYN;
	private String personCnt;
	private String selRoomType;
	private String selRoomNum;

	private String selSvc;
	private String svcCnt; 
	private String svcFee;
	private String svcTot;

	private int totalRoom;
	private int totalSvc;
	private int totalPrc;
	private String lastPayDay;

	private int creditCard;
	private int cash;
	private int account;
	private int totalPay;
	private int refund;
	
	private String payWay;
	private int payWayMoney;
	private String svcCode;
	private int svcCount;

}
