package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	
	private int rmNo;
	private String rmNum;
	private int stdPer;
	private String rmOption;
	private int floor;
	private int rtNo;
	private String regDate;
	private String rmStatus;

}
