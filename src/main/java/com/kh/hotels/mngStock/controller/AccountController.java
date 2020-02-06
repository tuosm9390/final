package com.kh.hotels.mngStock.controller;

import java.util.ArrayList;

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
import com.kh.hotels.mngStock.model.Service.AccountService;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.Stock;

@Controller
public class AccountController {
	@Autowired
	private AccountService as;
	
	@RequestMapping("selectAccount.ac")
	public String selectAccountList(HttpServletRequest request, Model  m) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = as.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		try {
			ArrayList<Conn> accountList = as.selectAccountList(pi);
			System.out.println("accountList : " + accountList);
		
			m.addAttribute("accountList", accountList);
			m.addAttribute("pi", pi);
			
			return "hoteladmin/mngStock/account/account";
			
		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("selectDetail.ac")
	public ModelAndView selectDetail(String cnCode,ModelAndView mv) {
		
		ArrayList<Conn> accDetailList = as.selectDetailList(cnCode);
		
		mv.setViewName("jsonView");
		mv.addObject("accDetailList",accDetailList);
		
		return mv;
		
	}
	
	@PostMapping("insertAcc.ac")
	public String insertAcc(Model m,Conn c) {
		
		System.out.println(c);
		String s = c.getCnAdd();
		String[] ss = s.split(",");
		String cs = ss[1]+" "+ss[2];
		c.setCnAdd(cs);
		
		int result = as.insertAcc(c);
		
		if(result>0) {
			return  "redirect:selectAccount.ac";
		}else {
			return "common/errorPage";
		}
	}
	
	@PostMapping("accDetailEnroll.ac")
	public String insertAccDetail(Model m,Conn c) {
		
		System.out.println("dkdkdkdk");
		int result = as.insertDetailAcc(c);
		
		if(result>0) {
			return  "redirect:selectAccount.ac";
		}else {
			return "common/errorPage";
		}
	}
	
	@PostMapping("updateDetail.ac")
	public ModelAndView updateDetail(ModelAndView mv,String cnCode,String bankName,String account,String accName,String accMemo) {
		Conn c = new Conn();
		c.setCnCode(cnCode);
		c.setBankName(bankName);
		c.setAccount(account);
		c.setAccName(accName);
		c.setAccMemo(accMemo);
		
		int result = as.updateDetail(c);  
		
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		return mv;
	}
}
