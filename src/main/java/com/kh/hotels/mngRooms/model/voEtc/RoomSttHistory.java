package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomSttHistory {

	private int rmNo;
	private String befData;
	private String aftData;
	private String modDate;
	private String modRsn;
	
}
