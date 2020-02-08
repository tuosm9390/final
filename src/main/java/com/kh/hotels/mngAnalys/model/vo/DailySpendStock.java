package com.kh.hotels.mngAnalys.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DailySpendStock {
	private int dssNo;
	private String rptStatus;
	private String apprDate;
	private String rptType;
	private int totalPrice;
	private String type;
}
