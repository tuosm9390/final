package com.kh.hotels.mngRooms.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/
public class RoomList {
	
	//객실정보 (ROOM)
	private int rmNo;				//객실 고유번호
	private String rmNum;			//객실 호실수
	private int floor;				//객실 층수
	private String rmStatus;		//객실 사용여부
	
	//객실유형 (ROOM_TYPE)
	private int rtNo;				//객실유형 고유번호
	private String rtName;			//객실유형명 고유번호

	//객실현황 (ROOM_STT)
	private String cleanStatus;		//객실 정비 상태
	
	//고객 (MEMBER)
	private int rmno;				//예약 고객 고유번호
	private String rname;			//예약 고객이름
	private int smno;				//투숙 고객 고유번호
	private String sname;			//투숙 고객이름
	
	//투숙내역 (STAY)
	private int stayNo;				//투숙 고유번호
	private Date scheckin;			//체크인일자
	private Date scheckout;			//체크아웃일자
	private String stayStatus;		//투숙 완료여부 (N -> 객실현황으로 보여짐)
	private String stayType;		//투숙 or 대실 (STAY or LENT)
	private int stayPrice;			//투숙비용

	//예약내역 (RSV)
	private String rsvNo;			//예약 코드
	private Date rcheckin;			//체크인 예정일자
	private Date rcheckout;			//체크아웃 예정일자
	private int rsvPrice;			//예약비용
	private String rsvStatus;		//예약상태 (Y -> 객실현황으로 보여짐)
	private String ciTime;			//체크인 예정시간 (노쇼시간 지난 경우, 노쇼 고객으로 처리되어 보여짐)
	
	//노쇼정책 (NOSHOW)
	private String nsUnit;			//노쇼 규정시간

	public RoomList() {
		super();
	}

	public RoomList(int rmNo, String rmNum, int floor, String rmStatus, int rtNo, String rtName, String cleanStatus,
			int rmno2, String rname, int smno, String sname, int stayNo, Date scheckin, Date scheckout,
			String stayStatus, String stayType, int stayPrice, String rsvNo, Date rcheckin, Date rcheckout,
			int rsvPrice, String rsvStatus, String ciTime, String nsUnit) {
		super();
		this.rmNo = rmNo;
		this.rmNum = rmNum;
		this.floor = floor;
		this.rmStatus = rmStatus;
		this.rtNo = rtNo;
		this.rtName = rtName;
		this.cleanStatus = cleanStatus;
		rmno = rmno2;
		this.rname = rname;
		this.smno = smno;
		this.sname = sname;
		this.stayNo = stayNo;
		this.scheckin = scheckin;
		this.scheckout = scheckout;
		this.stayStatus = stayStatus;
		this.stayType = stayType;
		this.stayPrice = stayPrice;
		this.rsvNo = rsvNo;
		this.rcheckin = rcheckin;
		this.rcheckout = rcheckout;
		this.rsvPrice = rsvPrice;
		this.rsvStatus = rsvStatus;
		this.ciTime = ciTime;
		this.nsUnit = nsUnit;
	}

	public int getRmNo() {
		return rmNo;
	}

	public void setRmNo(int rmNo) {
		this.rmNo = rmNo;
	}

	public String getRmNum() {
		return rmNum;
	}

	public void setRmNum(String rmNum) {
		this.rmNum = rmNum;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getRmStatus() {
		return rmStatus;
	}

	public void setRmStatus(String rmStatus) {
		this.rmStatus = rmStatus;
	}

	public int getRtNo() {
		return rtNo;
	}

	public void setRtNo(int rtNo) {
		this.rtNo = rtNo;
	}

	public String getRtName() {
		return rtName;
	}

	public void setRtName(String rtName) {
		this.rtName = rtName;
	}

	public String getCleanStatus() {
		return cleanStatus;
	}

	public void setCleanStatus(String cleanStatus) {
		this.cleanStatus = cleanStatus;
	}

	public int getRmno() {
		return rmno;
	}

	public void setRmno(int rmno) {
		this.rmno = rmno;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public int getSmno() {
		return smno;
	}

	public void setSmno(int smno) {
		this.smno = smno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getStayNo() {
		return stayNo;
	}

	public void setStayNo(int stayNo) {
		this.stayNo = stayNo;
	}

	public Date getScheckin() {
		return scheckin;
	}

	public void setScheckin(Date scheckin) {
		this.scheckin = scheckin;
	}

	public Date getScheckout() {
		return scheckout;
	}

	public void setScheckout(Date scheckout) {
		this.scheckout = scheckout;
	}

	public String getStayStatus() {
		return stayStatus;
	}

	public void setStayStatus(String stayStatus) {
		this.stayStatus = stayStatus;
	}

	public String getStayType() {
		return stayType;
	}

	public void setStayType(String stayType) {
		this.stayType = stayType;
	}

	public int getStayPrice() {
		return stayPrice;
	}

	public void setStayPrice(int stayPrice) {
		this.stayPrice = stayPrice;
	}

	public String getRsvNo() {
		return rsvNo;
	}

	public void setRsvNo(String rsvNo) {
		this.rsvNo = rsvNo;
	}

	public Date getRcheckin() {
		return rcheckin;
	}

	public void setRcheckin(Date rcheckin) {
		this.rcheckin = rcheckin;
	}

	public Date getRcheckout() {
		return rcheckout;
	}

	public void setRcheckout(Date rcheckout) {
		this.rcheckout = rcheckout;
	}

	public int getRsvPrice() {
		return rsvPrice;
	}

	public void setRsvPrice(int rsvPrice) {
		this.rsvPrice = rsvPrice;
	}

	public String getRsvStatus() {
		return rsvStatus;
	}

	public void setRsvStatus(String rsvStatus) {
		this.rsvStatus = rsvStatus;
	}

	public String getCiTime() {
		return ciTime;
	}

	public void setCiTime(String ciTime) {
		this.ciTime = ciTime;
	}

	public String getNsUnit() {
		return nsUnit;
	}

	public void setNsUnit(String nsUnit) {
		this.nsUnit = nsUnit;
	}

	@Override
	public String toString() {
		return "RoomList [rmNo=" + rmNo + ", rmNum=" + rmNum + ", floor=" + floor + ", rmStatus=" + rmStatus + ", rtNo="
				+ rtNo + ", rtName=" + rtName + ", cleanStatus=" + cleanStatus + ", rmno=" + rmno + ", rname=" + rname
				+ ", smno=" + smno + ", sname=" + sname + ", stayNo=" + stayNo + ", scheckin=" + scheckin
				+ ", scheckout=" + scheckout + ", stayStatus=" + stayStatus + ", stayType=" + stayType + ", stayPrice="
				+ stayPrice + ", rsvNo=" + rsvNo + ", rcheckin=" + rcheckin + ", rcheckout=" + rcheckout + ", rsvPrice="
				+ rsvPrice + ", rsvStatus=" + rsvStatus + ", ciTime=" + ciTime + ", nsUnit=" + nsUnit + "]";
	}
	
	

}
