package com.kh.hotels.mngReserv.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {

	private String rsvNo; // 예약번호
	private int rmNo; // 방번호
	private String rmNum; // 객실호실
	private int mno; // 사용자번호
	private Date checkIn; // 체크인날짜
	private Date checkOut; // 체크아웃날짜
	private int stayPrice; // 숙박요금
	private String rsvDate; // 예약날짜
	private String rsvStatus; // 예약상태
	private String rsvWay; // 예약방법
	private int adult; // 대인인원
	private int child; // 소인인원
	private String checkInTime; // 체크인시간

}
