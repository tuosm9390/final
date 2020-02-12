package com.kh.hotels.mngStock.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.mngStock.model.Service.StockService;
import com.kh.hotels.mngStock.model.Service.warehouseService;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.His;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.RepHistory;
import com.kh.hotels.mngStock.model.vo.SearchItem;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.Strg;

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
	public String selectRepairList(HttpServletRequest request,Model m, String currentPage){
		
		System.out.println("들어오니??");
		int scurrentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			scurrentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = ss.getRepairListCount();
		PageInfo pi = Pagination.getPageInfo(scurrentPage, listCount);
		try {
			ArrayList<RepHistory> repairList = ss.repairList(pi);
			
			System.out.println("어디까지 들어오니?");
			for(int i=0;i<repairList.size();i++) {
				if(repairList.get(i).getRepStatus().equals("Y")) {
					repairList.get(i).setRepStatus("수리완료");
				}else {
					repairList.get(i).setRepStatus("수리중");
				}
				
				System.out.println("여기들어가라진짜 : " + repairList);
			}
			
			
			m.addAttribute("repairList", repairList);
			m.addAttribute("pi", pi);
			System.out.println("마지막 repairList : " + repairList);
			
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
		
	}else {
		st.setRmNo(rmNo);
	}
	st.setAreaNo(areaNo);
	int result = ss.updateStockOk(st);
	
	His h = new His();
	
	if(result>0) {
		if(st.getStrgName().equals(zstrgName)) {
		}else {
			h.setIno(zino);
			h.setModCol("STRG_NO");
			h.setBefData(strgName);
			h.setAftData(zstrgName);
			int result1 = ss.updateStockHis(h);
		}
		if(st.getAmount()!=zamount) {
			h.setIno(zino);
			h.setModCol("AMOUNT");
			h.setBefData(amount+"");
			h.setAftData(zamount+"");
			int result2 = ss.updateStockHis(h);
		}
		if(st.getAreaNo()!=zareaNo) {
			h.setIno(zino);
			h.setModCol("AREA_NO");
			h.setBefData(areaNo+"");
			h.setAftData(zareaNo+"");
			int result3 = ss.updateStockHis(h);
		}
		if(st.getRmNo()!=zrmNo) {
			h.setIno(zino);
			h.setModCol("RM_NO");
			h.setBefData(rmNo+"");
			h.setAftData(zrmNo+"");
			int result4 = ss.updateStockHis(h);
		}
		
	}else {
		System.out.println("xx");
	}
		
	mv.setViewName("jsonView");
		
	return mv;
	}


	@PostMapping("searchItem.sto")
	public String searchItem(Model m ,SearchItem s) {
		
		ArrayList<Stock> searchList = ss.serachList(s);
		
		return "redirect:selectStock.sto";
		
	}
	@GetMapping("repairFilter.sto")
	public ModelAndView repairFilterDetail(HttpServletRequest request, ModelAndView mv, String rptNo, String repNo) {
		
		System.out.println("rptNo : " + rptNo);
		System.out.println("repNo : " + repNo);
		
		int rptno = Integer.parseInt(rptNo);
		System.out.println("여기들어오니?");
		System.out.println("rptno : " + rptno);
		RepHistory rHistory = new RepHistory();
		rHistory.setRptNo(rptno);
		System.out.println("여기?2");
		
		ArrayList<HashMap<String, Object>> list = ss.selectRepairDetail(rHistory);
		
		String str = (String)list.get(0).get("REP_BEGIN");
		String str2 = str.substring(0,11);
		System.out.println("str2 : " + str2);
		
		list.get(0).put("REP_BEGIN", str2);
		
		int receiver = (int)list.get(0).get("RECEIVER");
		
		String name = ss.selectReceiver(receiver);
		
		list.get(0).put("RECEIVER", name);
		
		System.out.println("마지막리스트 : " + list);
		
		mv.addObject("list", list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	


}