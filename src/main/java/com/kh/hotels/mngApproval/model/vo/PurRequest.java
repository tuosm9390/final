package com.kh.hotels.mngApproval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurRequest {

	private int rptNo;
	private int ino;
	private String cnCode;
	private int amount;
	private int totPrice;
	private String purRsn;
	
}
