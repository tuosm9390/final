package com.kh.hotels.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Info implements java.io.Serializable {

	private String hname;
	private String owner;
	private String hemail;
	private String hphone;
	private String bizName;
	private String bizNo;
	private String htel;
	private Date modDate;
	
}
