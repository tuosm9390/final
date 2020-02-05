package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ModalClient implements java.io.Serializable {
	
    private int stayNo;
    private String rsvNo;
    private String timeCI;
	private String scheckin;
	private String scheckout;
	private String stayType;
	private int chargePrice;
	private int payPrice;
	private int stayPer;
	private int stayDays;
	private String realCI;
	
	private int clientNo;
	private String clientName;
	private String clientPhone;
	private String clientEmail;
	
	private int rmNo;
	private int rmNum;
	private int stdPer;
	private String roomType;
	private int rtNo;
	private int maxPer;
	
	private int svcNo;
	private String svcCode;
	private String svcName;
	private int svcPrice;
	private int useCnt;
	private String svcDate;

	private int pno;
	private String payWay;
	private int paymentFee;
	private String payDate;
	

}
