package com.kh.hotels.mngClient.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Que implements java.io.Serializable{

	private int qno;
	private int mno;
	private int hotelMno;
	private String userName;
	private String phone;
	private String qtype;
	private String qtitle;
	private Date qdate;
	private String qdateView;
	private String qcontent;
	private String ansStatus;
	private String delStatus;
	private String qpwd;
	private String pwdStatus;
	private String queDivision;
	private String queAnswer;
	private String queOfflineDate;
	
}
