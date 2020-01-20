package com.kh.hotels.mngMember.model.vo;

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
	private String emailYN;
	
	public Member() {}

	public Member(int mno, String userName, String phone, String email, String status, String type, String mmemo,
			String userId, String userPwd, String authNo, int deptNo, String emailYN) {
		super();
		this.mno = mno;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.type = type;
		this.mmemo = mmemo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.authNo = authNo;
		this.deptNo = deptNo;
		this.emailYN = emailYN;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getAuthNo() {
		return authNo;
	}

	public void setAuthNo(String authNo) {
		this.authNo = authNo;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getEmailYN() {
		return emailYN;
	}

	public void setEmailYN(String emailYN) {
		this.emailYN = emailYN;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", userName=" + userName + ", phone=" + phone + ", email=" + email + ", status="
				+ status + ", type=" + type + ", mmemo=" + mmemo + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", authNo=" + authNo + ", deptNo=" + deptNo + ", emailYN=" + emailYN + "]";
	}

	
}
