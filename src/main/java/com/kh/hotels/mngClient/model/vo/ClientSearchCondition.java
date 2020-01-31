package com.kh.hotels.mngClient.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientSearchCondition {

	private String clientName;
	private String clientPhone;
	private String clientEmail;
	
}
