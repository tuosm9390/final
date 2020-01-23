package com.kh.hotels.mngMember.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member implements java.io.Serializable {

	private int mno;
	private String userName;
	private String phone;
	private String email;
	private String status;
	private String type;
	private String mmemo;
	private String userId;
	private String userPwd;
	private String authNo;
	private int deptNo;
	private String pwdStatus;

}
