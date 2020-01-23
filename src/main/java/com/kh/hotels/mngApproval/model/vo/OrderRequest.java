package com.kh.hotels.mngApproval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderRequest {

	private int reqNo;
	private String reqBegin;
	private String reqEnd;
	private String reqStatus;
	private int rptNo;
	
}
