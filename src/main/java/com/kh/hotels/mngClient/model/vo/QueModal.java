package com.kh.hotels.mngClient.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueModal implements java.io.Serializable{

	private int qno;
	private int mno;
	private String email;
	private String phone;
	private String userName;
	private String qtype;
	private String qtitle;
	private String qdate;
	private String qcontent;
	private String acontent;
	private String ansStatus;
	private String delStatus;
	private String qpwd;
	private String pwdStatus;
	
}
