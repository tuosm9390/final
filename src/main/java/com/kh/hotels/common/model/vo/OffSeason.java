package com.kh.hotels.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OffSeason {
	
	private int offSeasonWeek2;
	private int offSeasonWeek1;
	private int offSeasonWeek0;
	private int offSeasonWeekend2;
	private int offSeasonWeekend1;
	private int offSeasonWeekend0;
	private String hname;
}
