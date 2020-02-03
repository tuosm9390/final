package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomList implements java.io.Serializable {
	
	//객실정보 (ROOM)
	private int rmNo;				//객실 고유번호
	private String rmNum;			//객실 호실수
	private int floor;				//객실 층수
	private String rmStatus;		//객실 사용여부
	private int stdPer;				//기준인원
	
	//객실유형 (ROOM_TYPE)
	private int rtNo;				//객실유형 고유번호
	private String rtName;			//객실유형명 고유번호
	private int maxPer;				//최대수용인원

	//객실현황 (ROOM_STT)
	private String cleanStatus;		//객실 정비 상태
	
	//고객 (MEMBER)
	private int reservmno;			//예약 고객 고유번호
	private String reservname;		//예약 고객이름
	private int smno;				//투숙 고객 고유번호
	private String sname;			//투숙 고객이름
	private String reservphone;
	private String sphone;
	
	//투숙내역 (STAY)
	private int stayNo;				//투숙 고유번호
	private String scheckin;		//체크인일자
	private String scheckout;		//체크아웃일자
	private String stayStatus;		//투숙 완료여부 (N -> 객실현황으로 보여짐)
	private String stayType;		//투숙 or 대실 (STAY or LENT)
	private int stayPrice;			//투숙비용
	private String realCI;			//실제 체크인 시간

	//예약내역 (RSV)
	private String rsvNo;			//예약 코드
	private String rcheckin;		//체크인 예정일자
	private String rcheckout;		//체크아웃 예정일자
	private int rsvPrice;			//예약비용
	private String rsvStatus;		//예약상태 (Y -> 객실현황으로 보여짐)
	private String ciTime;			//체크인 예정시간 (노쇼시간 지난 경우, 노쇼 고객으로 처리되어 보여짐)
	
	//노쇼정책 (NOSHOW)
	private String nsUnit;			//노쇼 규정시간	
	
	//고장객실 (BROKEN_HIS)
	private String brkBegin;
	private String brkEnd;
	private String brkRsn;

}
