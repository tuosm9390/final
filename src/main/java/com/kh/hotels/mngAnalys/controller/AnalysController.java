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

import com.kh.hotels.common.model.vo.Payment;
import com.kh.hotels.hotel.model.service.HotelService;
import com.kh.hotels.mngAnalys.model.service.AnalysService;
import com.kh.hotels.mngAnalys.model.vo.DailySpendStock;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngAnalys.model.vo.SpendDetail;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;
import com.kh.hotels.mngStay.model.vo.Stay;

import net.sf.json.JSONArray;

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
		
		if(Condition.equals("sales")) {
			ArrayList<SalesDetail> sdList = as.selectSalesDetailList(map);
			mv.addObject("sdList", sdList);
		} else {
			ArrayList<SpendDetail> sdList = as.selectSpendDetailList(map);
			for(int i = 0; i < sdList.size(); i++) {
				if(sdList.get(i).getRptType().equals("PURCHASE")) {
					sdList.get(i).setRptType("제품 구매");
					sdList.get(i).setResponse("구매팀장");
					sdList.get(i).setPway("계좌이체");
				} else if(sdList.get(i).getRptType().equals("REFUND")) {
					sdList.get(i).setRptType("환불");
					sdList.get(i).setResponse("프론트");
					
					if(sdList.get(i).getPway().equals("ACCOUNT")) {
						sdList.get(i).setPway("계좌이체");
					} else if(sdList.get(i).getPway().equals("CASH")) {
						sdList.get(i).setPway("현금");
					} else if(sdList.get(i).getPway().equals("CARD")) {
						sdList.get(i).setPway("카드");
					}
				} else {
					sdList.get(i).setRptType("제품 수리");
					sdList.get(i).setPway("계좌이체");
				}
			}
			mv.addObject("sdList", sdList);
		}
		
		mv.addObject("view", "view");
		mv.addObject("Condition", Condition);
		mv.setViewName("hoteladmin/mngAnalys/detailList");
		
		return mv;
	}
	
	// 매출 상세 검색
	@RequestMapping("searchDetail.an")
	public ModelAndView searchDetail(ModelAndView mv, String Condition, String searchCondition, String startDate, String endDate) {
		
		Map<String, String> map = new HashMap<String, String>();
		
//		System.out.println("searchCondition : " + searchCondition);
//		System.out.println("startDate : " + startDate);
//		System.out.println("endDate : " + endDate);
		
		map.put("searchCondition", searchCondition);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		if(Condition.equals("sales")) {
			ArrayList<SalesDetail> sdList = as.selectSalesDetailList(map);
			mv.addObject("sdList", sdList);
		} else {
			ArrayList<SpendDetail> sdList = as.selectSpendDetailList(map);
			for(int i = 0; i < sdList.size(); i++) {
				if(sdList.get(i).getRptType().equals("PURCHASE")) {
					sdList.get(i).setRptType("제품 구매");
					sdList.get(i).setResponse("구매팀장");
					sdList.get(i).setPway("계좌이체");
				} else if(sdList.get(i).getRptType().equals("REFUND")) {
					sdList.get(i).setRptType("환불");
					sdList.get(i).setResponse("프론트");
					
					if(sdList.get(i).getPway().equals("ACCOUNT")) {
						sdList.get(i).setPway("계좌이체");
					} else if(sdList.get(i).getPway().equals("CASH")) {
						sdList.get(i).setPway("현금");
					} else if(sdList.get(i).getPway().equals("CARD")) {
						sdList.get(i).setPway("카드");
					}
				} else {
					sdList.get(i).setRptType("제품 수리");
					sdList.get(i).setPway("계좌이체");
				}
			}
			mv.addObject("sdList", sdList);
		}
		
		mv.addObject("view", "search");
		mv.addObject("searchCondition", searchCondition);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.addObject("Condition", Condition);
		mv.setViewName("hoteladmin/mngAnalys/detailList");
		
		return mv;
	}
	
	
	// 트렌드 메소드
	@RequestMapping("viewTrendList.an")
	public ModelAndView goTrend(ModelAndView mv) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Condition", "view");
		// 예약, 대실 내역 전체 조회
		ArrayList<SalesDetail> dailyRsvList = as.selectRsvList(map);
		ArrayList<Stay> dailyStayList = as.selectStayList(map);
		ArrayList<RoomInfo> roomList = hs.selectRoomList();
		
		// 월별 매출 조회
		ArrayList<SalesDetail> monthlyRsvList = as.selectMonthlyRsvList(map);
		JSONArray json = JSONArray.fromObject(monthlyRsvList);
		ArrayList<Stay> monthlyStayList = as.selectMonthlyStayList(map);
		JSONArray json1 = JSONArray.fromObject(monthlyStayList);
		mv.addObject("monthlyRsvList", json);
		mv.addObject("monthlyStayList", json1);
		
		System.out.println("roomList : " + roomList);
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
		
		// 일별 객실 현황 가격 조회
		JSONArray json3 = null;
		if(dailyRsvList.size() > dailyStayList.size()) {
			for(int i = 0; i < dailyRsvList.size(); i++) {
				for(int j = 0; j < dailyStayList.size(); j++) {
					if(dailyRsvList.get(i).getRtNo() == dailyStayList.get(j).getRtNo()) {
						dailyRsvList.get(i).setPrice(dailyRsvList.get(i).getPrice() + dailyStayList.get(j).getPrice());
					}
				}
			}
			json3 = JSONArray.fromObject(dailyRsvList);
		} else {
			for(int i = 0; i < dailyStayList.size(); i++) {
				for(int j = 0; j < dailyRsvList.size(); j++) {
					if(dailyRsvList.get(i).getRtNo() == dailyStayList.get(j).getRtNo()) {
						dailyStayList.get(i).setPrice(dailyStayList.get(i).getPrice() + dailyRsvList.get(j).getPrice());
					}
				}
			}
			json3 = JSONArray.fromObject(dailyStayList);
		}
		mv.addObject("list", json3);
		
		// 일별 지불 (고객)
		ArrayList<Payment> dailyPaymentList = as.selectDailyPaymentList(map);
		for(int i = 0; i < dailyPaymentList.size(); i++) {
			if(dailyPaymentList.get(i).getPway().equals("ACCOUNT")) {
				dailyPaymentList.get(i).setPway("계좌이체");
			} else if(dailyPaymentList.get(i).getPway().equals("CASH")) {
				dailyPaymentList.get(i).setPway("현금");
			} else if(dailyPaymentList.get(i).getPway().equals("CARD")) {
				dailyPaymentList.get(i).setPway("카드");
			} else if(dailyPaymentList.get(i).getPayStatus().equals("REFUND")){
				dailyPaymentList.get(i).setPway("환불");
			}
		}
//		System.out.println("dailyPaymentList : " + dailyPaymentList);
		JSONArray json2 = JSONArray.fromObject(dailyPaymentList);
		mv.addObject("dailyPaymentList", json2);
		
		// 일별 지불 (재고)
		ArrayList<DailySpendStock> dailySpendStrgList = as.selectDailySpendStrgList(map);
		JSONArray json4 = JSONArray.fromObject(dailySpendStrgList);
		mv.addObject("dailySpendStrgList", json4);
		
		mv.setViewName("hoteladmin/mngAnalys/trend");
		return mv;
	}
	
	//트렌드 검색
	@RequestMapping("searchTrend.an")
	public ModelAndView searchTrend(ModelAndView mv, String Condition,
			@RequestParam(value="dailySales", required = false) String dailySales,
			@RequestParam(value="dailyRoomStatus", required = false) String dailyRoomStatus,
			@RequestParam(value="dailySalesCst", required = false) String dailySalesCst,
			@RequestParam(value="dailySpendStrg", required = false) String dailySpendStrg,
			@RequestParam(value="monthlySalesPerRoomType", required = false) String monthlySalesPerRoomType) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Condition", Condition);
		map.put("dailySales", dailySales);
		map.put("dailyRoomStatus", dailyRoomStatus);
		map.put("dailySalesCst", dailySalesCst);
		map.put("dailySpendStrg", dailySpendStrg);
		
		
		// 일별 매출 조회
		ArrayList<SalesDetail> dailyRsvList = as.selectRsvList(map);
		ArrayList<Stay> dailyStayList = as.selectStayList(map);
		
		// 일별 객실 매출 조회
		if(Condition.equals("dailySales")) {
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
			
		// 일별 객실 현황
		} else if(Condition.equals("dailyRoomStatus")){
			
//			System.out.println("dailyRsvList : " + dailyRsvList);
//			System.out.println("dailyStayList : " + dailyStayList);
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
			
		// 일별 지불 (고객)
		} else if(Condition.equals("dailySalesCst")){
			ArrayList<Payment> dailyPaymentList = as.selectDailyPaymentList(map);
			for(int i = 0; i < dailyPaymentList.size(); i++) {
				if(dailyPaymentList.get(i).getPway().equals("ACCOUNT")) {
					dailyPaymentList.get(i).setPway("계좌이체");
				} else if(dailyPaymentList.get(i).getPway().equals("CASH")) {
					dailyPaymentList.get(i).setPway("현금");
				} else if(dailyPaymentList.get(i).getPway().equals("CARD")) {
					dailyPaymentList.get(i).setPway("카드");
				} else if(dailyPaymentList.get(i).getPayStatus().equals("REFUND")){
					dailyPaymentList.get(i).setPway("환불");
				}
			}
			mv.addObject("dailyPaymentList", dailyPaymentList);
			
		// 일별 지불 (재고)
		} else if(Condition.equals("dailySpendStrg")) {
			ArrayList<DailySpendStock> dailySpendStrgList = as.selectDailySpendStrgList(map);
			mv.addObject("dailySpendStrgList", dailySpendStrgList);
			
		// 월별 객실 타입별 매출
		} else {
			map.put("monthlySalesPerRoomType", monthlySalesPerRoomType.substring(0, 7));
			// 월별 매출 조회
			ArrayList<SalesDetail> monthlyRsvList = as.selectMonthlyRsvList(map);
			ArrayList<Stay> monthlyStayList = as.selectMonthlyStayList(map);
			mv.addObject("monthlyRsvList", monthlyRsvList);
			mv.addObject("monthlyStayList", monthlyStayList);
		}
		
		
		
		
		mv.setViewName("jsonView");
		
		return mv;
	}
}
