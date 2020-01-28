package com.kh.hotels.mngApproval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
				
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			
			List<HashMap<String, Object>> ReportList = as.selectReportList(pi);
			
			
			for(int i = 0; i < ReportList.size(); i++) {
				if(ReportList.get(i).get("RPSTATUS").equals("WAIT")) {
					ReportList.get(i).put("RPSTATUS", "진행중");
				}else if(ReportList.get(i).get("RPSTATUS").equals("APPR")) {
					ReportList.get(i).put("RPSTATUS", "승인");
				}else {
					ReportList.get(i).put("RPSTATUS", "반려");
				}
			}
			for(int i = 0; i < ReportList.size(); i++) {
				if(ReportList.get(i).get("RPTYPE").equals("PURCHASE")) {
					ReportList.get(i).put("RPTYPE", "구매 요청서");
				}else if(ReportList.get(i).get("RPTYPE").equals("ORDER")) {
					ReportList.get(i).put("RPTYPE", "발주 요청서");
				}else {
					ReportList.get(i).put("RPTYPE", "수리 요청서");
				}
			}
			
			
			m.addAttribute("list", ReportList);
			m.addAttribute("pi", pi);
			
			
			
			
			return "hoteladmin/mngApprove/ApproveList/allApprove";
			
			
		} catch (ReportException e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	
		

	}
	@GetMapping("docuFilter.ap")
	public ModelAndView docuFilterWait(HttpServletRequest request, ModelAndView mv, String scurrentPage, String cate) {
		
		//int currentPage = 1;
		
				int chScurrentPage = 0;
				String cateCh = "";
				
				if(cate.equals("진행중")) {
					cateCh = "WAIT";
				}else if(cate.equals("반려")) {
					cateCh = "REJECT";
					
				}else if(cate.equals("승인")){
					cateCh = "APPR";
				}else {
					cateCh = "";
				}
				
				if(scurrentPage != null) {
					chScurrentPage = Integer.parseInt(scurrentPage);
				}
				
				try {
					
					int listCount = 0;
					List<HashMap<String, Object>> reportList = null;
					PageInfo pi = null;
					
					
					if(cateCh != "") {
						listCount = as.getListCountFilter(cateCh);
						pi = Pagination.getPageInfo(chScurrentPage, listCount);
						
						
						reportList = as.selectFilterReportList(pi, cateCh);
					}else {
						listCount = as.getListCount();
						pi = Pagination.getPageInfo(chScurrentPage, listCount);
						reportList= as.selectReportList(pi);
						
					}
					
					
					
						
					
					
					
					for(int i = 0; i < reportList.size(); i++) {
						if(reportList.get(i).get("RPSTATUS").equals("WAIT")) {
							reportList.get(i).put("RPSTATUS", "진행중");
						}else if(reportList.get(i).get("RPSTATUS").equals("APPR")) {
							reportList.get(i).put("RPSTATUS", "승인");
						}else {
							reportList.get(i).put("RPSTATUS", "반려");
						}
					}
					for(int i = 0; i < reportList.size(); i++) {
						if(reportList.get(i).get("RPTYPE").equals("PURCHASE")) {
							reportList.get(i).put("RPTYPE", "구매 요청서");
						}else if(reportList.get(i).get("RPTYPE").equals("ORDER")) {
							reportList.get(i).put("RPTYPE", "발주 요청서");
						}else {
							reportList.get(i).put("RPTYPE", "수리 요청서");
						}
					}
					
					
					//m.addAttribute("list", ReportList);
					//m.addAttribute("pi", pi);
					
					
					mv.addObject("reportList", reportList);
					mv.addObject("pi", pi);
					mv.addObject("cate", cateCh);
					mv.setViewName("jsonView");
					
					
					return mv;
					
					
				} catch (ReportException e) {
					 mv.addObject("msg", e.getMessage()); 
					 mv.setViewName("jsonView");
					return mv;
				}		
	}
	@RequestMapping("joinDocumentApproval.ap")
	public String goJoinApproval() {

		return "hoteladmin/mngApprove/ApproveList/partiApprove";
	}


	@RequestMapping("writeApprove.ap")
	public String gowrite(HttpServletRequest request, Model m) {
		
		
		
		
		
		return "hoteladmin/mngApprove/writeApprove/writePurchaseApprove";
	}
	@RequestMapping("writePurchaseApprove.ap")
	public String goWrite(HttpServletRequest request, Model m) {
		try {
			List<HashMap<String, Object>> list = as.selectInfo();
			m.addAttribute("list", list);
			
			
		} catch (ReportException e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
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
	@GetMapping("allApproveModal.ap")
	public ModelAndView showAllApproveModal(HttpServletRequest request, ModelAndView mv, int rptNo, String type) {
		
		if(type.equals("구매 요청서")) {
			try {
				type = "";
				type = "PURCHASE";
				List<HashMap<String, Object>> list = as.selectApprovePurDetail(rptNo, type);
				mv.addObject("list", list);
				mv.setViewName("jsonView");
				
				
				/*
				 * for(int i = 0; i < list.size(); i++) { int vos = (int)list.get(i).get("VOS");
				 * int amount = (int) list.get(i).get("AMOUNT"); System.out.println("vos : " +
				 * vos); System.out.println("amount : " + amount); }
				 */
				
				return mv;
				
			} catch (ReportException e) {
				mv.addObject("msg", e.getMessage()); 
				 mv.setViewName("jsonView");
				 
				 
				 
				return mv;
			}
		}else if(type.equals("수리 요청서")) {
			type = "";
			type = "REPAIR";
			
			List<HashMap<String, Object>> list;
			try {
				list = as.selectApproveRepairDetail(rptNo, type);
				
				mv.addObject("list", list);
				mv.setViewName("jsonView");
				return mv;
				
			} catch (ReportException e) {
				mv.addObject("msg", e.getMessage()); 
				 mv.setViewName("jsonView");
				 
				 
				 
				return mv;
			}
			
			
			
		}else {
			type = "";
			type = "ORDER";
			
			List<HashMap<String, Object>> list;
			try {
				list = as.selectApproveOrderDetail(rptNo, type);
				
				mv.addObject("list", list);
				mv.setViewName("jsonView");
				return mv;
				
			} catch (ReportException e) {
				mv.addObject("msg", e.getMessage()); 
				 mv.setViewName("jsonView");
				 
				 
				
				return mv;
			}
			
		}
		
		
		
		
		
		
	}
	

}
