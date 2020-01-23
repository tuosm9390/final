package com.kh.hotels.mngReserv.model.vo;

import com.kh.hotels.mngStock.model.vo.ItemHistory;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RsvHistory {

	private String rsvNo;
	private String modDate;
	private String modCol;
	private String befData;
	private String aftData;
	private String modRsn;
	
}
