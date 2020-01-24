package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomInfo {
	private int std_Per;
	private String rm_Option;
	private int rt_No;
	private String rm_Status;
	private String rt_Name;
	private int minPer;
	private int maxPer;
	private int limitPrc;
}
