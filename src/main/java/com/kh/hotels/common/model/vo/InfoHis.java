package com.kh.hotels.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoHis {

	private String modCol;
	private Date modDate;
	private String befData;
	private String aftData;
	private String modRsn;
	private String hname;
	
	
}
