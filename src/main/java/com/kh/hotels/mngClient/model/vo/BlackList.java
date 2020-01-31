package com.kh.hotels.mngClient.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlackList {
	
	private int blackNo;
	private int mno;
	private String name;
	private String phone;
	private String email;
	private Date regDate;
	private String regRsn;
	private String response;
	private String blackStatus;
	private String regDate2;

}
