package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Season {
	
	private int seasonWeek10;
	private int seasonWeek7;
	private int seasonWeek5;
	private int seasonWeek3;
	private int seasonWeek1;
	private int seasonWeek0;
	private int seasonWeekend10;
	private int seasonWeekend7;
	private int seasonWeekend5;
	private int seasonWeekend3;
	private int seasonWeekend1;
	private int seasonWeekend0;
	private String hname;

}
