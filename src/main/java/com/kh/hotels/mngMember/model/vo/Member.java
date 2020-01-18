package com.kh.hotels.mngMember.model.vo;

public class Member implements java.io.Serializable {

	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String status;
	private String type;
	private String mmemo;
	
	public Member() {}

	public Member(int mno, String userId, String userPwd, String userName, String email, String status, String type,
			String mmemo) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.status = status;
		this.type = type;
		this.mmemo = mmemo;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMmemo() {
		return mmemo;
	}

	public void setMmemo(String mmemo) {
		this.mmemo = mmemo;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", status=" + status + ", type=" + type + ", mmemo=" + mmemo + "]";
	}
	
	
	
	
}
