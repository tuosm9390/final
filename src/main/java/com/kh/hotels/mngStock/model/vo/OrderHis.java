package com.kh.hotels.mngStock.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderHis implements java.io.Serializable{

	private int orderNo;
	private Date rcvReqDate;
	private int totPrice;
	private String rcvStatus;
	private String cnName;
	private String iname;
	private int rptNo;
	
}
