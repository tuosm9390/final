package com.kh.hotels;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HotelSettingController {
	
	@RequestMapping("goHotelRoomTypePage.set")
	public String goHotelRoomTypeSetting() {
		
		return "hotelSetting/hotelRoomTypeSetting";
		
	}
	
}
