package com.kh.hotels.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attach {

	private int fno;
	private int rtNo;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private String filePath;
	private String fileLevel;
	private String fileState;
	
}
