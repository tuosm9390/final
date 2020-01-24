package com.kh.hotels.mngApproval.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.controller.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.service.ApprovalService;
import com.kh.hotels.mngApproval.model.vo.PageInfo;

@Controller
public class ApproveController {


	@Autowired private final ApprovalService as;

	@Autowired public ApproveController(ApprovalService as) { 
		this.as = as; 
	}



	@RequestMapping("documentApproval.ap")
	public String goApproval(HttpServletRequest request, Model  m) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			
			int listCount = as.getListCount();
			System.out.println("listcount : " + listCount);
				
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			
			List<HashMap<String, Object>> ReportList = as.selectReportList(pi);
			System.out.println(ReportList);
			
			
			for(int i = 0; i < ReportList.size(); i++) {
				if(ReportList.get(i).get("RPSTATUS").equals("WAIT")) {
					ReportList.get(i).put("RPSTATUS", "진행중");
				}else if(ReportList.get(i).get("RPSTATUS").equals("APPR")) {
					ReportList.get(i).put("RPSTATUS", "승인");
				}else {
					ReportList.get(i).put("RPSTATUS", "반려");
				}
			}
			
			
			m.addAttribute("list", ReportList);
			m.addAttribute("pi", pi);
			
			
			System.out.println("list : " + ReportList);
			
			
			return "hoteladmin/mngApprove/ApproveList/allApprove";
			
			
		} catch (ReportException e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	
		

	}
	@GetMapping("docuFilter.ap")
	public String docuFilterWait(HttpServletRequest request, ModelAndView mv) {
		
		
		int currentPage = 1;
		
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			
			int listCount = as.getListCountFilter();
			System.out.println("listcount : " + listCount);
				
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			
			List<HashMap<String, Object>> ReportList = as.selectReportList(pi);
			System.out.println(ReportList);
			
			
			for(int i = 0; i < ReportList.size(); i++) {
				if(ReportList.get(i).get("RPSTATUS").equals("WAIT")) {
					ReportList.get(i).put("RPSTATUS", "진행중");
				}else if(ReportList.get(i).get("RPSTATUS").equals("APPR")) {
					ReportList.get(i).put("RPSTATUS", "승인");
				}else {
					ReportList.get(i).put("RPSTATUS", "반려");
				}
			}
			
			
			//m.addAttribute("list", ReportList);
			//m.addAttribute("pi", pi);
			
			
			System.out.println("list : " + ReportList);
			
			
			return "hoteladmin/mngApprove/ApproveList/allApprove";
			
			
		} catch (ReportException e) {
			/* mv.addAttribute("msg", e.getMessage()); */
			return "common/errorPage";
		}
		
	}
	@RequestMapping("joinDocumentApproval.ap")
	public String goJoinApproval() {

		return "hoteladmin/mngApprove/ApproveList/partiApprove";
	}


	@RequestMapping("writeApprove.ap")
	public String gowrite() {
		return "hoteladmin/mngApprove/writeApprove/writePurchaseApprove";
	}
	@RequestMapping("writePurchaseApprove.ap")
	public String goWrite() {
		return "hoteladmin/mngApprove/writeApprove/writerPurchaseApprove";
	}
	@RequestMapping("writeFixApprove.ap")
	public String goWriteFixApprove() {

		return "hoteladmin/mngApprove/writeApprove/writerFixApprove";
	}
	@RequestMapping("writeOrderApprove.ap")
	public String goWriteOrderApprove() {

		return "hoteladmin/mngApprove/writeApprove/writerOrderApprove";
	}
	@RequestMapping("allApproveDetail.ap")
	public String showApproveDetail() {

		return "hoteladmin/mngApprove/allApproveDetail";
	}
	@RequestMapping("writeAllApprove.ap")
	public String showWriteAll() {

		return "hoteladmin/mngApprove/writeApprove/writeAllApprove";
	}

}
