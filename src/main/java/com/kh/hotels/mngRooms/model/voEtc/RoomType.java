package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomType {

	private int rtNo;
	private String rtName;
	private int minPer;
	private int maxPer;
	private int limitprc;
	private String regDate;
}
