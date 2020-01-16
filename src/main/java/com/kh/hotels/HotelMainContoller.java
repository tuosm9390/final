package com.kh.hotels;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HotelMainContoller {
	
	@GetMapping("goMain.hmain")
	public String showHotelMain() {
		
		return "hotelmain/main/main";
	}
	
	@RequestMapping("goRooms.hmain")
	public String showHotelRooms() {
		
		return "hotelmain/rooms/roomList";
	}
	
	@RequestMapping("roomdetail.hmain")
	public String showHotelRoomsDetail() {
		
		return "hotelmain/rooms/roomDetail";
	}
	
	@RequestMapping("reservation.hmain")
	public String showHotelRoomReservation(HttpServletRequest request, Date checkIn, Date checkOut) {
		
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		
		return "hotelmain/rooms/roomReservation";
	}
	
}
