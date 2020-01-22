package com.kh.hotels;

import javax.servlet.http.HttpServletRequest;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String showHotelRoomReservation(HttpServletRequest request,
			@RequestParam("CheckIn") @DateTimeFormat(iso = ISO.DATE) String CheckIn,
			@RequestParam("CheckOut") @DateTimeFormat(pattern="yyyy-MM-dd") String CheckOut) {

		request.setAttribute("CheckIn", CheckIn);
		request.setAttribute("CheckOut", CheckOut);

		return "hotelmain/rooms/roomReservation";
	}

	@RequestMapping("reservationResult.hmain")
	public String showHotelRoomReservationResult() {

		return "hotelmain/rooms/roomReservationResult";
	}

	@RequestMapping("ReservationCheck.hmain")
	public String showHotelReservationCheck() {

		return "hotelmain/rooms/ReservationCheck";
	}

	@RequestMapping("goQnA.hmain")
	public String showHotelQnA() {

		return "hotelmain/QnA/QnAList";
	}

	@RequestMapping("qnadetail.hmain")
	public String showHotelQnADetail() {

		return "hotelmain/QnA/QnADetail";
	}

	@RequestMapping("qnaInsert.hmain")
	public String showHotelQnAInsert() {

		return "hotelmain/QnA/InsertQnA";
	}

}
