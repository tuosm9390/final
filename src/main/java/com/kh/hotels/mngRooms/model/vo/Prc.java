package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Prc implements java.io.Serializable{

	private int rpNo; 			// 기본요금고유번호
	private int rtNo; 			// 객실유형고유번호
	private String termType; 	// 기간구분
	private String dayType; 	// 요일
	private String stayType;	// 숙박구분
	private int price;			// 금액
	private String regDate;		// 등록일시

}
