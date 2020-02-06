package com.kh.hotels.mngRooms.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RuleInfo implements java.io.Serializable {

	private String hotelName;
	private int svcRate;
	private String nsUnit;
	private String ltUnit;
	private int nsRate;
	
	private double serviceRate;
	private int noshowUnit;
	private int rentUnit;
}
