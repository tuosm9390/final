package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room implements java.io.Serializable {
	
	private int rmNo;
	private String rmNum;
	private int stdPer;
	private String rmOption;
	private int floor;
	private int rtNo;
	private String regDate;
	private String rmStatus;

}
