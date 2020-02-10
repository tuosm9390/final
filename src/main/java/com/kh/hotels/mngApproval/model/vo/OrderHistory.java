package com.kh.hotels.mngApproval.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderHistory {

	private int orderNo;
	private String rcvStatus;
	private String orderDate;
	private String rcvDate;
	private String rcvReqDate;
	private int rptNo;
	
	
}
