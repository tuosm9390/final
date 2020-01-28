package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeasonStayPrc  implements java.io.Serializable{
	
	private int rtNo;
	private int stayMon;
	private int stayTue;
	private int stayWed;
	private int stayThu;
	private int stayFri;
	private int staySat;
	private int staySun;

}
