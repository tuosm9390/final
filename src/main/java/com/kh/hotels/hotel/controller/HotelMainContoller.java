package com.kh.hotels.hotel.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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

	// 호텔 메인 페이지 메소드
	@RequestMapping("goMain.hmain")
	public String showHotelMain(SessionStatus session) {
		session.setComplete();

		return "hotelmain/main/main";
	}

	// 객실 리스트 메소드
	@RequestMapping("goRooms.hmain")
	public ModelAndView showHotelRooms(ModelAndView mv, SessionStatus session) {
		session.setComplete();
		
		ArrayList<RoomInfo> roomList = hs.selectRoomList();
		
		System.out.println("roomList : " + roomList);
		
		String[] filePathList = new String[roomList.size()];
		
		for(int i = 0; i < roomList.size(); i++) {
			filePathList[i] = roomList.get(i).getFilePath().substring(47).replace('\\', '/');
			System.out.println("filePathList[" + i + "] : " + filePathList[i]);
		}
		
		mv.addObject("filePathList", filePathList);
		mv.addObject("roomList", roomList);
		mv.setViewName("hotelmain/rooms/roomList");

		return mv;
	}

	// 객실 정보 조회 메소드
	@RequestMapping("roomdetail.hmain")
	public String showHotelRoomsDetail(int roomType, HttpSession session) {

		ArrayList<RoomInfo> roomInfo = hs.selectRoom(roomType);
		
		String[] filePathList = new String[roomInfo.size()];
		
		for(int i = 0; i < roomInfo.size(); i++) {
			filePathList[i] = roomInfo.get(i).getFilePath().substring(47).replace('\\', '/');
			System.out.println("filePathList[" + i + "] : " + filePathList[i]);
		}
		
		session.setAttribute("listsize", filePathList.length);
		session.setAttribute("filePathList", filePathList);
		session.setAttribute("roomInfo", roomInfo.get(0));
		System.out.println("roomInfo : " + roomInfo);

		return "hotelmain/rooms/roomDetail";
	}

	// 예약 메소드
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

	// 결제 메소드
	@PostMapping("reservationPay.hmain")
	public String test(ReservationCheck rsvCheck, int roomType, HttpSession session) {
		
		System.out.println("roomType : " + roomType);
		System.out.println(session.getAttribute("rsv"));
//		 날짜 계산
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
		
		// 객실호수 지정 메소드
		List<RoomInfo> roomNoList = hs.selectRoomNoList(roomType);
		
		System.out.println("roomNoList : " + roomNoList);
		
		// 난수 발생
		int r = (int) (Math.random() * roomNoList.size());
		
		// 객실유형별 호수 갯수만큼 반복돌려서 난수와 같은 index에 있는 호수 지정
		for(int i = 0; i < roomNoList.size(); i++) {
			if(i == r) {
				rsvCheck.setRmNo(roomNoList.get(r).getRm_No());
			}
		}
		
		session.setAttribute("rsvCheck", rsvCheck);
		
		return "hotelmain/rooms/ReservationPayPage";
	}
	
	// 예약 및 결제 결과 메소드
	@PostMapping("reservationResult.hmain")
	public ModelAndView InsertReservation(ReservationCheck rsvCheck, ModelAndView mv, SessionStatus session) {
		
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
		java.util.Date date = new java.util.Date();
		rsvCheck.setRsvDate(date);
		System.out.println("rsvCheck : " + rsvCheck);
		int result = hs.insertReservation(rsvCheck);
		
		if(rsvCheck.getRsvOption().equals("Y")) {
			int insertBreakfast = hs.insertBreakfast(rsvCheck);
		}
		
		int roomType = hs.selectRoomType(rsvCheck.getRsvNo());
		
		ArrayList<RoomInfo> roomInfo = hs.selectRoom(roomType);
		
		String[] filePathList = new String[roomInfo.size()];
		
		for(int i = 0; i < roomInfo.size(); i++) {
			filePathList[i] = roomInfo.get(i).getFilePath().substring(47).replace('\\', '/');
			System.out.println("filePathList[" + i + "] : " + filePathList[i]);
		}
		
		if (result > 0) {
			mv.addObject("filePathList", filePathList);
			mv.addObject("rsvCheck", rsvCheck);
			mv.setViewName("hotelmain/rooms/roomReservationResult");
		} else {
			mv.addObject("error", "예약 정보 입력 실패");
			mv.setViewName("hotelmain/common/errorPage");
		}

		session.setComplete();
		
		return mv;
	}

	// 예약 확인 메소드
	@RequestMapping("ReservationCheck.hmain")
	public ModelAndView showHotelReservationCheck(ModelAndView mv, String rsvNo, String phone, String userName) {

//		System.out.println("userName : " + userName);
//		정보 담기용 객체
		ReservationCheck rsv = new ReservationCheck();
		rsv.setRsvNo(rsvNo);
		rsv.setPhone(phone);
		rsv.setUserName(userName);

		ReservationCheck rsvCheck = hs.reservationCheck(rsv);
		
		int roomType = hs.selectRoomType(rsvNo);
		
		ArrayList<RoomInfo> roomInfo = hs.selectRoom(roomType);
		
		String[] filePathList = new String[roomInfo.size()];
		
		for(int i = 0; i < roomInfo.size(); i++) {
			filePathList[i] = roomInfo.get(i).getFilePath().substring(47).replace('\\', '/');
			System.out.println("filePathList[" + i + "] : " + filePathList[i]);
		}
		
		System.out.println("rsvCheck : " + rsvCheck);
		mv.addObject("filePathList", filePathList);
		mv.addObject("ReservationCheck", rsvCheck);
		mv.setViewName("hotelmain/rooms/ReservationCheck");

		return mv;
	}
	
	// 문의 리스트 메소드
	@RequestMapping("goQnA.hmain")
	public ModelAndView showHotelQnA(ModelAndView mv, HttpServletRequest request) {
		int currentPage = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = hs.listCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		map.put("pi", pi);
		List<Que> qnaList = null;
		
		try {
			qnaList = hs.selectQnAList(map);
			System.out.println("qnaList : " + qnaList);
			mv.addObject("qnaList", qnaList);
			mv.addObject("path", "goQnA.hmain");
			mv.addObject("pi", pi);
			mv.setViewName("hotelmain/QnA/QnAList");
		} catch (QnASelectListException e) {
			mv.addObject("error", "게시물 조회 실패");
			mv.setViewName("hotelmain/common/errorPage");
		}
		
		return mv;
	}
	
	// 문의 검색 메소드
	@RequestMapping("searchQnA.hmain")
	public ModelAndView searchQnA(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="searchCondition", required = false) String searchCondition,
			@RequestParam(value = "searchValue", required = false) String searchValue) {
		int currentPage = 1;

		Map<String, Object> map = new HashMap<String, Object>();

		if (searchCondition != null && searchValue != null) {
			map.put("searchCondition", searchCondition);
			map.put("searchValue", searchValue);
		}

		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchValue : " + searchValue);

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = hs.listCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		map.put("pi", pi);
		map.put("searchCondition", searchCondition);
		map.put("searchValue", searchValue);
		System.out.println("map : " + map);
		List<Que> qnaList = null;

		try {
			qnaList = hs.selectQnAList(map);
			System.out.println("searchQnaList : " + qnaList);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.addObject("path", "searchQnA.hmain");
			mv.addObject("qnaList", qnaList);
			mv.addObject("pi", pi);
			mv.setViewName("hotelmain/QnA/QnAList");
		} catch (QnASelectListException e) {
			mv.addObject("error", "게시물 조회 실패");
			mv.setViewName("hotelmain/common/errorPage");
			
		}
		
		return mv;
	}

	// 문의 상세 페이지 메소드
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

	// 문의 등록 페이지 메소드
	@RequestMapping("qnaInsertForm.hmain")
	public String showHotelQnAInsert() {

		return "hotelmain/QnA/InsertQnAForm";
	}
	
	// 문의 등록 메소드
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
