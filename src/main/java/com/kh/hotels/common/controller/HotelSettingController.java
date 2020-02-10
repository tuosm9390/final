package com.kh.hotels.common.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.hotels.common.model.service.CommonService;
import com.kh.hotels.common.model.vo.Attach;
import com.kh.hotels.common.model.vo.Basic;
import com.kh.hotels.common.model.vo.Cal;
import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.common.model.vo.Law;
import com.kh.hotels.common.model.vo.NoShow;
import com.kh.hotels.common.model.vo.OffSeason;
import com.kh.hotels.common.model.vo.Rfd;
import com.kh.hotels.common.model.vo.Rule;
import com.kh.hotels.common.model.vo.Season;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomPrc;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;

@SessionAttributes({"info","rule","basic","noShow","cal","offSeason","season","roomTypeList","roomList","roomPrcList","svcList"})
@Controller
public class HotelSettingController {
	
	@Autowired
	private CommonService cs;
	
	@RequestMapping("goHotelRoomTypePage.set")
	public String goHotelRoomTypeSetting() {
		
		return "hotelSetting/hotelRoomTypeSetting";
		
	}
	@RequestMapping("goHotelRoomDetailPage.set")
	public String goHotelRoomDetailSetting() {
		
		return "hotelSetting/hotelRoomDetailSetting";
		
	}
	@RequestMapping("goHotelRoomFarePage.set")
	public String goHotelRoomFareSetting() {
		
		return "hotelSetting/hotelRoomFareSetting";
		
	}
	@RequestMapping("goHotelAddServicePage.set")
	public String goHotelAddServicePage() {
		
		return "hotelSetting/hotelAddService";
		
	}
	@RequestMapping("goHotelFormSettingPage.set")
	public String goHotelFormSettingPage() {
		
		return "hotelSetting/hotelFormSetting";
		
	}
	@RequestMapping("goHotelSettingSummaryPage.set")
	public String goHotelSettingSummaryPage() {
		
		return "hotelSetting/hotelSettingSummary";
		
	}
	@RequestMapping("goHotelAddImages.set")
	public String goHotelAddImagesPage() {
		
		return "hotelSetting/hotelAddImages";
		
	}
	
	@RequestMapping("backHotelInfoSettingPage.set")
	public String goHotelInfoSetting(SessionStatus status,Model model) {
		
		int result = cs.deleteInfomation();
		
		if(result > 0) {
			
			return "hotelSetting/hotelInfoSetting";
		}else {
			model.addAttribute("msg", "정보삭제실패");
			return "common/errorPage";
		}
		
		
	}
	@RequestMapping("backRoomTypeSetting.set")
	public String backRoomTypeSetting(SessionStatus status, Model model) {
		
		int result = cs.deleteRoomType();
		
		if(result > 0) {
			return "hotelSetting/hotelRoomTypeSetting";
		}else {
			model.addAttribute("msg", "룸타입정보 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("goRoomTypePage.set")
	public String nextRoomTypePage(Info info, Rule rule, Law law,Basic basic, NoShow noShow, Cal cal, Rfd rfd,OffSeason offSeason, Season season, HttpServletRequest request, Model model) {
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
		info.setModDate(to);
		basic.setLtype("BASIC");
		noShow.setLtype("NOSHOW");
		cal.setLtype("CAL");
		rfd.setLtype("RFD");
		
		model.addAttribute("info", info);
		model.addAttribute("rule", rule);
		model.addAttribute("basic", basic);
		model.addAttribute("noShow", noShow);
		model.addAttribute("cal", cal);
 
//		int offSeasonWeek2 = Integer.parseInt(request.getParameter("offSeasonWeek2"));
//		int offSeasonWeek1 = Integer.parseInt(request.getParameter("offSeasonWeek1"));
//		int offSeasonWeek0 = Integer.parseInt(request.getParameter("offSeasonWeek0"));
//		int offSeasonWeekend2 = Integer.parseInt(request.getParameter("offSeasonWeekend2"));
//		int offSeasonWeekend1 = Integer.parseInt(request.getParameter("offSeasonWeekend1"));
//		int offSeasonWeekend0 = Integer.parseInt(request.getParameter("offSeasonWeekend0"));
//		
//		HashMap<String, Object> offSeason = new HashMap<>();
//		offSeason.put("offSeasonWeek2", offSeasonWeek2);
//		offSeason.put("offSeasonWeek1", offSeasonWeek1);
//		offSeason.put("offSeasonWeek0", offSeasonWeek0);
//		offSeason.put("offSeasonWeekend2", offSeasonWeekend2);
//		offSeason.put("offSeasonWeekend1", offSeasonWeekend1);
//		offSeason.put("offSeasonWeekend0", offSeasonWeekend0);
//		offSeason.put("hname", info.getHname());
//		
//		int seasonWeek10 = Integer.parseInt(request.getParameter("seasonWeek10"));
//		int seasonWeek7 = Integer.parseInt(request.getParameter("seasonWeek7"));
//		int seasonWeek5 = Integer.parseInt(request.getParameter("seasonWeek5"));
//		int seasonWeek3 = Integer.parseInt(request.getParameter("seasonWeek3"));
//		int seasonWeek1 = Integer.parseInt(request.getParameter("seasonWeek1"));
//		int seasonWeek0 = Integer.parseInt(request.getParameter("seasonWeek0"));
//		int seasonWeekend10 = Integer.parseInt(request.getParameter("seasonWeekend10"));
//		int seasonWeekend7 = Integer.parseInt(request.getParameter("seasonWeekend7"));
//		int seasonWeekend5 = Integer.parseInt(request.getParameter("seasonWeekend5"));
//		int seasonWeekend3 = Integer.parseInt(request.getParameter("seasonWeekend3"));
//		int seasonWeekend1 = Integer.parseInt(request.getParameter("seasonWeekend1"));
//		int seasonWeekend0 = Integer.parseInt(request.getParameter("seasonWeekend0"));
//		
//		HashMap<String, Object> season = new HashMap<>();
//		season.put("seasonWeek10", seasonWeek10);
//		season.put("seasonWeek7", seasonWeek7);
//		season.put("seasonWeek5", seasonWeek5);
//		season.put("seasonWeek3", seasonWeek3);
//		season.put("seasonWeek1", seasonWeek1);
//		season.put("seasonWeek0", seasonWeek0);
//		season.put("seasonWeekend10", seasonWeekend10);
//		season.put("seasonWeekend7", seasonWeekend7);
//		season.put("seasonWeekend5", seasonWeekend5);
//		season.put("seasonWeekend3", seasonWeekend3);
//		season.put("seasonWeekend1", seasonWeekend1);
//		season.put("seasonWeekend0", seasonWeekend0);
//		offSeason.put("hname", info.getHname());
		
		model.addAttribute("offSeason", offSeason);
		model.addAttribute("season", season);
		
		System.out.println("season : " + season );
		System.out.println("offSeason : " + offSeason );
		
		int result = cs.insertHotelInfomation(info,rule,law,basic,noShow,cal,rfd,offSeason,season);
		

		if(result > 0) { 
			return "redirect:/goHotelRoomTypePage.set"; 
		}else {
			model.addAttribute("msg", "호텔정보 설정 실패");
			return "commom/errorPage"; 
		}


		//return "";
	}
	
	@PostMapping("goRoomDetailPage.set")
	public String goRoomDetailPage(@Param("rtName") String rtName,@Param("minPer") String minPer,@Param("maxPer") String maxPer,@Param("limitprc") String limitprc, Model model) {

		String[] rtNames = rtName.split(",");
		String[] minPers = minPer.split(",");
		String[] maxPers = maxPer.split(",");
		String[] limitprcs = limitprc.split(",");
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
		

		RoomType roomType = null;
		
		ArrayList<RoomType> roomTypeList = new ArrayList<>();
		
		for(int i = 0; i < rtNames.length; i++) {
			roomType = new RoomType();
			roomType.setRtName(rtNames[i]);
			roomType.setMinPer(Integer.parseInt(minPers[i]));
			roomType.setMaxPer(Integer.parseInt(maxPers[i]));
			roomType.setLimitprc(Integer.parseInt(limitprcs[i]));
			roomType.setRegDate(to);
			roomTypeList.add(roomType);
		}

		model.addAttribute("roomTypeList", roomTypeList);

		int result = cs.insertHotelRoomType(roomTypeList);
		
		
		
		if(result > 0) {
			return "redirect:/goHotelRoomDetailPage.set";
		}else {
			model.addAttribute("msg", "객실타입설정실패");
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("goRoomFarePage.set")
	public String goRoomFarePage(String rtName, String rmNum, String stdPer, String rmOption, String floor, Model model, HttpServletRequest request) {
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
		
		String[] rtNames = rtName.split(",");
		
		int[] rtNos = new int[rtNames.length];
		
		for(int i = 0; i < rtNames.length; i++) {
			rtNos[i] = cs.selectRtNo(rtNames[i]);
		}
		
		String[] rmNums = rmNum.split(",");
		
		String[] stdPers = stdPer.split(",");
		int[] stdPersInt = new int[stdPers.length];
		for(int i = 0; i < stdPers.length; i++) {
			stdPersInt[i] = Integer.parseInt(stdPers[i]);
		}
		String[] rmOptions = rmOption.split(",");
		
		String[] floors = floor.split(",");
		int[] floorsInt = new int[floors.length];
		for(int i = 0; i < floors.length; i++) {
			floorsInt[i] = Integer.parseInt(floors[i]);
		}
		
		Room room;
		
		ArrayList<Room> roomList = new ArrayList<>();
		
		for(int i = 0; i < rtNos.length; i++) {
			room = new Room();
			room.setRmNum(rmNums[i]);
			room.setStdPer(stdPersInt[i]);
			room.setRtNo(rtNos[i]);
			room.setRmOption(rmOptions[i]);
			room.setFloor(floorsInt[i]);
			room.setRegDate(to);
			roomList.add(room);
		}
		
		int result = cs.insertHotelRoom(roomList);
		
		
		if(result > 0) {
			System.out.println("roomTypeList : " + request.getSession().getAttribute("roomTypeList") );
			model.addAttribute("roomList", roomList);
			return "redirect:/goHotelRoomFarePage.set";
		}else {
			model.addAttribute("msg", "룸 설정 실패");
			return "common/errorPage";
		}
		
	}
	@PostMapping("goAddServicePage.set")
	public String goAddServicePage(String rtName, String offRentMon, String offRentTue, String offRentWed, String offRentThu
			, String offRentFri, String offRentSat, String offRentSun, String offStayMon, String offStayTue, String offStayWed,
			String offStayThu, String offStayFri, String offStaySat, String offStaySun, String rentMon, 
			String rentTue, String rentWed, String rentThu
			, String rentFri, String rentSat, String rentSun, String stayMon, String stayTue, String stayWed,
			String stayThu, String stayFri, String staySat, String staySun, Model model) {
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
		
		String[] rtNames = rtName.split(",");
		
		int[] rtNos = new int[rtNames.length];
		
		for(int i = 0; i < rtNames.length; i++) {
			rtNos[i] = cs.selectRtNoFare(rtNames[i]);
		}
		
		RoomPrc roomPrc;
		
		ArrayList<RoomPrc> roomPrcList = new ArrayList<>();
		
		String[] offRentMons = offRentMon.split(",");
		String[] offRentTues = offRentTue.split(",");
		String[] offRentWeds = offRentWed.split(",");
		String[] offRentThus = offRentThu.split(",");
		String[] offRentFris = offRentFri.split(",");
		String[] offRentSats = offRentSat.split(",");
		String[] offRentSuns = offRentSun.split(",");
		
		String[] offStayMons = offStayMon.split(",");
		String[] offStayTues = offStayTue.split(",");
		String[] offStayWeds = offStayWed.split(",");
		String[] offStayThus = offStayThu.split(",");
		String[] offStayFris = offStayFri.split(",");
		String[] offStaySats = offStaySat.split(",");
		String[] offStaySuns = offStaySun.split(",");
		
		////////////////////////////////////////
		
		String[] rentMons = rentMon.split(",");
		String[] rentTues = rentTue.split(",");
		String[] rentWeds = rentWed.split(",");
		String[] rentThus = rentThu.split(",");
		String[] rentFris = rentFri.split(",");
		String[] rentSats = rentSat.split(",");
		String[] rentSuns = rentSun.split(",");
		
		String[] stayMons = stayMon.split(",");
		String[] stayTues = stayTue.split(",");
		String[] stayWeds = stayWed.split(",");
		String[] stayThus = stayThu.split(",");
		String[] stayFris = stayFri.split(",");
		String[] staySats = staySat.split(",");
		String[] staySuns = staySun.split(",");
		
		for(int i = 0; i < rtNos.length; i++) {
			
			roomPrc = new RoomPrc();
			roomPrc.setRtNo(rtNos[i]);
			
			roomPrc.setOffRentMon(Integer.parseInt(offRentMons[i]));
			roomPrc.setOffRentTue(Integer.parseInt(offRentTues[i]));
			roomPrc.setOffRentWed(Integer.parseInt(offRentWeds[i]));
			roomPrc.setOffRentThu(Integer.parseInt(offRentThus[i]));
			roomPrc.setOffRentFri(Integer.parseInt(offRentFris[i]));
			roomPrc.setOffRentSat(Integer.parseInt(offRentSats[i]));
			roomPrc.setOffRentSun(Integer.parseInt(offRentSuns[i]));
			
			roomPrc.setOffStayMon(Integer.parseInt(offStayMons[i]));
			roomPrc.setOffStayTue(Integer.parseInt(offStayTues[i]));
			roomPrc.setOffStayWed(Integer.parseInt(offStayWeds[i]));
			roomPrc.setOffStayThu(Integer.parseInt(offStayThus[i]));
			roomPrc.setOffStayFri(Integer.parseInt(offStayFris[i]));
			roomPrc.setOffStaySat(Integer.parseInt(offStaySats[i]));
			roomPrc.setOffStaySun(Integer.parseInt(offStaySuns[i]));
			
			roomPrc.setRentMon(Integer.parseInt(rentMons[i]));
			roomPrc.setRentTue(Integer.parseInt(rentTues[i]));
			roomPrc.setRentWed(Integer.parseInt(rentWeds[i]));
			roomPrc.setRentThu(Integer.parseInt(rentThus[i]));
			roomPrc.setRentFri(Integer.parseInt(rentFris[i]));
			roomPrc.setRentSat(Integer.parseInt(rentSats[i]));
			roomPrc.setRentSun(Integer.parseInt(rentSuns[i]));
			
			roomPrc.setStayMon(Integer.parseInt(stayMons[i]));
			roomPrc.setStayTue(Integer.parseInt(stayTues[i]));
			roomPrc.setStayWed(Integer.parseInt(stayWeds[i]));
			roomPrc.setStayThu(Integer.parseInt(stayThus[i]));
			roomPrc.setStayFri(Integer.parseInt(stayFris[i]));
			roomPrc.setStaySat(Integer.parseInt(staySats[i]));
			roomPrc.setStaySun(Integer.parseInt(staySuns[i]));
			
			roomPrc.setRegDate(to);
			
			roomPrcList.add(roomPrc);
			
		}

		int result = cs.insertHotelRoomFare(roomPrcList);
		
		
		if( result > 0 ) {
			model.addAttribute("roomPrcList", roomPrcList);
			return "redirect:/goHotelAddServicePage.set";
		}else {
			model.addAttribute("msg", "객실요금 설정 실패");
			return "common/errorPage";
		}
	}
	
	@PostMapping("goFormSettingPage.set")
	public String goFormSettingPage(String svcCode, String svcName, String salesType, String svcPrice, Model model) {
		
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
		
		String[] svcCodes = svcCode.split(",");
		String[] svcNames = svcName.split(",");
		String[] salesTypes = salesType.split(",");
		String[] svcPrices = svcPrice.split(",");
		
		Svc svc;
		ArrayList<Svc> svcList = new ArrayList<>();
		
		for(int i = 0; i < svcCodes.length; i++) {
			
			svc = new Svc();
			svc.setSvcCode(svcCodes[i]);
			svc.setSvcName(svcNames[i]);
			svc.setSalesType(salesTypes[i]);
			svc.setSvcPrice(Integer.parseInt(svcPrices[i]));
			svc.setRegDate(to);
			svcList.add(svc);
			
		}
		
		int result = cs.insertHotelService(svcList);
		
		if(result > 0) {
			model.addAttribute("svcList", svcList);
			return "redirect:/goHotelFormSettingPage.set";
		}else {
			model.addAttribute("msg", "서비스 설정 실패");
			return "common/errorPage";
		}
		
	}
	@PostMapping("endHotelSetting.set")
	public String endHotelSetting(MultipartHttpServletRequest mainPhoto,MultipartHttpServletRequest subPhoto, Model model, HttpServletRequest request,
			String subPhotoRoomTypeName, String mainPhotoRoomTypeName) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";
		
		
		String[] mainPhotoRoomTypeNames = mainPhotoRoomTypeName.split(",");
		String[] subPhotoRoomTypeNames = subPhotoRoomTypeName.split(",");
		
		int[] mainPhotoRtNo = new int[mainPhotoRoomTypeNames.length];
		int[] subPhotoRtNo = new int[subPhotoRoomTypeNames.length];
		
		for(int i = 0; i < mainPhotoRoomTypeNames.length; i++) {
			mainPhotoRtNo[i] = cs.selectPhotoRtNo(mainPhotoRoomTypeNames[i]);
		}
		
		for(int i = 0; i < subPhotoRoomTypeNames.length; i++) {
			subPhotoRtNo[i] = cs.selectPhotoRtNo(subPhotoRoomTypeNames[i]);
		}
				
		List<MultipartFile> mfListMain = mainPhoto.getFiles("mainPhoto");
		
		String[] mainPhotoOriginFileNames = new String[mfListMain.size()];
		
		
		for(int i = 0; i < mfListMain.size(); i++) {
			mainPhotoOriginFileNames[i] = mfListMain.get(i).getOriginalFilename();
		}
		
		
		List<MultipartFile> mfListSub = subPhoto.getFiles("subPhoto");
		
		String[] subPhotoOriginFileNames = new String[mfListSub.size()];;
		
		for(int i = 0; i < mfListSub.size(); i++) {
			subPhotoOriginFileNames[i] = mfListSub.get(i).getOriginalFilename();
		}
		
		String[] extMain = new String[mainPhotoOriginFileNames.length];
		for(int i = 0; i < mainPhotoOriginFileNames.length; i++) {
			extMain[i] = mainPhotoOriginFileNames[i].substring(mainPhotoOriginFileNames[i].lastIndexOf("."));
		}
		
		String[] extSub = new String[subPhotoOriginFileNames.length];
		for(int i = 0; i < subPhotoOriginFileNames.length; i++) {
			extSub[i] = subPhotoOriginFileNames[i].substring(subPhotoOriginFileNames[i].lastIndexOf("."));
		}
		
		
		ArrayList<Attach> attachList = new ArrayList<>();
		Attach attachMain;
		Attach attachSub;
		
		for(int i = 0; i < mfListMain.size(); i++) {
			attachMain = new Attach();
			attachMain.setRtNo(mainPhotoRtNo[i]);
			attachMain.setOriginName(mainPhotoOriginFileNames[i]);
			attachMain.setChangeName(CommonsUtils.getRandomString());
			attachMain.setFilePath(filePath + "\\" + attachMain.getChangeName() + extMain[i]);
			attachMain.setFileLevel(1);
			attachList.add(attachMain);
			try {
				
				mfListMain.get(i).transferTo(new File(filePath + "\\" + attachMain.getChangeName() +  extMain[i]));
				
			} catch (IllegalStateException | IOException e) {
				
				new File(filePath + "\\" + attachMain.getChangeName() +  extMain[i]).delete();
				
			}
		}
		
		for(int i = 0; i < mfListSub.size(); i++) {
			attachSub = new Attach();
			attachSub.setRtNo(subPhotoRtNo[i]);
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
		
		int result = cs.insertHotelPhoto(attachList);
		
		if(result > 0) {
			model.addAttribute("attachList", attachList);
			return "redirect:/view.ro";
		}else {
			model.addAttribute("msg", "사진 등록실패");
			return "common/errorPage";
		}
		
	}
}























