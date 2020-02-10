package com.kh.hotels.mngSetting.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.controller.CommonsUtils;
import com.kh.hotels.common.model.vo.Attach;
import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomPrc;
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
	public String addRoomType(MultipartFile mainPhoto,MultipartHttpServletRequest subPhoto, Model model, HttpServletRequest request,
			RoomType roomType, RoomPrc roomPrc) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String regDate = sdf.format(date);
		
		roomType.setRegDate(regDate);
		
		int rtNo = ss.insertNewRoomType(roomType);
		
		roomType.setRtNo(rtNo);
		roomType.setRegDate(regDate);
		roomPrc.setRtNo(rtNo);
		roomPrc.setRegDate(regDate);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";
		
		
		String originNameMainPhoto = mainPhoto.getOriginalFilename();
		String ext = originNameMainPhoto.substring(originNameMainPhoto.lastIndexOf("."));
		
		String changeNameMainPhoto = CommonsUtils.getRandomString();
		
		ArrayList<Attach> attachList = new ArrayList<>();
		
		Attach attachMain = new Attach();
		attachMain.setRtNo(rtNo);
		attachMain.setFileLevel(1);
		attachMain.setOriginName(originNameMainPhoto);
		attachMain.setChangeName(changeNameMainPhoto);
		attachMain.setFilePath((filePath + "\\" + attachMain.getChangeName() + ext));
		
		attachList.add(attachMain);
		
		Attach attachSub;
		
		List<MultipartFile> mfListSub = subPhoto.getFiles("subPhoto");
		
		String[] subPhotoOriginFileNames = new String[mfListSub.size()];;
		
		for(int i = 0; i < mfListSub.size(); i++) {
			subPhotoOriginFileNames[i] = mfListSub.get(i).getOriginalFilename();
		}
		
		String[] extSub = new String[subPhotoOriginFileNames.length];
		for(int i = 0; i < subPhotoOriginFileNames.length; i++) {
			extSub[i] = subPhotoOriginFileNames[i].substring(subPhotoOriginFileNames[i].lastIndexOf("."));
		}
		
		for(int i = 0; i < mfListSub.size(); i++) {
			attachSub = new Attach();
			attachSub.setRtNo(rtNo);
			attachSub.setOriginName(subPhotoOriginFileNames[i]);
			attachSub.setChangeName(CommonsUtils.getRandomString());
			attachSub.setFilePath(filePath + "\\" + attachSub.getChangeName() + extSub[i]);
			attachSub.setFileLevel(2);
			attachList.add(attachSub);
			try {
				
				mfListSub.get(i).transferTo(new File(filePath + "\\" + attachSub.getChangeName() +  extSub[i]));
				
			} catch (IllegalStateException | IOException e) {
				
				new File(filePath + "\\" + attachSub.getChangeName() +  extSub[i]).delete();
				
			}
		}
		
		try {
			mainPhoto.transferTo(new File(filePath + "\\" + changeNameMainPhoto + ext));
		} catch (IllegalStateException | IOException e) {
			new File(filePath + "\\" + changeNameMainPhoto + ext).delete();
			e.printStackTrace();
		}
		
		int result = ss.insertNewRoomTypePhotoAndPrice(roomPrc, attachList);
		
		if(result > 0) {
			return "redirect:/goRoomType.st";
		}else {
			model.addAttribute("msg", "객실타입 생성실패");
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
	
	@PostMapping("minPerAndmaxPer.st")
	public ModelAndView minPerAndmaxPer(String activeTab, ModelAndView mv) {
		
		int rtNo = Integer.parseInt(activeTab);

		RoomType roomTypeMinPerMaxPer = ss.selectMinPerMaxPer(rtNo); 
		
		mv.addObject("roomTypeMinPerMaxPer", roomTypeMinPerMaxPer);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("addNewRoomDetail.st")
	public String addNewRoomDetail(String rtNoNew, String floorNew, String rmNumNew, String rmOptionNew, String stdPerNew, String statusNew, Model model) {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String regDate = sdf.format(date);
		
		String[] rtNos = rtNoNew.split(",");
		String[] floors = floorNew.split(",");
		String[] rmNums = rmNumNew.split(",");
		String[] rmOptions = rmOptionNew.split(",");
		String[] stdPers = stdPerNew.split(",");
		String[] statuss = statusNew.split(",");
		
		int[] rtNo = new int[rtNos.length];
		int[] stdPer = new int[stdPers.length];
		int[] floor = new int[floors.length];

		for(int i = 0; i < rtNos.length; i++) {
			rtNo[i] = Integer.parseInt(rtNos[i]);
			stdPer[i] = Integer.parseInt(stdPers[i]);
			floor[i] = Integer.parseInt(floors[i]);
		}
		
		ArrayList<Room> roomList = new ArrayList<>();
		for(int i = 0; i < rtNo.length; i++) {
			Room room = new Room();
			room.setRmNum(rmNums[i]);
			room.setStdPer(stdPer[i]);
			room.setRmOption(rmOptions[i]);
			room.setFloor(floor[i]);
			room.setRtNo(rtNo[i]);
			room.setRegDate(regDate);
			room.setRmStatus(statuss[i]);
			System.out.println(room.getRmStatus());
			roomList.add(room);
		}
		
		int result = ss.insertAddNewRoomDetail(roomList);
		
		if(result > 0) {
			return "redirect:/goRoomDetail.st";
		}else {
			model.addAttribute("msg", "객실추가실패");
			return "common/errorPage";
		}
		
	}
	@RequestMapping("disableRoom.st")
	public String disableRoom(String[] rmNoArr, Model model) {
		
		int[] rmNo = new int[rmNoArr.length];
		
		for(int i =0; i < rmNoArr.length; i++) {
			rmNo[i] = Integer.parseInt(rmNoArr[i]);
		}
		
		int result = ss.updateRoomDisable(rmNo);
		
		if(result > 0) {
			return "redirect:/goRoomDetail.st";
		}else {
			model.addAttribute("msg", "객실 상태 변경 실패");
			return "common/errorPage";
		}
		
	}
	@RequestMapping("enableRoom.st")
	public String enableRoom(String[] rmNoArr, Model model) {
		
		int[] rmNo = new int[rmNoArr.length];
		
		for(int i =0; i < rmNoArr.length; i++) {
			rmNo[i] = Integer.parseInt(rmNoArr[i]);
		}
		
		int result = ss.updateRoomEnable(rmNo);
		
		if(result > 0) {
			return "redirect:/goRoomDetail.st";
		}else {
			model.addAttribute("msg", "객실 상태 변경 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("goRoomFare.st")
	public String goRoomFarePage(Model model) {
		
		ArrayList<Prc> roomPrcList = ss.selectRoomPrcList();
		
		int roomTypeCount = ss.getRoomTypeCount();
		
		System.out.println("roomTypeCount  : " + roomTypeCount);
		System.out.println("roomPrcList  : " + roomPrcList);
		model.addAttribute("roomPrcList", roomPrcList);
		
		RoomPrc roomPrc = new RoomPrc();
		ArrayList<RoomPrc> roomFareList = new ArrayList<>();
		for(int i = 0; i < roomPrcList.size(); i++) {
			roomPrc.setRtNo(roomPrcList.get(i).getRtNo());
			roomPrc.setRtName(roomPrcList.get(i).getRtName());
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("MON") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setRentMon(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("TUE") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setRentTue(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("WED") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setRentWed(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("THU") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setRentThu(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("FRI") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setRentFri(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("SAT") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setRentSat(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("SUN") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setRentSun(roomPrcList.get(i).getPrice());
			}
			
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("MON") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setStayMon(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("TUE") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setStayTue(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("WED") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setStayWed(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("THU") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setStayThu(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("FRI") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setStayFri(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("SAT") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setStaySat(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("SEASON") && roomPrcList.get(i).getDayType().equals("SUN") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setStaySun(roomPrcList.get(i).getPrice());
			}
			
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("MON") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setOffRentMon(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("TUE") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setOffRentTue(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("WED") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setOffRentWed(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("THU") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setOffRentThu(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("FRI") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setOffRentFri(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("SAT") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setOffRentSat(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("SUN") && roomPrcList.get(i).getStayType().equals("LENT")) {
				roomPrc.setOffRentSun(roomPrcList.get(i).getPrice());
			}
			
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("MON") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setOffStayMon(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("TUE") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setOffStayTue(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("WED") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setOffStayWed(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("THU") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setOffStayThu(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("FRI") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setOffStayFri(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("SAT") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setOffStaySat(roomPrcList.get(i).getPrice());
			}
			if(roomPrcList.get(i).getTermType().equals("OFFSEASON") && roomPrcList.get(i).getDayType().equals("SUN") && roomPrcList.get(i).getStayType().equals("STAY")) {
				roomPrc.setOffStaySun(roomPrcList.get(i).getPrice());
			}

			if(roomPrc.getOffRentFri() > 0 && roomPrc.getOffRentMon() > 0 && roomPrc.getOffRentSat() > 0 && roomPrc.getOffRentSun() > 0 && roomPrc.getOffRentThu() > 0 &&
					roomPrc.getOffRentTue() > 0 && roomPrc.getOffRentWed() > 0 && roomPrc.getOffStayFri() > 0 && roomPrc.getOffStayMon() > 0 && roomPrc.getOffStaySat() > 0 &&
					roomPrc.getOffStaySun() > 0 && roomPrc.getOffStayThu() > 0 && roomPrc.getOffStayTue() > 0 && roomPrc.getOffStayWed() > 0 &&
					roomPrc.getRentFri() > 0 && roomPrc.getRentMon() > 0 && roomPrc.getRentSat() > 0 && roomPrc.getRentSun() > 0 && roomPrc.getRentThu() > 0 &&
					roomPrc.getRentTue() > 0 && roomPrc.getRentWed() > 0 && roomPrc.getStayFri() > 0 && roomPrc.getStayMon() > 0 && roomPrc.getStaySat() > 0 &&
					roomPrc.getStaySun() > 0 && roomPrc.getStayThu() > 0 && roomPrc.getStayTue() > 0 && roomPrc.getStayWed() > 0) {
				roomFareList.add(roomPrc);
				roomPrc = new RoomPrc();
			}
			
		}
		
		model.addAttribute("roomFareList", roomFareList);
		
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
	
	@RequestMapping("updateBrokenRoom.st")
	public String updateBrokenRoom(BrokenRoom brokenRoom, Model model) {
		
		int result = ss.updateBrokenRoom(brokenRoom);
		
		if(result > 0) {
			return "redirect:/goBrokenRoom.st";
		}else {
			model.addAttribute("msg", "고장객실 변경 실패 ");
			return "common/errorPage";
		}
		
	}
	@PostMapping("searchBrokenRoom.st")
	public String searchBrokenRoom(String brokenStart,String brokenEnd, Model model) {
		
		BrokenRoom brokenRoom = new BrokenRoom();
		brokenRoom.setBrkBegin(brokenStart);
		brokenRoom.setBrkEnd(brokenEnd);
		
		ArrayList<BrokenRoom> searchBrokenRoomList = ss.selectSearchBrokenRoomList(brokenRoom);
		
		model.addAttribute("brokenRoomList", searchBrokenRoomList);
		
		return "hoteladmin/mngSettings/abtBrokenRoom";
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
	
	@RequestMapping("goMail.st")
	public String goMail() {
		
		return "hoteladmin/mngSettings/abtMail";
	}
	

	
}





























