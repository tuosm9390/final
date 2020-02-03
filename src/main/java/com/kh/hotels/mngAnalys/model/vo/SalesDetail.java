package com.kh.hotels.mngAnalys.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SalesDetail {
	private String rsvNo; // 예약번호
	private int rtNo; // 방유형번호
	private String rtName; // 방이름
	private int rmNo; // 방번호
	private String rmNum; // 객실호실
	private int mno; // 사용자번호
	private String name; // 고객명
	private Date checkIn; // 체크인날짜
	private Date checkOut; // 체크아웃날짜
	private int price; // 숙박요금
	private String rsvDate; // 예약날짜
}
