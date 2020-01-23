package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cal {
	
	private int calNo;
	private int svcRate;
	private String calTime;
	private String vatType;
	private String hname;
	private String ltype;

}
