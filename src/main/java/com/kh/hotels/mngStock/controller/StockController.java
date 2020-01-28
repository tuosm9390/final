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

import com.kh.hotels.common.controller.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.Service.StockService;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.stock.Stock;

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
		try {
			int listCount = ss.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<Stock> stockList = ss.selectStockList(pi);
			
			m.addAttribute("stocklist", stockList);
			m.addAttribute("pi", pi);
			
			return "hoteladmin/mngStock/stock/stockNow";
			
		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("insertStock.sto")
	public String insertStock(Model m, Stock st) {
		
		System.out.println(st);
		
		int result = ss.insertStock(m,st);
		
		if(result > 0) {
			return "redirect:select.war";
		}else {
			return "common/errorPage";
		}
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
	
	
}
