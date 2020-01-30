package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceList implements java.io.Serializable{

	private String svcCode;		//서비스 코드
	private String svcName;		//서비스명
	private String salesType;	//매출구분
	private int svcPrice;		//금액
	private String regDate;		//등록일시
	private String svcStatus;	//사용여부

}
