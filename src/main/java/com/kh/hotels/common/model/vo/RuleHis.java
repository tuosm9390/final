package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RuleHis {
	
	private int rno;
	private String modDate;
	private String befData;
	private String aftData;
	private String modRsn;

}
