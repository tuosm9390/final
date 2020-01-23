package com.kh.hotels.mngClient.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnsHistory {

	private Date modDate;
	private int ano;
	private int qno;
	private String modCol;
	private String befData;
	private String aftData;
	private String modRsn;
	
}
