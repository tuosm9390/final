package com.kh.hotels.common.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hotels.common.model.vo.Basic;
import com.kh.hotels.common.model.vo.Cal;
import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.common.model.vo.NoShow;
import com.kh.hotels.common.model.vo.Rfd;
import com.kh.hotels.common.model.vo.Rule;
import com.kh.hotels.mngRooms.model.vo.RoomType;

@SessionAttributes({"info","rule","basic","noShow","cal","offSeason","season","roomTypeList"})
@Controller
public class HotelSettingController {
	
	@RequestMapping("goHotelRoomTypePage.set")
	public String goHotelRoomTypeSetting() {
		
		return "hotelSetting/hotelRoomTypeSetting";
		
	}
	@RequestMapping("backHotelInfoSettingPage.set")
	public String goHotelInfoSetting() {
		
		return "hotelSetting/hotelInfoSetting";
		
	}
	
	@PostMapping("goRoomTypePage.set")
	public String nextRoomTypePage(Info info, Rule rule,Basic basic, NoShow noShow, Cal cal, Rfd rfd, HttpServletRequest request, Model model) {
		
		model.addAttribute("info", info);
		model.addAttribute("rule", rule);
		model.addAttribute("basic", basic);
		model.addAttribute("noShow", noShow);
		model.addAttribute("cal", cal);

		String offSeasonWeek2 = request.getParameter("offSeasonWeek2");
		String offSeasonWeek1 = request.getParameter("offSeasonWeek1");
		String offSeasonWeek0 = request.getParameter("offSeasonWeek0");
		String offSeasonWeekend2 = request.getParameter("offSeasonWeekend2");
		String offSeasonWeekend1 = request.getParameter("offSeasonWeekend1");
		String offSeasonWeekend0 = request.getParameter("offSeasonWeekend0");
		
		HashMap<String, String> offSeason = new HashMap<>();
		offSeason.put("offSeasonWeek2", offSeasonWeek2);
		offSeason.put("offSeasonWeek1", offSeasonWeek1);
		offSeason.put("offSeasonWeek0", offSeasonWeek0);
		offSeason.put("offSeasonWeekend2", offSeasonWeekend2);
		offSeason.put("offSeasonWeekend1", offSeasonWeekend1);
		offSeason.put("offSeasonWeekend0", offSeasonWeekend0);
		
		String seasonWeek10 = request.getParameter("seasonWeek10");
		String seasonWeek7 = request.getParameter("seasonWeek7");
		String seasonWeek5 = request.getParameter("seasonWeek5");
		String seasonWeek3 = request.getParameter("seasonWeek3");
		String seasonWeek1 = request.getParameter("seasonWeek1");
		String seasonWeek0 = request.getParameter("seasonWeek0");
		String seasonWeekend10 = request.getParameter("seasonWeekend10");
		String seasonWeekend7 = request.getParameter("seasonWeekend7");
		String seasonWeekend5 = request.getParameter("seasonWeekend5");
		String seasonWeekend3 = request.getParameter("seasonWeekend3");
		String seasonWeekend1 = request.getParameter("seasonWeekend1");
		String seasonWeekend0 = request.getParameter("seasonWeekend0");
		
		HashMap<String, String> season = new HashMap<>();
		season.put("seasonWeek10", seasonWeek10);
		season.put("seasonWeek7", seasonWeek7);
		season.put("seasonWeek5", seasonWeek5);
		season.put("seasonWeek3", seasonWeek3);
		season.put("seasonWeek1", seasonWeek1);
		season.put("seasonWeek0", seasonWeek0);
		season.put("seasonWeekend10", seasonWeekend10);
		season.put("seasonWeekend7", seasonWeekend7);
		season.put("seasonWeekend5", seasonWeekend5);
		season.put("seasonWeekend3", seasonWeekend3);
		season.put("seasonWeekend1", seasonWeekend1);
		season.put("seasonWeekend0", seasonWeekend0);
		
		model.addAttribute("offSeason", offSeason);
		model.addAttribute("season", season);
		
		return "hotelSetting/hotelRoomTypeSetting";
	}
	
	@PostMapping("goRoomDetailPage.set")
	public String goRoomDetailPage(String rtName, String minPer, String maxPer, String limitprc, Model model) {

		String[] rtNames = rtName.split(",");
		String[] minPers = minPer.split(",");
		String[] maxPers = maxPer.split(",");
		String[] limitprcs = limitprc.split(",");
		

		RoomType roomType = null;
		
		ArrayList<RoomType> roomTypeList = new ArrayList<>();
		
		for(int i = 0; i < rtNames.length; i++) {
			roomType = new RoomType();
			roomType.setRtName(rtNames[i]);
			roomType.setMinPer(Integer.parseInt(minPers[i]));
			roomType.setMaxPer(Integer.parseInt(maxPers[i]));
			roomType.setLimitprc(Integer.parseInt(limitprcs[i]));
			roomTypeList.add(roomType);
		}
		
		model.addAttribute("roomTypeList", roomTypeList);
		
		return "hotelSetting/hotelRoomDetailSetting";
	}
	

}
