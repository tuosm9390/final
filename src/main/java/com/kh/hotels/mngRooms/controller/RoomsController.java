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
import com.kh.hotels.mngRooms.model.exception.BrokenRoomException;
import com.kh.hotels.mngRooms.model.exception.InsertStayException;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.exception.UpdateRoomException;
import com.kh.hotels.mngRooms.model.service.RoomsService;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.ModalClient;
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
			return "common/errorPage";
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
			mv.setViewName("common/errorPage");
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
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("ajxFindBrokenHis.ro")
	public ModelAndView ajxFindBrokenHis(ModelAndView mv, int rmNo) {
		BrokenRoom brkRoom;
		try {
			brkRoom = rs.ajxFindBrokenHis(rmNo);
			mv.addObject("brkRoom", brkRoom);
			mv.setViewName("jsonView");
		} catch (BrokenRoomException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("ajxUpdateBrkStt.ro")
	public ModelAndView ajxUpdateBrkStt(ModelAndView mv, int rmNo) {
		try {
			rs.ajxUpdateBrkStt(rmNo);
		} catch (BrokenRoomException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("ajxUpdateRoomStt.ro")
	public ModelAndView ajxUpdateRoomStt(ModelAndView mv, String nowStt, int rmNo) { 
		System.out.println(nowStt);
		try {
			int result = rs.ajxUpdateRoomStt(nowStt, rmNo);
			if(result > 0) {
				mv.addObject("result", "success");
			} else {
				mv.addObject("result", "fail");
			}
			mv.setViewName("jsonView");
		} catch (UpdateRoomException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("ajxUpdateAllRoomStt.ro")
	public ModelAndView ajxUpdateAllRoomStt(ModelAndView mv, String nowStt, String[] floor) {
		ArrayList<String> floorList = new ArrayList<String>();
		for(String f : floor) {
			floorList.add(f);
		}
		if(floorList.get(0).equals("all")) {
			floorList.remove(0);
		}
		int result = rs.ajxUpdateAllRoomStt(nowStt, floorList);
		if(result > 0) {
			mv.addObject("floorlist", floorList);
			mv.addObject("result", "success");
		} else {
			mv.addObject("result", "fail");
		}
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("ajxSelectRsvInfo.ro")
	public ModelAndView ajxSelectRsvInfo(ModelAndView mv, String rsvNo) {
		ModalClient info = rs.ajxSelectRsvInfo(rsvNo);
		ArrayList<ModalClient> svcInfo = rs.ajxSelectRsvSvc(rsvNo);
		ArrayList<ModalClient> payInfo = rs.ajxSelectRsvPay(rsvNo);
		
		mv.addObject("stayInfo", info);
		mv.addObject("staySvc", svcInfo);
		mv.addObject("stayPay", payInfo);
		mv.setViewName("jsonView");
		return mv;
	}
	 
	
	@RequestMapping("ajxSelectStayInfo.ro")
	public ModelAndView ajxSelectStayInfo(ModelAndView mv, String stayNo) {
		ModalClient info = rs.ajxSelectStayInfo(Integer.parseInt(stayNo));
		ArrayList<ModalClient> svcInfo = rs.ajxSelectStaySvc(Integer.parseInt(stayNo));
		ArrayList<ModalClient> payInfo = rs.ajxSelectStayPay(Integer.parseInt(stayNo));
		
		mv.addObject("stayInfo", info);
		mv.addObject("staySvc", svcInfo);
		mv.addObject("stayPay", payInfo);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping("cancelReserv.ro")
	public ModelAndView cancelReserv(ModelAndView mv, String rsvNo) {
		mv.setViewName("redirect:view.ro");
		return mv;
	}

}
