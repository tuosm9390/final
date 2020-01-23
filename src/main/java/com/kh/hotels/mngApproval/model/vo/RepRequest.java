package com.kh.hotels.mngApproval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RepRequest {

	private int ino;
	private String cnCode;
	private String repRsn;
	private int repPrice;
	private int totPrice;
	private int rptNo;
	
}
