package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rfd implements java.io.Serializable {

	private int rfdNo;			//환불고유번호
	private String termType;	//기간구분
	private String dayType;		//요일구분
	private String rfdDate;		//환불시점
	private int rfdRate;		//공제비율
	private String hname;		//호텔명
	private String ltype;		//정책구분
	
	private String reservNo;	//전송용 : 예약번호
	private int rfdMoney;		//전송용 : 환불금액
	private String payDate;		//전송용 : 결제일시
	private int rfdType;		//전송용 : 환불타입 ( 0-예약취소 / 1-노쇼 )
	private int svcNo;			//전송용 : 환불하는 서비스
}
