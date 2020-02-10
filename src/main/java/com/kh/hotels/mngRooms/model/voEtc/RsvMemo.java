package com.kh.hotels.mngRooms.model.voEtc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RsvMemo {

	private int stayNo;
	private String reqDate;
	private String reqContent;
	private String hdrDate;
	private String hdrStatus;
	
}
