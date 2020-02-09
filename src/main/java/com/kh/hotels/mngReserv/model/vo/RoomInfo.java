package com.kh.hotels.mngReserv.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomInfo implements java.io.Serializable {
	private int rmNo;
	private String rmNum;
	private int floor;
	private int rtNo;
	private String rtName;
}
