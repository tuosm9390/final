package com.kh.hotels.mngReserv.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.mngReserv.model.service.ReservHisService;
import com.kh.hotels.mngReserv.model.service.ReservNowService;
import com.kh.hotels.mngReserv.model.vo.ReservHisList;
import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.service.RoomsService;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.Rfd;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.RuleInfo;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ReservController {

	@Autowired
	private ReservHisService rh;
	@Autowired
	private ReservNowService rn;
	@Autowired
	private RoomsService rs;
	
	//예약현황
	@RequestMapping("viewNow.re")
	public String goReservNow(Model model, String day) {
		ArrayList<RoomInfo> roominfo = rn.selectRoomInfo();
		
		Date tday = new Date();
		SimpleDateFormat formate = new SimpleDateFormat ("yyyy-MM-dd");
		String today = formate.format(tday);
		
		ArrayList<RoomList> roomlist;
		String startDay = "";
		if(day == null) {
			roomlist = rn.selectRoomList();
			startDay = today;
		} else {
			roomlist = rn.searchReservNowDay(day);
			startDay = day;
		}
		model.addAttribute("startDay", startDay);
		
		model.addAttribute("roominfo", roominfo);
		model.addAttribute("roomlist", roomlist);
		
		JSONArray jsonArray = new JSONArray();
		
		model.addAttribute("jsonList", jsonArray.fromObject(roomlist));
		
		try {
			ArrayList<Prc> roomPrice = rs.viewRoomPrice();
			ArrayList<ServiceList> svcList = rs.viewServiceList();
			RuleInfo ruleInfo = rs.viewRuleInfo();
			ruleInfo.setServiceRate(ruleInfo.getSvcRate() / 100.0);
			ruleInfo.setNoshowUnit(Integer.parseInt(ruleInfo.getNsUnit()));
			ruleInfo.setRentUnit(Integer.parseInt(ruleInfo.getLtUnit()));
			Rfd rfdRate = rs.viewRefundRate();
			
			model.addAttribute("roomPrice", roomPrice);
			model.addAttribute("svcList", svcList);
			model.addAttribute("ruleInfo", ruleInfo);
			model.addAttribute("rfdRate", rfdRate);
			
			JSONArray jsonArray2 = new JSONArray();
			JSONArray jsonArray3 = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			JSONObject jsonObject2 = new JSONObject();
			
			model.addAttribute("jsonList2", jsonArray2.fromObject(roomPrice));
			model.addAttribute("jsonList3", jsonArray3.fromObject(svcList));
			model.addAttribute("jsonObject", jsonObject.fromObject(ruleInfo));
			model.addAttribute("jsonObject2", jsonObject2.fromObject(rfdRate));
		} catch (RoomListException e) {
			e.printStackTrace();
		}
		
		return "viewReservNow";
	}
	
	
	@RequestMapping("ajxFindBrokenHis.re")
	@ResponseBody
	public ModelAndView ajxFindBrokenHis(ModelAndView mv, int rmNo) {
		BrokenRoom brkRoom = rn.ajxFindBrokenHis(rmNo);
		mv.addObject("brkRoom", brkRoom);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping("searchRsvNowDay.re")
	public ModelAndView searchRsvNowDay(ModelAndView mv, String day) {
		Date tday = new Date();
		SimpleDateFormat formate = new SimpleDateFormat ("yyyy-MM-dd");
		String today = formate.format(tday);
		
		if(day.equals(today)) {
			mv.addObject("day", null);
			mv.setViewName("redirect:viewNow.re");
			return mv;
		} else {
			mv.addObject("day", day);
			mv.setViewName("redirect:viewNow.re");
			return mv;
		}
	}
	
	@RequestMapping("insertReserv.re")
	public String insertReserv(CheckIn checkIn) {
		if(checkIn.getClientNo() == 0) {
			rn.insertMember(checkIn);
			checkIn.setClientNo(rn.selectMno(checkIn));
		}
		checkIn.setLentYN("STAY");
		checkIn.setTotalPay(checkIn.getCreditCard() + checkIn.getCash() + checkIn.getAccount());
		if(checkIn.getTotalPrc() == checkIn.getTotalPay()) {
			checkIn.setPayStatus("OK");
		} else {
			checkIn.setPayStatus("WAIT");
		}
		
		rn.insertReserv(checkIn);
		return "redirect:viewNow.re";
	}
	
	

	//예약내역
	@RequestMapping("viewHis.re")
	public String goReservHis(Model model, String day) {
		Date tday = new Date();
		SimpleDateFormat formate = new SimpleDateFormat ("yyyy-MM-dd");
		String today = formate.format(tday);
		
		ArrayList<ReservHisList> rsvList;
		if(day == null) {
			rsvList = rh.goReservHis();
			model.addAttribute("today", today);
		} else {
			rsvList = rh.searchReservHisDay(day);
			model.addAttribute("today", day);
		}
		
		try {
			ArrayList<RoomList> roomList = rs.viewRoomList();
			ArrayList<Prc> roomPrice = rs.viewRoomPrice();
			ArrayList<ServiceList> svcList = rs.viewServiceList();
			RuleInfo ruleInfo = rs.viewRuleInfo();
			ruleInfo.setServiceRate(ruleInfo.getSvcRate() / 100.0);
			ruleInfo.setNoshowUnit(Integer.parseInt(ruleInfo.getNsUnit()));
			ruleInfo.setRentUnit(Integer.parseInt(ruleInfo.getLtUnit()));
			Rfd rfdRate = rs.viewRefundRate();
			
			model.addAttribute("roomList", roomList);
			model.addAttribute("roomPrice", roomPrice);
			model.addAttribute("svcList", svcList);
			model.addAttribute("ruleInfo", ruleInfo);
			model.addAttribute("rfdRate", rfdRate);
			
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray2 = new JSONArray();
			JSONArray jsonArray3 = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			JSONObject jsonObject2 = new JSONObject();
			
			model.addAttribute("jsonList", jsonArray.fromObject(roomList));
			model.addAttribute("jsonList2", jsonArray2.fromObject(roomPrice));
			model.addAttribute("jsonList3", jsonArray3.fromObject(svcList));
			model.addAttribute("jsonObject", jsonObject.fromObject(ruleInfo));
			model.addAttribute("jsonObject2", jsonObject2.fromObject(rfdRate));
		} catch (RoomListException e) {
			e.printStackTrace();
		}
		model.addAttribute("rsvList", rsvList);
		return "viewReservHis";
	}
	
	
	@RequestMapping("searchRsvDay.re")
	public ModelAndView searchRsvDay(ModelAndView mv, String day) {
		Date tday = new Date();
		SimpleDateFormat formate = new SimpleDateFormat ("yyyy-MM-dd");
		String today = formate.format(tday);
		
		if(day.equals(today)) {
			mv.addObject("day", null);
			mv.setViewName("redirect:viewHis.re");
			return mv;
		} else {
			mv.addObject("day", day);
			mv.setViewName("redirect:viewHis.re");
			return mv;
		}
	}

}
