package com.kh.hotels.common.model.vo;

import java.sql.Date;

public class HotelInfo implements java.io.Serializable {

	private String hname;
	private String owner;
	private String hemail;
	private String hphone;
	private String bizName;
	private String bizNo;
	private String htel;
	private Date modDate;
	
	public HotelInfo() {}

	public HotelInfo(String hname, String owner, String hemail, String hphone, String bizName, String bizNo,
			String htel, Date modDate) {
		super();
		this.hname = hname;
		this.owner = owner;
		this.hemail = hemail;
		this.hphone = hphone;
		this.bizName = bizName;
		this.bizNo = bizNo;
		this.htel = htel;
		this.modDate = modDate;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getHemail() {
		return hemail;
	}

	public void setHemail(String hemail) {
		this.hemail = hemail;
	}

	public String getHphone() {
		return hphone;
	}

	public void setHphone(String hphone) {
		this.hphone = hphone;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public String getBizNo() {
		return bizNo;
	}

	public void setBizNo(String bizNo) {
		this.bizNo = bizNo;
	}

	public String getHtel() {
		return htel;
	}

	public void setHtel(String htel) {
		this.htel = htel;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "HotelInfo [hname=" + hname + ", owner=" + owner + ", hemail=" + hemail + ", hphone=" + hphone
				+ ", bizName=" + bizName + ", bizNo=" + bizNo + ", htel=" + htel + ", modDate=" + modDate + "]";
	}
	
	
	
}
