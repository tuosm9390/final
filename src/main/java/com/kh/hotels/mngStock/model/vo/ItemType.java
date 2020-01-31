package com.kh.hotels.mngStock.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class ItemType implements java.io.Serializable{

	private int typeNo;
	private String type;
	private String lcategory;
	private String mcategory;
	private String scategory;
	
	public ItemType() {}

	public ItemType(int typeNo, String type, String lcategory, String mcategory, String scategory) {
		super();
		this.typeNo = typeNo;
		this.type = type;
		this.lcategory = lcategory;
		this.mcategory = mcategory;
		this.scategory = scategory;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getlCategory() {
		return lcategory;
	}

	public void setlCategory(String lcategory) {
		this.lcategory = lcategory;
	}

	public String getmCategory() {
		return mcategory;
	}

	public void setmCategory(String mcategory) {
		this.mcategory = mcategory;
	}

	public String getsCategory() {
		return scategory;
	}

	public void setsCategory(String scategory) {
		this.scategory = scategory;
	}

	@Override
	public String toString() {
		return "ItemType [typeNo=" + typeNo + ", type=" + type + ", lcategory=" + lcategory + ", mcategory=" + mcategory
				+ ", scategory=" + scategory + "]";
	}
	
	
}
