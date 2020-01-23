package com.kh.hotels.mngReserv.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InvHistory {

	private String rsvNo;
	private String invType;
	private String sendDate;
	
}
