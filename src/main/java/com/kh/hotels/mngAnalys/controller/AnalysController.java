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

import com.kh.hotels.mngAnalys.model.service.AnalysService;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;

@Controller
public class AnalysController {
	@Autowired
	private AnalysService as;

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
	public String goTrend() {
		
		return "hoteladmin/mngAnalys/trend";
	}
}
