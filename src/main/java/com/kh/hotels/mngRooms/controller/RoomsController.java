package com.kh.hotels.mngRooms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.service.RoomsService;
import com.kh.hotels.mngRooms.model.vo.RoomList;

import net.sf.json.JSONArray;

@Controller
public class RoomsController {
	
	@Autowired
	private RoomsService rs;
	
	@GetMapping("view.ro")
	public String goMngRooms(Model model) {
		ArrayList<RoomList> roomList;
		try {
			roomList = rs.viewRoomList();
			model.addAttribute("roomList", roomList);
			JSONArray jsonArray = new JSONArray();
			model.addAttribute("jsonList", jsonArray.fromObject(roomList));
			return "mngRooms/viewRoomList";
		} catch (RoomListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage.jsp";
		}
	}

}
