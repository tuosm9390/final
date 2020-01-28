package com.kh.hotels.mngStock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Repair {
	private int rptNo;
	private String rptTitle;
	private String rptStatus;
}
