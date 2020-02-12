package com.kh.hotels.mngStock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngStock.model.Service.StockService;
import com.kh.hotels.mngStock.model.Service.warehouseService;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.His;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemHistory;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.SearchItem;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.StrgArea;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class StockController {
	@Autowired
	private StockService ss;
	@Autowired
	private warehouseService ws;
	
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
	
	@RequestMapping("selectRepair.sto")
	public String selectRepairList(HttpServletRequest request,Model m){
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = ss.getRepairListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		try {
			ArrayList<Repair> repairList = ss.repairList(pi);
			
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
			
			m.addAttribute("repairList", repairList);
			m.addAttribute("pi", pi);
			
			return "hoteladmin/mngStock/stock/repairRequest";
			
		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("insertStock.sto")
	public String insertStock(Model m, Stock st) {
		
		System.out.println("con st : "+ st);
		System.out.println("con m : "+ m);
		int result = 0;
		for(int i=0;i<st.getUnit();i++) {
			 result = ss.insertStock(m, st);			
		}
		
		if(result>0) {
			return "redirect:selectStock.sto";
		}else {
			return "common/errorPage";
		}
	}
	//////
	
	@PostMapping("selectStockDetail.sto")
	public ModelAndView selectStockDetail(String iName,ModelAndView mv) {
		
		System.out.println("con : " + iName);
		
		
		ArrayList<Stock> stockDetailList = ss.stockDetailList(iName);
		
		System.out.println("stockDetailList : " + stockDetailList);
		
		mv.setViewName("jsonView");
		mv.addObject("stockDetailList",stockDetailList);
		
		return mv;
		
	}
	
	@RequestMapping("selectCategory.sto")
	public ModelAndView selectCategory(String mcategory,String lcategory,ModelAndView mv) {
		ItemType it = new ItemType();
		it.setlCategory(lcategory);
		it.setmCategory(mcategory);
		
		ArrayList<ItemType> categoryList = ss.categoryList(it);
		
		mv.setViewName("jsonView");
		mv.addObject("categoryList",categoryList);
		
		return mv;
	}
	
	@PostMapping("insertCategory.sto")
	public String insertCategory(String lcategory,String mcategory,String scategory,String type) {
		ItemType it = new ItemType();
		
		it.setlCategory(lcategory);	
		it.setmCategory(mcategory);
		it.setsCategory(scategory);
		it.setType(type);
		
		int result = ss.insertCategory(it);
		
		if(result>0) {
			return "redirect:selectStock.sto";
		}else {
			return "common/errorPage";
		}
		
	}
	//품목그룹조호ㅣ
	@PostMapping("selectScategory.sto")
	public ModelAndView selectScategory(ModelAndView mv) {
		
		ArrayList<ItemType> sCategoryList = ss.selectScategory();
		
		mv.setViewName("jsonView");
		mv.addObject("sCategoryList",sCategoryList);
		
		return mv;
		
	}
	
	//매입처조회
	@PostMapping("selectCnName.sto")
	public ModelAndView selectCnName(ModelAndView mv,int typeNo) {
		
		ArrayList<Conn> Conn = ss.selectCnName(typeNo);
		
		mv.setViewName("jsonView");
		mv.addObject("Conn",Conn);
		
		return mv;
		
	}
	
	//물품삭제
	@PostMapping("deleteStock.sto")
	public String deleteStock(String checkRow) {
		
		int result = 0 ;
		
		  String checkRowSplit[] = checkRow.split(",");
		  
		  His h = new His();
		  for(int i = 0; i < checkRowSplit.length; i++) {
			  int check = Integer.parseInt(checkRowSplit[i]);
			  result =ss.deleteStock(check);
			  h.setIno(check);
			  
			  System.out.println(check+" + check ------------------");
			  int result1 = ss.deleteStockHis(h);
			  }
		  	  
		if(result>0) {
			return "redirect:selectStock.sto";
		}else {
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("updateStock.sto")
	public ModelAndView updateStock(ModelAndView mv) {
		
		ArrayList<Strg> strgList = ws.selectList();
		ArrayList<Item> rmNoList = ss.selectRmNoList(); 
		
	//	ArrayList<StrgArea> AreaList = ws.selectAreaList();
		
		mv.setViewName("jsonView");
		mv.addObject("strgList",strgList);
		mv.addObject("rmNoList",rmNoList);
		System.out.println("rmNoList : "+ rmNoList);
		System.out.println("strgList : "+ strgList);
		//mv.addObject("AreaList",AreaList);
		
		return mv;
	}
	
@RequestMapping("updateStockOk.sto")
public ModelAndView updateStockOk(ModelAndView mv,int ino,int amount,String strgName,int areaNo,int rmNo
		,int zino,int zamount,String zstrgName,int zareaNo,int zrmNo) {
	
	System.out.println("//////바꾼값////");
	System.out.println(ino);
	System.out.println(amount);
	System.out.println(strgName);
	System.out.println(areaNo);
	System.out.println(rmNo);
	System.out.println("///////전값///////");
	System.out.println(zino);
	System.out.println(zamount);
	System.out.println(zstrgName);
	System.out.println(zareaNo);
	System.out.println(zrmNo);
	Stock st = new Stock();
	st.setIno(ino);
	st.setAmount(amount);
	st.setStrgName(strgName);
	if(rmNo==0) {
		st.setRmNo(0);
	}else {
		st.setRmNo(rmNo);
	}
	st.setAreaNo(areaNo);
	int result = ss.updateStockOk(st);
	
	His h = new His();
	
	if(result>0) {
		if(st.getStrgName().equals(zstrgName)) {
			h.setIno(zino);
			h.setModCol("STRG_NO");
			h.setBefData(zstrgName);
			h.setAftData(strgName);
			int result1 = ss.updateStockHis(h);
		}else {
			h.setIno(zino);
			h.setModCol("STRG_NO");
			h.setBefData(zstrgName);
			h.setAftData(strgName);
			int result1 = ss.updateStockHis(h);
		}
		
		if(st.getAmount()!=zamount) {
			h.setIno(zino);
			h.setModCol("AMOUNT");
			h.setBefData(zamount+"");
			h.setAftData(amount+"");
			int result2 = ss.updateStockHis(h);
		}else {
			h.setIno(zino);
			h.setModCol("AMOUNT");
			h.setBefData(zamount+"");
			h.setAftData(amount+"");
			int result2 = ss.updateStockHis(h);
		}
		
		if(st.getAreaNo()!=zareaNo) {
			h.setIno(zino);
			h.setModCol("AREA_NO");
			h.setBefData(zareaNo+"");
			h.setAftData(areaNo+"");
			int result3 = ss.updateStockHis(h);
			h.setAftData(null);
		}else {
			h.setIno(zino);
			h.setModCol("AREA_NO");
			h.setBefData(zareaNo+"");
			h.setAftData(areaNo+"");
			int result3 = ss.updateStockHis(h);
			h.setAftData(null);
		}
		if(st.getRmNo()!=zrmNo) {
			h.setIno(zino);
			h.setModCol("RM_NO");
			h.setBefData(zrmNo+"");
			h.setAftData(rmNo+"");
			int result4 = ss.updateStockHis(h);
		}else {
			h.setIno(zino);
			h.setModCol("RM_NO");
			h.setBefData(zrmNo+"");
			h.setAftData(rmNo+"");
			int result4 = ss.updateStockHis(h);
		}
		
	}else {
		System.out.println("xx");
	}
		
	mv.setViewName("jsonView");
		
	return mv;
	}


	@PostMapping("searchItem.sto")
	public String searchItem(HttpServletRequest request,Model model ,SearchItem s) {
		
		ArrayList<Stock> searchList = ss.serachList(s);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int searchStockList = ss.getSearchStockListCount(s);

		PageInfo pi = Pagination.getPageInfo(currentPage, searchStockList);
		
		ArrayList<Stock> searchClientList = ss.selectSearchStockList(s, pi);
		
		model.addAttribute("check", "ok");
		/*
		 * model.addAttribute("searchOption", searchOption);
		 * model.addAttribute("searchContent", searchContent);
		 * model.addAttribute("clientCount", clientCount);
		 */
		model.addAttribute("clientList", searchClientList);
		model.addAttribute("pi", pi);
		
		return "redirect:selectStock.sto";
		
	}
	
	/////////////////////////////////////////////////////
	@RequestMapping("selectStockHis.sto")
	public String selectStockHis(HttpServletRequest request,Model m){
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = ss.getStockHisList();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		try {
			ArrayList<ItemHistory> stockHisList = ss.stockHisList(pi);
			System.out.println("????????????????////");
			System.out.println(stockHisList);
			ArrayList<ItemHistory> stockHis = new ArrayList<ItemHistory>(); 
			for(int i=0;i<stockHisList.size();i++) {
				if(stockHisList.get(i).getType().equals("EQUIP")) {
					stockHisList.get(i).setType("비품");
				}else {
					stockHisList.get(i).setType("소모품");
				}
				
				if(stockHisList.get(i).getAftName()!=null&&stockHisList.get(i).getAmount()!=null) {
					stockHisList.get(i).setAmount(null);
				}
				
				/*
				 * if(stockHis.get(i).getModCol().equals("AMOUNT")) {
				 * 
				 * }
				 */
				//////////
				
				
				
			}
			
			m.addAttribute("stockHisList", stockHisList);
			m.addAttribute("pi", pi);
			
			return "hoteladmin/mngStock/stock/stockHis";
			
		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	

}