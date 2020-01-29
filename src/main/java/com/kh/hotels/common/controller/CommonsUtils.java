package com.kh.hotels.common.controller;

import java.util.UUID;

public class CommonsUtils {

	public static String getRandomString() {
		
		// 32비트의 
		return UUID.randomUUID().toString().replace("-", "");
	}
}
