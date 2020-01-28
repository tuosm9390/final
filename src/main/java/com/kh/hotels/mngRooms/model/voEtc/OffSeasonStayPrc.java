package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OffSeasonStayPrc implements java.io.Serializable{
	
	private int rtNo;
	private int offStayMon;
	private int offStayTue;
	private int offStayWed;
	private int offStayThu;
	private int offStayFri;
	private int offStaySat;
	private int offStaySun;

}
