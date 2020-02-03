package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BrokenRoom implements java.io.Serializable {
	
	private int rmNo;
	private String brkBegin;
	private String brkEnd;
	private String brkRsn;
	private String userName;
	private String brkStatus;
	
}
