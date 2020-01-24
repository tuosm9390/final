package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomHistory {

	private int rmNo;
	private String modDate;
	private String modCol;
	private String befData;
	private String aftData;
	private String modRsn;
	
}
