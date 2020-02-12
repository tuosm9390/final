package com.kh.hotels.mngApproval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RepRequest {

	private int ino;
	private String cnCode;
	private String rsn;
	private int price;
	private int totalPrice;
	private int rptNo;
	private int docno;
	private String mname;
	private String sname;
	private int smno;
	private String title;
	private String content;
	private String iname;
	private String cnName;
	private String deptName;
	private int mmno;
	private String rptDate;
}
