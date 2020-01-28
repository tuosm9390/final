package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeasonRentPrc  implements java.io.Serializable{

	private int rtNo;
	private int rentMon;
	private int rentTue;
	private int rentWed;
	private int rentThu;
	private int rentFri;
	private int rentSat;
	private int rentSun;
	
}
