package com.kh.hotels.mngSetting.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.service.SettingService;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

@Controller
public class SettingController {
	
	@Autowired
	private SettingService ss;

	@RequestMapping("goSetting.st")
	public String goSettingPage(Model model, HttpServletRequest request) {
		
		ArrayList<SettingRoomType> roomTypeList = ss.selectRoomTypeList();

		for(int i = 0; i < roomTypeList.size(); i++) {
			roomTypeList.get(i).setRoomCount(ss.selectRoomCount(roomTypeList.get(i).getRtNo()));
		}
		
		model.addAttribute("roomTypeList", roomTypeList);
		
		return "hoteladmin/mngSettings/abtRoomType";
	}
	
	@RequestMapping("goRoomType.st")
	public String goRoomTypePage(Model model) {
		
		
		ArrayList<SettingRoomType> roomTypeList = ss.selectRoomTypeList();
		
		for(int i = 0; i < roomTypeList.size(); i++) {
			roomTypeList.get(i).setRoomCount(ss.selectRoomCount(roomTypeList.get(i).getRtNo()));
		}
		
		model.addAttribute("roomTypeList", roomTypeList);
		
		return "hoteladmin/mngSettings/abtRoomType";
	}
	
	
	@PostMapping("addRoomType.st")
	public String addRoomType(Model model, String rtName, String minPer, String maxPer, String limitprc) {
		
		String[] rtNames = rtName.split(",");
		String[] minPers = minPer.split(",");
		String[] maxPers = maxPer.split(",");
		String[] limitprcs = limitprc.split(",");
		
		ArrayList<RoomType> roomTypeList = new ArrayList<>();
		
		RoomType roomType;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String regDate = sdf.format(date);
		
		
		for(int i = 0; i < rtNames.length; i++) {
			roomType = new RoomType();
			roomType.setRtName(rtNames[i]);
			roomType.setMinPer(Integer.parseInt(minPers[i]));
			roomType.setMaxPer(Integer.parseInt(maxPers[i]));
			roomType.setLimitprc(Integer.parseInt(limitprcs[i]));
			roomType.setRegDate(regDate);
			
			roomTypeList.add(roomType);
		}
		
		int result = ss.insertRoomType(roomTypeList);
		
		if( result > 0 ) {
			return "redirect:/goRoomType.st";
		}else {
			model.addAttribute("msg", "객실타입추가 실패");
			return "common/errorPage";
		}
	}
	@RequestMapping("goRoomDetail.st")
	public String goRoomDetailPage(Model model) {
		
		ArrayList<SettingRoomType> roomTypeList = ss.selectRoomTypeList();
		
		for(int i = 0; i < roomTypeList.size(); i++) {
			roomTypeList.get(i).setRoomCount(ss.selectRoomCount(roomTypeList.get(i).getRtNo()));
		}
		
		
		model.addAttribute("roomTypeList", roomTypeList);
		
		return "hoteladmin/mngSettings/abtRoomDetail";
	}
	
	@PostMapping("roomDetailList.st")
	public ModelAndView roomDetailList(ModelAndView mv, String roomtypes) {
		
		int rtNo = Integer.parseInt(roomtypes);
		
		ArrayList<Room> roomDetailList = ss.selectRoomDetailList(rtNo);
		
		System.out.println("roomDetailList : " + roomDetailList);
		
		mv.addObject("roomDetailList", roomDetailList);
		mv.setViewName("jsonView");
		
		return mv;
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

	
	@RequestMapping("goReserv.st")
	public String goReserv() {
		
		return "hoteladmin/mngSettings/abtReserv";
	}
	@RequestMapping("goBill.st")
	public String goBill() {
		
		return "hoteladmin/mngSettings/abtBill";
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
