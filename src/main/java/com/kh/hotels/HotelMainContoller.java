package com.kh.hotels;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HotelMainContoller {

//	@GetMapping("goMain.hadmin")
//	public String showHotelAdmin() {
//		
//		return "hoteladmin/main/main";
//	}
	
	@GetMapping("goMain.hmain")
	public String showHotelMain() {
		
		return "hotelmain/main/main";
	}

}
