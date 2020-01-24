package com.kh.hotels.mngRooms.model.voEtc;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrokenHistory {

	private int rmNo;
	private Date brkBegin;
	private Date brkEnd;
	private String brkRsn;
	private int mno;
	
}
