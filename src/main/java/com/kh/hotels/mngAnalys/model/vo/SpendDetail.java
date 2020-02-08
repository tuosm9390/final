package com.kh.hotels.mngAnalys.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SpendDetail {
	private int sdNo;
	private String rptType;
	private String name;
	private String pway;
	private String modDate;
	private String response;
	private int totalPrice;
	private String memo;
}
