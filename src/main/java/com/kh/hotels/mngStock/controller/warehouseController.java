package com.kh.hotels.mngStock.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.mngStock.model.Service.warehouseService;
import com.kh.hotels.mngStock.model.vo.SearchCondition;
import com.kh.hotels.mngStock.model.vo.Strg;

@Controller
public class warehouseController {
	@Autowired
	private warehouseService ws;
	
	@PostMapping("insert.war")
	public String insertWarehouse(Model m, Strg st) {
		
		System.out.println(st);
		
		if(st.getStrgStatus().equals("strg")) {
			st.setStrgStatus("Y");
		}else {
			st.setStrgStatus("N");
		}
		
		int result = ws.insertWarehouse(m,st);
		
		if(result > 0) {
			return "redirect:select.war";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("select.war")
	public String selectList(Model m){
		
		ArrayList<Strg> strgList = ws.selectList();
		
		System.out.println(strgList);
		
		m.addAttribute("strgList",strgList);
		
		return "hoteladmin/mngStock/warehouse/warehouse";
		
	}
	
	@GetMapping("search.war")
	public ModelAndView searchResult(String searchCondition,String searchValue,ModelAndView mv) {
		
		SearchCondition sc = new SearchCondition();
		
		if(searchCondition.equals("code")) {
			sc.setCode(searchValue);
		}else if(searchCondition.equals("name")) {
			sc.setName(searchValue);
		}else {
			sc.setStatus(searchValue);
		}
		
		ArrayList<Strg> searchList = ws.searchList(sc); 
		mv.setViewName("jsonView");
		mv.addObject("searchList", searchList);
		
		System.out.println("검색결과 : " + searchList);
		
	
		
		return mv;
	}
	
}