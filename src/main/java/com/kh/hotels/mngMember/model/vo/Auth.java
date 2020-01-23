package com.kh.hotels.mngMember.model.vo;

import com.kh.hotels.mngClient.model.vo.BlackListHistory;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Auth {

	private String authNo;
	private String authName;
	
	
}
