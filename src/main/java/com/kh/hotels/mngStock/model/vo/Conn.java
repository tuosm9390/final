package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Conn {

	private String cnCode;
	private String cnName;
	private String ownerName;
	private String cnPhone;
	private String cnEmail;
	private String cnItem;
	private String cnStatus;
	private String cnAdd;
	private String regDate;
	private String bankName;
	private String account;
	private String accName;
	private String accMemo;
	private String cnManager;
}
