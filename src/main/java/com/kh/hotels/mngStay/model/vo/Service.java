package com.kh.hotels.mngStay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Service {
	
	private String svcCode;
	private String svcName;
	private String salesType;
	private int svcPrice;
	private String regDate;
	private String svcStatus;

}
