package com.kh.hotels.mngAnalys.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.hotel.model.service.HotelService;
import com.kh.hotels.mngAnalys.model.service.AnalysService;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;
import com.kh.hotels.mngStay.model.vo.Stay;

@Controller
public class AnalysController {
	@Autowired
	private AnalysService as;
	@Autowired
	private HotelService hs;
	

	// 매출 상세
	@RequestMapping("viewDetailList.an")
	public ModelAndView goAnalys(String Condition, ModelAndView mv) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		ArrayList<SalesDetail> sdList = null;
		if(Condition.equals("sales")) {
			sdList = as.selectSalesDetailList(map);
		} else {
			
		}
		
		mv.addObject("view", "view");
		mv.addObject("sdList", sdList);
		mv.addObject("Condition", Condition);
		mv.setViewName("hoteladmin/mngAnalys/detailList");
		
		return mv;
	}
	
	// 매출 상세 검색
	@RequestMapping("searchDetail.an")
	public ModelAndView searchDetail(ModelAndView mv, String Condition, String searchCondition, String startDate, String endDate) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		
		map.put("searchCondition", searchCondition);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		ArrayList<SalesDetail> sdList = null;
		if(Condition.equals("sales")) {
			sdList = as.selectSalesDetailList(map);
		} else {
			
		}
		
		mv.addObject("view", "search");
		mv.addObject("searchCondition", searchCondition);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.addObject("sdList", sdList);
		mv.addObject("Condition", Condition);
		mv.setViewName("hoteladmin/mngAnalys/detailList");
		
		return mv;
	}
	
	
	
	@RequestMapping("viewTrendList.an")
	public ModelAndView goTrend(ModelAndView mv) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Condition", "view");
		// 예약, 대실 내역 전체 조회
		ArrayList<SalesDetail> dailyRsvList = as.selectRsvList(map);
		ArrayList<Stay> dailyStayList = as.selectStayList(map);
		ArrayList<RoomInfo> roomList = hs.selectRoomList();
		
		ArrayList<String> RoomList = new ArrayList<>();
		for(int i = 0; i < roomList.size(); i++) {
			RoomList.add(i, "'" + roomList.get(i).getRt_Name() + "'");
		}
		
		System.out.println("RoomList : " + RoomList);
		
		mv.addObject("RoomList", RoomList);
		
		// 일별 객실 매출 조회
		int dailyRsvSales = 0;
		for(int i = 0; i < dailyRsvList.size(); i++) {
			dailyRsvSales += dailyRsvList.get(i).getPrice();
		}
		mv.addObject("dailyRsvSales", dailyRsvSales);

		int dailyStaySales = 0;
		for(int i = 0; i < dailyStayList.size(); i++) {
			dailyStaySales += dailyStayList.get(i).getPrice();
		}
		mv.addObject("dailyStaySales", dailyStaySales);
		
		// 일별 객실 현황
		int roomTypecnt = 0;
		for(int i = 0; i < dailyRsvList.size(); i++) {
			if(i > 1) {
				if(dailyRsvList.get(i).getRtNo() == dailyRsvList.get(i - 1).getRtNo()) {
					roomTypecnt++;
				};
			}
		}
		System.out.println("roomTypeCnt : " + roomTypecnt);
		
		mv.setViewName("hoteladmin/mngAnalys/trend");
		return mv;
	}
	
	@RequestMapping("searchTrend.an")
	public ModelAndView searchTrend(ModelAndView mv, String Condition,
			@RequestParam(value="dailySales", required = false) String dailySales,
			@RequestParam(value="dailyRoomStatus", required = false) String dailyRoomStatus) {
		
		System.out.println("dailySales : " + dailySales);
		System.out.println("dailyRoomStatus : " + dailyRoomStatus);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dailySales", dailySales);
		map.put("Condition", Condition);
		map.put("dailyRoomStatus", dailyRoomStatus);

		ArrayList<SalesDetail> dailyRsvList = as.selectRsvList(map);
		ArrayList<Stay> dailyStayList = as.selectStayList(map);
		
		if(Condition.equals("dailySales")) {
			// 일별 객실 매출 조회
			int dailyRsvSales = 0;
			for(int i = 0; i < dailyRsvList.size(); i++) {
				dailyRsvSales += dailyRsvList.get(i).getPrice();
			}
			System.out.println("dailyRsvSales : " + dailyRsvSales);
			mv.addObject("dailyRsvSales", dailyRsvSales);
			
			int dailyStaySales = 0;
			for(int i = 0; i < dailyStayList.size(); i++) {
				dailyStaySales += dailyStayList.get(i).getPrice();
			}
			System.out.println("dailyStaySales : " + dailyStaySales);
			mv.addObject("dailyStaySales", dailyStaySales);
			
		} else if(Condition.equals("dailyRoomStatus")){
			
			// 일별 객실 현황
			System.out.println("dailyRsvList : " + dailyRsvList);
			System.out.println("dailyStayList : " + dailyStayList);
			if(dailyRsvList.size() > dailyStayList.size()) {
				for(int i = 0; i < dailyRsvList.size(); i++) {
					for(int j = 0; j < dailyStayList.size(); j++) {
						if(dailyRsvList.get(i).getRtNo() == dailyStayList.get(j).getRtNo()) {
							dailyRsvList.get(i).setPrice(dailyRsvList.get(i).getPrice() + dailyStayList.get(j).getPrice());
						}
					}
				}
				mv.addObject("list", dailyRsvList);
			} else {
				for(int i = 0; i < dailyStayList.size(); i++) {
					for(int j = 0; j < dailyRsvList.size(); j++) {
						if(dailyRsvList.get(i).getRtNo() == dailyStayList.get(j).getRtNo()) {
							dailyStayList.get(i).setPrice(dailyStayList.get(i).getPrice() + dailyRsvList.get(j).getPrice());
						}
					}
				}
				mv.addObject("list", dailyStayList);
			}
			
			
		} else {
			
		}
		
		
		
		
		mv.setViewName("jsonView");
		
		return mv;
	}
}
