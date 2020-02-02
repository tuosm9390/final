package com.kh.hotels.mngRooms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.InsertStayException;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.service.RoomsService;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.RuleInfo;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class RoomsController {
	
	@Autowired
	private RoomsService rs;
	
	@GetMapping("view.ro")
	public String goMngRooms(Model model) {
		ArrayList<RoomList> roomList;
		ArrayList<Prc> roomPrice;
		ArrayList<ServiceList> svcList;
		RuleInfo ruleInfo;
		
		try {
			roomList = rs.viewRoomList();
			roomPrice = rs.viewRoomPrice();
			svcList = rs.viewServiceList();
			ruleInfo = rs.viewRuleInfo();
			ruleInfo.setServiceRate(ruleInfo.getSvcRate() / 100.0);
			ruleInfo.setNoshowUnit(Integer.parseInt(ruleInfo.getNsUnit()));
			ruleInfo.setRentUnit(Integer.parseInt(ruleInfo.getLtUnit()));
			
			model.addAttribute("roomList", roomList);
			model.addAttribute("roomPrice", roomPrice);
			model.addAttribute("svcList", svcList);
			model.addAttribute("ruleInfo", ruleInfo);
			
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray2 = new JSONArray();
			JSONArray jsonArray3 = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			
			model.addAttribute("jsonList", jsonArray.fromObject(roomList));
			model.addAttribute("jsonList2", jsonArray.fromObject(roomPrice));
			model.addAttribute("jsonList3", jsonArray.fromObject(svcList));
			model.addAttribute("jsonObject", JSONObject.fromObject(ruleInfo));
			
			return "mngRooms/viewRoomList";
		} catch (RoomListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage.jsp";
		}
	}
	
	@RequestMapping("ajxFindClient.ro")
	public ModelAndView ajxFindClient(ModelAndView mv, String searchName) {
		ArrayList<Member> clientList = rs.ajxFindClient(searchName);
		if(clientList == null) {
			Member noOne = new Member();
			clientList.add(noOne);
		}
		mv.addObject("clientList", clientList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("ajxInsertClient.ro")
	public ModelAndView ajxInsertClient(ModelAndView mv, String cName, String cTel, String cEmail) {
		CheckIn newClient = new CheckIn();
		newClient.setClientName(cName);
		newClient.setClientPhone(cTel);
		newClient.setClientEmail(cEmail);
		try {
			rs.ajxInsertClient(newClient);
			mv.setViewName("jsonView");
		} catch (InsertStayException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage.jsp");
		}
		return mv;
	}
	
	@RequestMapping("ajxFindTempClient.ro")
	public ModelAndView ajxFindTempClient(ModelAndView mv, String hipen) {
		int tempCnt = 0;
		ArrayList<Member> clientList = rs.ajxFindTempClient(hipen);
		if(clientList != null) {
			tempCnt = clientList.size();
		}
		mv.addObject("tempClientCnt", tempCnt);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("insertCI.ro")
	public ModelAndView insertCheckIn(ModelAndView mv, CheckIn checkIn) {
		try {
			if(checkIn.getClientNo() == 0) {
				rs.insertTempMember(checkIn);
				checkIn.setClientNo(rs.selectMno(checkIn.getClientName()));
			}
			
			if(checkIn.isRentYN()) {
				checkIn.setLentYN("LENT");
			} else {
				checkIn.setLentYN("STAY");
			}
			checkIn.setTotalPay(checkIn.getCreditCard() + checkIn.getCash() + checkIn.getAccount());
			
			System.out.println(checkIn);
		
			rs.insertCheckIn(checkIn);
			mv.setViewName("redirect:view.ro");
		} catch (InsertStayException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage.jsp");
		}
		return mv;
	}

}
