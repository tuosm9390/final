package com.kh.hotels.mngReserv.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationCheck {
	private String rsvNo; // 예약번호
	private int mno; // 예약자회원번호
	private int rmNo; // 객실번호
	private String userName; // 예약자명
	private String phone; // 전화번호
	private String email; // 이메일
	private int stayPrice; // 숙박요금
	private Date checkIn; // 체크인날짜
	private Date checkOut; // 체크아웃날짜
	private java.util.Date rsvDate; // 예약날짜
	private java.util.Date modDate; // 수정날짜
	private String checkInTime; // 체크인시간
	private String rtName; // 객실명
	private int adult; // 대인인원
	private int child; // 소인인원
	private String rsvReq; // 요청사항
	private String rsvOption; // 조식옵션
	private int num;
}
