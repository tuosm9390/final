package com.kh.hotels.mngRooms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RoomsController {
	
	@GetMapping("view.ro")
	public String goMngRooms() {
		return "viewRoomList";
	}

}
