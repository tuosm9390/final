package com.kh.hotels.mngSetting.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.voEtc.BrokenHistory;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.service.SettingService;
import com.kh.hotels.mngSetting.model.vo.SearchService;
import com.kh.hotels.mngSetting.model.vo.SearchStaff;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

@Controller
public class SettingController {
	
	@Autowired
	private SettingService ss;

	@RequestMapping("goSetting.st")
	public String goSettingPage(Model model, HttpServletRequest request) {
		
		ArrayList<SettingRoomType> roomTypeList = ss.selectRoomTypeList();

		for(int i = 0; i < roomTypeList.size(); i++) {
			roomTypeList.get(i).setRoomCount(ss.selectRoomCount(roomTypeList.get(i).getRtNo()));
		}
		
		model.addAttribute("roomTypeList", roomTypeList);
		
		return "hoteladmin/mngSettings/abtRoomType";
	}
	
	@RequestMapping("goRoomType.st")
	public String goRoomTypePage(Model model) {
		
		
		ArrayList<SettingRoomType> roomTypeList = ss.selectRoomTypeList();
		
		for(int i = 0; i < roomTypeList.size(); i++) {
			roomTypeList.get(i).setRoomCount(ss.selectRoomCount(roomTypeList.get(i).getRtNo()));
		}
		
		model.addAttribute("roomTypeList", roomTypeList);
		
		return "hoteladmin/mngSettings/abtRoomType";
	}
	
	
	@PostMapping("addRoomType.st")
	public String addRoomType(Model model, String rtName, String minPer, String maxPer, String limitprc) {
		
		String[] rtNames = rtName.split(",");
		String[] minPers = minPer.split(",");
		String[] maxPers = maxPer.split(",");
		String[] limitprcs = limitprc.split(",");
		
		ArrayList<RoomType> roomTypeList = new ArrayList<>();
		
		RoomType roomType;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String regDate = sdf.format(date);
		
		
		for(int i = 0; i < rtNames.length; i++) {
			roomType = new RoomType();
			roomType.setRtName(rtNames[i]);
			roomType.setMinPer(Integer.parseInt(minPers[i]));
			roomType.setMaxPer(Integer.parseInt(maxPers[i]));
			roomType.setLimitprc(Integer.parseInt(limitprcs[i]));
			roomType.setRegDate(regDate);
			
			roomTypeList.add(roomType);
		}
		
		int result = ss.insertRoomType(roomTypeList);
		
		if( result > 0 ) {
			return "redirect:/goRoomType.st";
		}else {
			model.addAttribute("msg", "객실타입추가 실패");
			return "common/errorPage";
		}
	}
	@RequestMapping("goRoomDetail.st")
	public String goRoomDetailPage(Model model) {
		
		ArrayList<SettingRoomType> roomTypeList = ss.selectRoomTypeList();
		
		for(int i = 0; i < roomTypeList.size(); i++) {
			roomTypeList.get(i).setRoomCount(ss.selectRoomCount(roomTypeList.get(i).getRtNo()));
		}
		
		
		model.addAttribute("roomTypeList", roomTypeList);
		
		return "hoteladmin/mngSettings/abtRoomDetail";
	}
	
	@PostMapping("roomDetailList.st")
	public ModelAndView roomDetailList(ModelAndView mv, String roomtypes) {
		
		int rtNo = Integer.parseInt(roomtypes);
		
		ArrayList<Room> roomDetailList = ss.selectRoomDetailList(rtNo);
		
		System.out.println("roomDetailList : " + roomDetailList);
		
		mv.addObject("roomDetailList", roomDetailList);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("goRoomFare.st")
	public String goRoomFarePage() {
		
		
		
		return "hoteladmin/mngSettings/abtRoomFare";
	}
	
	@RequestMapping("goBrokenRoom.st")
	public String goBrokenRoomPage(Model model) {
		
		ArrayList<BrokenRoom> brokenRoomList = ss.selectBrokenRoomList();
		
		model.addAttribute("brokenRoomList", brokenRoomList);
		
		return "hoteladmin/mngSettings/abtBrokenRoom";
	}
	
	@PostMapping("brokenAddRoomList.st")
	public ModelAndView brokenAddRoomList(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		
		HashMap<String, Object> roomList = ss.selectFloorList();

		mv.addObject("roomList", roomList);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("addBrokenRoom.st")
	public String addBrokenRoom(BrokenRoom brokenRoom, Model model) {
		
		int result = ss.insertBrokenRoom(brokenRoom);
		
		if(result > 0) {
			return "redirect:/goBrokenRoom.st";
		}else {
			model.addAttribute("msg", "고장객실 등록실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("goServiceSetting.st")
	public String goServiceSettingPage(Model model) {
		
		ArrayList<Svc> svcList = ss.selectServiceList();
		
		model.addAttribute("svcList", svcList);
		
		return "hoteladmin/mngSettings/abtServiceSetting";
	}

	@PostMapping("addService.st")
	public String addService(Model model, Svc svc) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String from = sdf.format(date);
		
		svc.setRegDate(from);
		
		int result = ss.insertNewService(svc);
		
		if(result > 0) {
			return "redirect:/goServiceSetting.st";
		}else {
			model.addAttribute("msg", "서비스 추가 실패");
			return "common/errorPage";
		}
	}
	@PostMapping("serviceDetail.st")
	public ModelAndView serviceDetail(ModelAndView mv, String svcCode) {
		
		Svc svc = ss.selectServiceOne(svcCode);
		System.out.println(svc);
		mv.addObject("svc", svc);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@PostMapping("updateService.st")
	public String updateService(Svc svc, Model model) {
		
		
		int result = ss.updateService(svc);
		
		if(result > 0) {
			return "redirect:/goServiceSetting.st";
		}else {
			model.addAttribute("msg", "서비스 변경 실패");
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("searchService.st")
	public String searchService(Model model, String serviceOption, String serviceValue) {
		
		SearchService searchService = new SearchService();
		if(serviceOption.equals("serviceCode")) {
			searchService.setServiceCode(serviceValue);
		}else if(serviceOption.equals("serviceName")) {
			searchService.setServiceName(serviceValue);
		}
		
		ArrayList<Svc> searchSvcList = ss.selectSearchServiceList(searchService);
		
		model.addAttribute("svcList", searchSvcList);
		
		return "hoteladmin/mngSettings/abtServiceSetting";
	}
	
	@RequestMapping("goReserv.st")
	public String goReserv() {
		
		return "hoteladmin/mngSettings/abtReserv";
	}
	@RequestMapping("goBill.st")
	public String goBill() {
		
		return "hoteladmin/mngSettings/abtBill";
	}
	
	//호텔 정보 조회, 수정
	@RequestMapping("hotelInfo.st")
	public String goHotelInfo(HttpServletRequest request, Model model) {
		
		
		ArrayList<HashMap<String, Object>> list = ss.selectHotelInfo();
		
		//RFD SEASON, WEEK
		ArrayList<HashMap<String, Object>> noShowList = ss.selectHotelNoshowInfo();
		//RFD SEASON, WEEKEND
		ArrayList<HashMap<String, Object>> rfdSWList = ss.selectHotelRfdSWInfo();
		//RFD OFFSEASON, WEEK
		ArrayList<HashMap<String, Object>> rfdOWList = ss.selectHotelRfdOWInfo();
		//RFD OFFSEASON, WEEKEND
		ArrayList<HashMap<String, Object>> rfdOWEList = ss.selectHotelRfdOWEInfo();
		
		model.addAttribute("list", list);
		model.addAttribute("noShowList", noShowList);
		model.addAttribute("rfdSWList", rfdSWList);
		model.addAttribute("rfdOWList", rfdOWList);
		model.addAttribute("rfdOWEList", rfdOWEList);
		
		
		System.out.println("list : " + list);
		System.out.println("noShowList : " + noShowList);
		System.out.println("rfdSWList : " + rfdSWList);
		System.out.println("rfdOWList : " + rfdOWList);
		System.out.println("rfdOWEList : " + rfdOWEList);
		
		return "hoteladmin/mngSettings/abtHotel/hotelInfo";
	}
	
	@RequestMapping("hotelUserInsert.st")
	public String goHotelUserInfo(HttpServletRequest request, Model model) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int staffCount = ss.getStaffListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, staffCount);
		
		ArrayList<Member> staffList = ss.selectStaffList(pi);
		
		model.addAttribute("staffCount", staffCount);
		model.addAttribute("staffList", staffList);
		model.addAttribute("pi", pi);
		
		
		
		return "hoteladmin/mngSettings/abtHotel/userInsert";

	}
		
	@PostMapping("staffDetail.st")
	public ModelAndView staffDetailModal(String mno, ModelAndView mv) {
		
		int staffMno = Integer.parseInt(mno);
		
		Member staff = ss.selectStaffInfo(staffMno);
		
		mv.addObject("staff", staff);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("pwdReset.st")
	public String pwdReset(Model model, String mno) {
		
		int staffMno = Integer.parseInt(mno);
		
		Member staff = new Member();
		staff.setMno(staffMno);
		staff.setUserPwd("0000");
		
		int result = ss.updateStaffPwdReset(staff);
		
		if(result > 0) {
			return "redirect:/hotelUserInsert.st";
		}else {
			model.addAttribute("msg", "비밀번호 초기화 실패");
			return "common/errorPage";
		}
		
	}
	@RequestMapping("searchStaff.st")
	public String searchStaff(String searchValue, String searchOption, HttpServletRequest request, Model model) {
		
		SearchStaff searchS = new SearchStaff();
		
		if(searchOption.equals("staffName")) {
			searchS.setStaffName(searchValue);
		}else if(searchOption.equals("staffId")) {
			searchS.setStaffId(searchValue);
		}
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int staffCount = ss.getSearchStaffListCount(searchS);

		PageInfo pi = Pagination.getPageInfo(currentPage, staffCount);
		
		ArrayList<Member> searchStaffList = ss.selectSearchStafftList(searchS, pi);
		
		model.addAttribute("check", "ok");
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchContent", searchValue);
		model.addAttribute("staffCount", staffCount);
		model.addAttribute("staffList", searchStaffList);
		model.addAttribute("pi", pi);
		
		return "hoteladmin/mngSettings/abtHotel/userInsert";
	}
	
	@PostMapping("updateStaff.st")
	public String updateStaffInfo(Model model,String mnoStaffDetailModal, String userNameStaffDetailModal
			, String phoneStaffDetailModal, String emailStaffDetailModal, String deptNoStaffDetailModal
			, String statusStaffDetailModal, String authNoStaffDetailModal) {
		
		Member staff = new Member();
		staff.setMno(Integer.parseInt(mnoStaffDetailModal));
		staff.setUserName(userNameStaffDetailModal);
		staff.setPhone(phoneStaffDetailModal);
		staff.setEmail(emailStaffDetailModal);
		staff.setDeptNo(Integer.parseInt(deptNoStaffDetailModal));
		staff.setStatus(statusStaffDetailModal);
		staff.setAuthNo(authNoStaffDetailModal);
		
		int result = ss.updateStaffInfo(staff);
		
		System.out.println("컨트롤러 접근 result  = " + result);
		
		if(result > 0) {
			return "redirect:/hotelUserInsert.st";
		}else {
			model.addAttribute("msg", "직원정보 수정 실패");
			return "common/errorPage";
		}
		
	}
}





























