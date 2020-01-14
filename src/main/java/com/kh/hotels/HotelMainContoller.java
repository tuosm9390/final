package com.kh.hotels;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HotelMainContoller {

	@GetMapping("goMain.hmain")
	public String showHotelMain() {
		
		return "hotelmain/main/main";
	}
	@GetMapping("goMain.hadmin")
	public String showHotelAdmin() {
		
		return "hoteladmin/main/main";
	}
	
}
