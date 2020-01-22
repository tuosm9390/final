package com.kh.hotels.mngSetting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {

	@RequestMapping("goSetting.st")
	public String goSettingPage() {
		
		return "hoteladmin/mngSettings/abtRoomType";
	}
	
	@RequestMapping("goRoomType.st")
	public String goRoomTypePage() {
		
		return "hoteladmin/mngSettings/abtRoomType";
	}
	
	@RequestMapping("goRoomDetail.st")
	public String goRoomDetailPage() {
		
		return "hoteladmin/mngSettings/abtRoomDetail";
	}
	
	@RequestMapping("goRoomFare.st")
	public String goRoomFarePage() {
		
		return "hoteladmin/mngSettings/abtRoomFare";
	}
	
	@RequestMapping("goBrokenRoom.st")
	public String goBrokenRoomPage() {
		
		return "hoteladmin/mngSettings/abtBrokenRoom";
	}
	
	@RequestMapping("goServiceSetting.st")
	public String goServiceSettingPage() {
		
		return "hoteladmin/mngSettings/abtServiceSetting";
	}
	@RequestMapping("hotelInfo.st")
	public String goHotelInfo() {
		return "hoteladmin/mngSettings/abtHotel/hotelInfo";
	}
	@RequestMapping("hotelUserInsert.st")
	public String goHotelUserInfo() {
		return "hoteladmin/mngSettings/abtHotel/userInsert";
	}
		
	
}
