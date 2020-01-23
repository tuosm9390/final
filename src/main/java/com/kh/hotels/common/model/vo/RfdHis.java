package com.kh.hotels.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RfdHis {
	
	private int rfdNo;
	private Date modDate;
	private int modRfdRate;
	private String modRsn;

}
