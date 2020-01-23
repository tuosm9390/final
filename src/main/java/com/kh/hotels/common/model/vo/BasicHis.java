package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasicHis {
	
	private String modCol;
	private String modDate;
	private int bno;
	private String befData;
	private String aftData;
	private String modRsn;

}
