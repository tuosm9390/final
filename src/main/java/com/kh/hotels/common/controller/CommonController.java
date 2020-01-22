package com.kh.hotels.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotels.common.model.service.CommonService;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService cs;

	@GetMapping("goMainPage.main")
	public String goMainPage() {
		
		int result = cs.selectHotelInfoCount();
		
		if(result > 0) {
			return "hoteladmin/main/main";
		}else {
			return "hotelSetting/hotelInfoSetting";
		}
	}
	
	@GetMapping("goHotelMainPage.main")
	public String goHotelMainPage() {
		
		return "hotelmain/main/main";
	}
	
	@RequestMapping("goSettingMain.main")
	public String goSettingMain() {
		
		return "hotelSetting/hotelInfoSetting";
	}
	
}
