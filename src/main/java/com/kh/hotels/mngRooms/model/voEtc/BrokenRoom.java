package com.kh.hotels.mngRooms.model.voEtc;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrokenRoom implements java.io.Serializable{
	private int rmNo;
	private String brkBegin;
	private String brkEnd;
	private String brkRsn;
	private int mno;
}
