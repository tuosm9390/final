package com.kh.hotels.mngRooms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.service.RoomsService;
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

}
