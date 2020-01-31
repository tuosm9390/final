package com.kh.hotels.mngStock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngStock.model.Service.StockService;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.Strg;

@Controller
public class StockController {
	@Autowired
	private StockService ss;
	
	@RequestMapping("selectStock.sto")
	public String selectStockList(HttpServletRequest request, Model  m) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = ss.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		try {
			ArrayList<Stock> stockList = ss.selectStockList(pi);
			System.out.println("stockList : " + stockList);
			for(int i=0;i<stockList.size();i++) {
				if(stockList.get(i).getType().equals("EQUIP")) {
					stockList.get(i).setType("비품");
				}else if(stockList.get(i).getType().equals("CONS")) {
					stockList.get(i).setType("소모품");
				}
			}
			m.addAttribute("stockList", stockList);
			m.addAttribute("pi", pi);
			
			return "hoteladmin/mngStock/stock/stockNow";
			
		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("insertStock.sto")
	public String insertStock(Model m, Stock st) {
		
		System.out.println("con st : "+ st);
		System.out.println("con m : "+ m);
		
		/* int result = ss.insertStock(m,st); */
		return null;
		
		/*
		 * if(result > 0) { return "redirect:select.war"; }else { return
		 * "common/errorPage"; }
		 */
	}
	//////
	@RequestMapping("selectRepair.sto")
	public String selectRepairList(Model m){
		
		ArrayList<Repair> repairList = ss.selectRepairList();
		
		System.out.println(repairList);
		
		for(int i=0;i<repairList.size();i++) {
			if(repairList.get(i).getRptStatus().equals("WAIT")) {
				repairList.get(i).setRptStatus("대기");
			}else if(repairList.get(i).getRptStatus().equals("APPR")){
				repairList.get(i).setRptStatus("승인");
			}else if(repairList.get(i).getRptStatus().equals("REJECT")) {
				repairList.get(i).setRptStatus("반려");
			}else {
				repairList.get(i).setRptStatus("오류");
			}
		}
		
		m.addAttribute("repairList",repairList);
		System.out.println(repairList);
		return "hoteladmin/mngStock/stock/repairRequest";
		
	}
	
	@PostMapping("selectStockDetail.sto")
	public ModelAndView selectStockDetail(String iName,ModelAndView mv) {
		
		System.out.println("con : " + iName);
		
		
		ArrayList<Stock> stockDetailList = ss.stockDetailList(iName);
		
		System.out.println("stockDetailList : " + stockDetailList);
		
		mv.setViewName("jsonView");
		mv.addObject("stockDetailList",stockDetailList);
		
		return mv;
		
	}
	
	@RequestMapping("insertCategory.sto")
	public ModelAndView insertCategory(ItemType it,ModelAndView mv) {
		
		System.out.println(it.getLcategory());
		System.out.println(it.getMcategory());
		System.out.println(it.getScategory());
		
		ArrayList<ItemType> categoryList = ss.categoryList(it);
		
		mv.setViewName("jsonView");
		mv.addObject("categoryList",categoryList);
		
		return mv;
	
	}
	
	
}
