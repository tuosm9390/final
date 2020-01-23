package com.kh.hotels.mngClient.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ans {

	private int ano;
	private int qno;
	private int mno;
	private String acontent;
	private Date adate;
	
}
