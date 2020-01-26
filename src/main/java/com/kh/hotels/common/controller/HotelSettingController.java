package com.kh.hotels.common.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hotels.common.model.service.CommonService;
import com.kh.hotels.common.model.vo.Basic;
import com.kh.hotels.common.model.vo.Cal;
import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.common.model.vo.Law;
import com.kh.hotels.common.model.vo.NoShow;
import com.kh.hotels.common.model.vo.OffSeason;
import com.kh.hotels.common.model.vo.Rfd;
import com.kh.hotels.common.model.vo.Rule;
import com.kh.hotels.common.model.vo.Season;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;

@SessionAttributes({"info","rule","basic","noShow","cal","offSeason","season","roomTypeList"})
@Controller
public class HotelSettingController {
	
	@Autowired
	private CommonService cs;
	
	@RequestMapping("goHotelRoomTypePage.set")
	public String goHotelRoomTypeSetting() {
		
		return "hotelSetting/hotelRoomTypeSetting";
		
	}
	@RequestMapping("backHotelInfoSettingPage.set")
	public String goHotelInfoSetting() {
		
		return "hotelSetting/hotelInfoSetting";
		
	}
	@RequestMapping("backRoomTypeSetting.set")
	public String backRoomTypeSetting() {
		
		return "hotelSetting/hotelRoomTypeSetting";
		
	}
	
	@PostMapping("goRoomTypePage.set")
	public String nextRoomTypePage(Info info, Rule rule, Law law,Basic basic, NoShow noShow, Cal cal, Rfd rfd,OffSeason offSeason, Season season, HttpServletRequest request, Model model) {
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
		info.setModDate(to);
		basic.setLtype("BASIC");
		noShow.setLtype("NOSHOW");
		cal.setLtype("CAL");
		rfd.setLtype("RFD");
		
		model.addAttribute("info", info);
		model.addAttribute("rule", rule);
		model.addAttribute("basic", basic);
		model.addAttribute("noShow", noShow);
		model.addAttribute("cal", cal);
 
//		int offSeasonWeek2 = Integer.parseInt(request.getParameter("offSeasonWeek2"));
//		int offSeasonWeek1 = Integer.parseInt(request.getParameter("offSeasonWeek1"));
//		int offSeasonWeek0 = Integer.parseInt(request.getParameter("offSeasonWeek0"));
//		int offSeasonWeekend2 = Integer.parseInt(request.getParameter("offSeasonWeekend2"));
//		int offSeasonWeekend1 = Integer.parseInt(request.getParameter("offSeasonWeekend1"));
//		int offSeasonWeekend0 = Integer.parseInt(request.getParameter("offSeasonWeekend0"));
//		
//		HashMap<String, Object> offSeason = new HashMap<>();
//		offSeason.put("offSeasonWeek2", offSeasonWeek2);
//		offSeason.put("offSeasonWeek1", offSeasonWeek1);
//		offSeason.put("offSeasonWeek0", offSeasonWeek0);
//		offSeason.put("offSeasonWeekend2", offSeasonWeekend2);
//		offSeason.put("offSeasonWeekend1", offSeasonWeekend1);
//		offSeason.put("offSeasonWeekend0", offSeasonWeekend0);
//		offSeason.put("hname", info.getHname());
//		
//		int seasonWeek10 = Integer.parseInt(request.getParameter("seasonWeek10"));
//		int seasonWeek7 = Integer.parseInt(request.getParameter("seasonWeek7"));
//		int seasonWeek5 = Integer.parseInt(request.getParameter("seasonWeek5"));
//		int seasonWeek3 = Integer.parseInt(request.getParameter("seasonWeek3"));
//		int seasonWeek1 = Integer.parseInt(request.getParameter("seasonWeek1"));
//		int seasonWeek0 = Integer.parseInt(request.getParameter("seasonWeek0"));
//		int seasonWeekend10 = Integer.parseInt(request.getParameter("seasonWeekend10"));
//		int seasonWeekend7 = Integer.parseInt(request.getParameter("seasonWeekend7"));
//		int seasonWeekend5 = Integer.parseInt(request.getParameter("seasonWeekend5"));
//		int seasonWeekend3 = Integer.parseInt(request.getParameter("seasonWeekend3"));
//		int seasonWeekend1 = Integer.parseInt(request.getParameter("seasonWeekend1"));
//		int seasonWeekend0 = Integer.parseInt(request.getParameter("seasonWeekend0"));
//		
//		HashMap<String, Object> season = new HashMap<>();
//		season.put("seasonWeek10", seasonWeek10);
//		season.put("seasonWeek7", seasonWeek7);
//		season.put("seasonWeek5", seasonWeek5);
//		season.put("seasonWeek3", seasonWeek3);
//		season.put("seasonWeek1", seasonWeek1);
//		season.put("seasonWeek0", seasonWeek0);
//		season.put("seasonWeekend10", seasonWeekend10);
//		season.put("seasonWeekend7", seasonWeekend7);
//		season.put("seasonWeekend5", seasonWeekend5);
//		season.put("seasonWeekend3", seasonWeekend3);
//		season.put("seasonWeekend1", seasonWeekend1);
//		season.put("seasonWeekend0", seasonWeekend0);
//		offSeason.put("hname", info.getHname());
		
		model.addAttribute("offSeason", offSeason);
		model.addAttribute("season", season);
		
		System.out.println("season : " + season );
		System.out.println("offSeason : " + offSeason );
		
		int result = cs.insertHotelInfomation(info,rule,law,basic,noShow,cal,rfd,offSeason,season);
		

		if(result > 0) { 
			return "hotelSetting/hotelRoomTypeSetting"; 
		}else {
			model.addAttribute("msg", "호텔정보 설정 실패");
			return "commom/errorPage"; 
		}


		//return "";
	}
	
	@PostMapping("goRoomDetailPage.set")
	public String goRoomDetailPage(String rtName, String minPer, String maxPer, String limitprc, Model model) {

		String[] rtNames = rtName.split(",");
		String[] minPers = minPer.split(",");
		String[] maxPers = maxPer.split(",");
		String[] limitprcs = limitprc.split(",");
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
		

		RoomType roomType = null;
		
		ArrayList<RoomType> roomTypeList = new ArrayList<>();
		
		for(int i = 0; i < rtNames.length; i++) {
			roomType = new RoomType();
			roomType.setRtName(rtNames[i]);
			roomType.setMinPer(Integer.parseInt(minPers[i]));
			roomType.setMaxPer(Integer.parseInt(maxPers[i]));
			roomType.setLimitprc(Integer.parseInt(limitprcs[i]));
			roomType.setRegDate(to);
			roomTypeList.add(roomType);
		}

		model.addAttribute("roomTypeList", roomTypeList);

		int result = cs.insertHotelRoomType(roomTypeList);
		
		return "hotelSetting/hotelRoomDetailSetting";
	}
	
	@PostMapping("goRoomFarePage.set")
	public String goRoomFarePage(String roomType, String rmNum, String strPer, String rmOption, String floor) {
		
		System.out.println("roomType : " + roomType);
		
		return "hotelSetting/hotelRoomFareSetting";
	}

}























