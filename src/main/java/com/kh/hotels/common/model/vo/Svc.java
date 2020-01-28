package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Svc implements java.io.Serializable{
	
	private String svcCode;
	private String svcName;
	private String salesType;
	private int svcPrice;
	private String regDate;
	private String svcStatus;

}
