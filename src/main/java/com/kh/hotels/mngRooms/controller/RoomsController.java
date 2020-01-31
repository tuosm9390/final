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
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.service.RoomsService;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

import net.sf.json.JSONArray;

@Controller
public class RoomsController {
	
	@Autowired
	private RoomsService rs;
	
	@GetMapping("view.ro")
	public String goMngRooms(Model model) {
		ArrayList<RoomList> roomList;
		ArrayList<Prc> roomPrice;
		ArrayList<ServiceList> svcList;
		
		try {
			roomList = rs.viewRoomList();
			roomPrice = rs.viewRoomPrice();
			svcList = rs.viewServiceList();
			
			model.addAttribute("roomList", roomList);
			model.addAttribute("roomPrice", roomPrice);
			model.addAttribute("svcList", svcList);
			
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray2 = new JSONArray();
			JSONArray jsonArray3 = new JSONArray();
			
			model.addAttribute("jsonList", jsonArray.fromObject(roomList));
			model.addAttribute("jsonList2", jsonArray.fromObject(roomPrice));
			model.addAttribute("jsonList3", jsonArray.fromObject(svcList));
			
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
	
	@PostMapping("insertCI.ro")
	public ModelAndView insertCheckIn(ModelAndView mv, CheckIn checkIn) {
		
		//여기여기여기여기여기
		if(checkIn.isRentYN()) {
			checkIn.setLentYN("LENT");
		} else {
			checkIn.setLentYN("STAY");
		}
		rs.insertCheckIn(checkIn);
		return mv;
	}

}
