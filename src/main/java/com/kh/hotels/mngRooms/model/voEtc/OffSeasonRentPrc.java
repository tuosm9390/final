package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OffSeasonRentPrc  implements java.io.Serializable{
	
	private int rtNo;
	private int offRentMon;
	private int offRentTue;
	private int offRentWed;
	private int offRentThu;
	private int offRentFri;
	private int offRentSat;
	private int offRentSun;
	
}
