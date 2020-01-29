package com.kh.hotels.hotel.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.hotel.controller.Pagination;
import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.hotel.model.service.HotelService;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Ans;
import com.kh.hotels.mngClient.model.vo.Que;
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
	public ModelAndView showHotelRooms(ModelAndView mv) {

		Map<String, RoomInfo> roomList = hs.selectRoomList();

		System.out.println("roomList : " + roomList);

		mv.addObject("roomList", roomList);
		mv.setViewName("hotelmain/rooms/roomList");

		return mv;
	}

	@RequestMapping("roomdetail.hmain")
	public String showHotelRoomsDetail(int roomType, HttpSession session) {

		RoomInfo roomInfo = hs.selectRoom(roomType);
		session.setAttribute("roomInfo", roomInfo);
		System.out.println("roomInfo : " + roomInfo);

		return "hotelmain/rooms/roomDetail";
	}

	@RequestMapping("reservation.hmain")
	public String showHotelRoomReservation(HttpSession session, Reservation rsv, Date checkIn, Date checkOut, int adult,
			int child) {

		
		rsv.setCheckIn(checkIn);
		rsv.setCheckOut(checkOut);
		rsv.setAdult(adult);
		rsv.setChild(child);

		session.setAttribute("rsv", rsv);

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
	public ModelAndView InsertReservation(ReservationCheck rsvCheck, ModelAndView mv) {
		System.out.println("rsvCheck : " + rsvCheck);
		
		// 날짜 계산
		int nYear;
		int nMonth;
		int nDay;

		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		nYear = calendar.get(Calendar.YEAR);
		nMonth = calendar.get(Calendar.MONTH) + 1;
		nDay = calendar.get(Calendar.DAY_OF_MONTH);

		String rsvNo = "";
		if (nMonth < 10) {
			rsvNo += nYear + "0" + nMonth + nDay;
		} else {
			rsvNo += nYear + nMonth + nDay;
		}

		System.out.println("날짜 : " + rsvNo);

		int rsvNoCnt = hs.reservationCnt(rsvNo);

		System.out.println("rsvNoCnt : " + rsvNoCnt);

		// 형식에 맞게 생성
		if (rsvNoCnt < 9) {
			rsvNo += "00" + (int) (rsvNoCnt + 1);
		} else if (rsvNoCnt < 99) {
			rsvNo += "0" + (int) (rsvNoCnt + 1);
		} else {
			rsvNo += (int) (rsvNoCnt + 1);
		}

		System.out.println("생성된 예약번호 : " + rsvNo);
		rsvCheck.setRsvNo(rsvNo);
		
		// 예약자 회원번호 호출 메소드
		Member selectMember;
		selectMember = hs.selectMember(rsvCheck);
		System.out.println("selectMember :" + selectMember);
		
		// 예약자 정보가 있을 경우
		if(selectMember != null) {
			// 불러온 예약자회원번호 객체에 저장
			rsvCheck.setMno(selectMember.getMno());
			System.out.println("rsvCheck.getMno() : " + rsvCheck.getMno());
		} else {
			// 예약자 정보가 없을 경우
			// 회원정보 등록
			int insertMember = hs.insertMember(rsvCheck);
			System.out.println("멤버 insert : " + insertMember);
			
			// 예약자 회원번호 호출
			selectMember = hs.selectMember(rsvCheck);
			rsvCheck.setMno(selectMember.getMno());
		}
		
		// 예약정보 등록
		System.out.println("rsvCheck : " + rsvCheck);
		int result = hs.insertReservation(rsvCheck);
		
		if (result > 0) {
			mv.addObject("rsvCheck", rsvCheck);
			mv.setViewName("hotelmain/rooms/roomReservationResult");
		} else {
			mv.addObject("error", "예약 정보 입력 실패");
			mv.setViewName("hotelmain/common/errorPage");
		}

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
	public ModelAndView showHotelQnA(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="searchCondition", required = false) String searchCondition,
			@RequestParam(value="searchValue", required = false) String searchValue) {
		int currentPage = 1;
		
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchValue : " + searchValue);
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = 0;
		PageInfo p = new PageInfo();
		PageInfo pi = null;
		
		if(searchValue == null) {
			listCount = hs.listCount(p);
			pi = Pagination.getPageInfo(currentPage, listCount);
		} else {
			p.setSearchCondition(searchCondition);
			p.setSearchValue(searchValue);
			listCount = hs.listCount(p);
			System.out.println("listCount : " + listCount);
			pi = Pagination.getPageInfo(currentPage, listCount, searchCondition, searchValue);
		}
		
//		Map<String, Que> qnaList = hs.selectQnAList();
		List<Que> qnaList = null;
		
		try {
			qnaList = hs.selectQnAList(pi);
			mv.addObject("qnaList", qnaList);
			mv.addObject("pi", pi);
			mv.setViewName("hotelmain/QnA/QnAList");
		} catch (QnASelectListException e) {
			mv.addObject("error", "게시물 조회 실패");
			mv.setViewName("hotelmain/common/errorPage");
			
		}
		
		return mv;
	}

	@RequestMapping("qnadetail.hmain")
	public ModelAndView showHotelQnADetail(ModelAndView mv, Que q, @RequestParam("type") String type,
			@RequestParam(value="pwd", required=false) String pwd) {
		
		Que selectQnA = hs.selectOneQnA(q);
		System.out.println("비밀번호 : " + selectQnA.getQpwd());
		System.out.println("입력한 비밀번호 : " + pwd);
		
		Member m = hs.selectMember(selectQnA);
		selectQnA.setUserName(m.getUserName());
		
		// 비밀글일 경우
		if(type.equals("lock")) {
			// 비밀번호 일치 시
			if(selectQnA.getQpwd().equals(pwd)) {
				// 답변 있을 경우
				if(selectQnA.getAnsStatus().equals("Y")) {
					Ans ans = hs.selectOneAns(q);
					mv.addObject("a", ans);
				}
				mv.addObject("q", selectQnA);
				mv.setViewName("hotelmain/QnA/QnADetail");
			} else {
				mv.addObject("error", "비밀번호가 맞지 않습니다.");
				mv.setViewName("hotelmain/common/errorPage");
			}
		// 비밀글 아닐 경우
		} else {
			// 답변 있을 경우
			if(selectQnA.getAnsStatus().equals("Y")) {
				Ans ans = hs.selectOneAns(q);
				mv.addObject("a", ans);
			}
			mv.addObject("q", selectQnA);
			mv.setViewName("hotelmain/QnA/QnADetail");
		}
		
		return mv;
	}

	@RequestMapping("qnaInsertForm.hmain")
	public String showHotelQnAInsert() {

		return "hotelmain/QnA/InsertQnAForm";
	}
	
	@RequestMapping("goQnAInsert.hmain")
	public ModelAndView insertQnA(ModelAndView mv, Que q, Member m) {
		
		Member selectMember = hs.selectMember(m);
		
		// 회원정보가 있을 때
		if(selectMember != null) {
			// 불러온 문의자회원번호 객체에 저장
			q.setMno(selectMember.getMno());
			// 회원정보가 없을 때
		} else {
			// 문의자 회원정보 입력 후
			int insertMember = hs.insertMember(m);
			
			if(insertMember > 0) {
				// 불러온 문의자회원번호 객체에 저장
				selectMember = hs.selectMember(m);
				q.setMno(selectMember.getMno());
			} else {
				
			}
		}
		
		System.out.println("q : " + q);
		
		// 문의 정보 입력
		int result = hs.insertQnA(q);
		
		if(result > 0) {
			mv.setViewName("redirect:goQnA.hmain");
		} else {
			mv.addObject("error", "문의 정보 입력 실패");
			mv.setViewName("hotelmain/common/errorPage");
		}
		
		return mv;
	}

}
