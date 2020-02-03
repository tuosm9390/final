package com.kh.hotels.mngSetting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SettingRoomType implements java.io.Serializable{

	private int rtNo;
	private String rtName;
	private int minPer;
	private int maxPer;
	private int limitprc;
	private String regDate;
	private int roomCount;
	
}
