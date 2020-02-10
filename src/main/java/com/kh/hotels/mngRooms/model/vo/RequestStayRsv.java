package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestStayRsv implements java.io.Serializable {

	private int stayNo;
	private String rsvNo;
	private String rsvReq;
	private String reqDate;
	private String reqContent;
	private String hdrDate;
	private String hdrStatus;
	
}
