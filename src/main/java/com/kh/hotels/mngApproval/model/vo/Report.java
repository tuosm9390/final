package com.kh.hotels.mngApproval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {

	private int rptNo;
	private int mno;
	private String rptDate;
	private int receiver;
	private String rptTitle;
	private String rptStatus;
	private String apprDate;
	private Long docNo;
	private String rptType;
	private String mname;
	private String sname;
	private int smno;
	
}
