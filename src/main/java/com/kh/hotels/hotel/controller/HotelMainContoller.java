package com.kh.hotels.hotel.controller;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.hotel.model.service.HotelService;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.Reservation;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

@Controller
public class HotelMainContoller {
	@Autowired
	private HotelService hs;
	
	@RequestMapping("goMain.hmain")
	public String showHotelMain() {

		return "hotelmain/main/main";
	}

	@RequestMapping("goRooms.hmain")
	public ModelAndView showHotelRooms(HttpServletRequest request, ModelAndView mv) {

		Map<String, RoomInfo> roomList = hs.selectRoomList();
		
		System.out.println("roomList : " + roomList);
		
		mv.addObject("roomList", roomList);
		mv.setViewName("hotelmain/rooms/roomList");
		
		return mv;
	}

	@RequestMapping("roomdetail.hmain")
	public String showHotelRoomsDetail(int roomType, HttpSession session) {
		
		RoomInfo roomInfo = hs.selectRoomList(roomType);
		session.setAttribute("roomInfo", roomInfo);
		System.out.println("roomInfo : " + roomInfo);
		
		return "hotelmain/rooms/roomDetail";
	}

	@RequestMapping("reservation.hmain")
	public String showHotelRoomReservation(HttpSession session, Reservation rsv,
			Date checkIn, Date checkOut, int adult, int child) {
		
		rsv.setCheckIn(checkIn);
		rsv.setCheckOut(checkOut);
		rsv.setAdult(adult);
		rsv.setChild(child);
		
		session.setAttribute("rsv", rsv);
//		System.out.println("rsv : " + rsv);
		return "hotelmain/rooms/roomReservation";
	}

//	@RequestMapping("reservationResult.hmain")
//	public String showHotelRoomReservationResult(HttpServletRequest request,
//			@DateTimeFormat(iso = ISO.DATE) String CheckIn,
//			@DateTimeFormat(pattern="yyyy-MM-dd") String CheckOut,
//			String adult, String children, String checkIntime, String reservName) {
//
//		request.setAttribute("CheckIn", CheckIn);
//		request.setAttribute("CheckOut", CheckOut);
//		request.setAttribute("adult", adult);
//		request.setAttribute("children", children);
//		request.setAttribute("checkIntime", checkIntime);
//		request.setAttribute("reservName", reservName);
//		
//		System.out.println("CheckIn : " + CheckIn);
//		System.out.println("adult : " + adult);
//		System.out.println("checkIntime : " + checkIntime);
//		
//		return "hotelmain/rooms/roomReservationResult";
//	}

	@PostMapping("reservationResult.hmain")
	public ModelAndView loginCheck(ReservationCheck rsvCheck, ModelAndView mv) {
		
//		int result = hs.insertReservation(rsvCheck);
		
		
		mv.setViewName("hotelmain/rooms/roomReservationResult");

		return mv;
	}

	@RequestMapping("ReservationCheck.hmain")
	public ModelAndView showHotelReservationCheck(ModelAndView mv, String rsvNo, String phone, String userName) {
		
//		System.out.println("userName : " + userName);
//		정보 담기용 객체
		ReservationCheck rsv = new ReservationCheck();
		rsv.setRsvNo(rsvNo);
		rsv.setPhone(phone);
		rsv.setUserName(userName);
		
		ReservationCheck rsvCheck = hs.reservationCheck(rsv);
		System.out.println("rsvCheck : " + rsvCheck);
		mv.addObject("ReservationCheck", rsvCheck);
		mv.setViewName("hotelmain/rooms/ReservationCheck");
		
		return mv;
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
