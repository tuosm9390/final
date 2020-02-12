package com.kh.hotels.mngApproval.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hotels.hotel.controller.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.service.ApprovalService;
import com.kh.hotels.mngApproval.model.vo.OrderRequest;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PartiReport;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.RepRequest;
import com.kh.hotels.mngApproval.model.vo.Report;

@Controller
public class ApproveController {


	@Autowired private final ApprovalService as;

	@Autowired public ApproveController(ApprovalService as) { 
		this.as = as; 
	}



	@RequestMapping("documentApproval.ap")
	public String goApproval(HttpServletRequest request, Model  m) {
		
		System.out.println("처음 들어와??");
		
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

			
			System.out.println("여기여기여기");
			return "hoteladmin/mngApprove/ApproveList/allApprove";


		} catch (ReportException e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}




	}
	@GetMapping("docuFilter.ap")
	public ModelAndView docuFilterWait(HttpServletRequest request, ModelAndView mv, String scurrentPage, String cate, String mno) {

		//int currentPage = 1;

		int chScurrentPage = 0;
		String cateCh = "";

		if(cate.equals("진행중")) {
			cateCh = "WAIT";
		}else if(cate.equals("반려")) {
			cateCh = "REJECT";

		}else if(cate.equals("승인")){
			cateCh = "APPR";
		}else if(cate.equals("내 기안함")){
			
			int myMno = Integer.parseInt(mno);
			
			if(scurrentPage != null) {
				chScurrentPage = Integer.parseInt(scurrentPage);
			}
			
			int listCount = 0;
			List<HashMap<String, Object>> reportList = null;
			PageInfo pi = null;
			
			listCount = as.getListCount(myMno);
			pi = Pagination.getPageInfo(chScurrentPage, listCount);
			reportList= as.selectReportList(pi, myMno);
			
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
			
			mv.addObject("reportList", reportList);
			mv.addObject("pi", pi);
			mv.addObject("cate", cateCh);
			mv.setViewName("jsonView");


			return mv;
			
			//여기가 끝
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
				
				for(int i = 0; i < reportList.size(); i++) {
					reportList.get(i).put("RNAME", reportList.get(i).get("SNAME"));
				}
				
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
	public String goJoinApproval( HttpServletRequest request, @RequestParam("userDept") int userDept, @RequestParam("userAuth") String userAuth, @RequestParam("userMno") int userMno, Model model) {
		System.out.println("여기는 왜들어오니?");
		System.out.println("userDept : " + userDept);
		System.out.println("userAuth : " + userAuth);
		System.out.println("mno : " + userMno);
		
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		

		Report report = new Report();
		
		PartiReport member = new PartiReport();
		
		/*
		 * int userDeptNum = Integer.parseInt(userDept); int mno =
		 * Integer.parseInt(userMno);
		 */
		
		member.setAuth(userAuth);
		member.setDeptNo(userDept);
		member.setMno(userMno);
		
		
		
		try {
			
			int listCount = as.getPartiApproveListCount(userMno);

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);


			//List<HashMap<String, Object>> ReportList = as.selectReportList(pi);
		
			
			ArrayList<HashMap<String, Object>> list = null;
			
			if(userDept == 2) {
				list = as.selectPartiApproveList(member, pi);
				
			}else if(userDept == 3){
				
			}else {
				list = as.selectPartiApproveAll(member, pi);
			}
			
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).get("RPSTATUS").equals("WAIT")) {
					list.get(i).put("RPSTATUS", "진행중");
				}else if(list.get(i).get("RPSTATUS").equals("APPR")) {
					list.get(i).put("RPSTATUS", "승인");
				}else {
					list.get(i).put("RPSTATUS", "반려");
				}
			}
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).get("RPTYPE").equals("PURCHASE")) {
					list.get(i).put("RPTYPE", "구매 요청서");
				}else if(list.get(i).get("RPTYPE").equals("ORDER")) {
					list.get(i).put("RPTYPE", "발주 요청서");
				}else {
					list.get(i).put("RPTYPE", "수리 요청서");
				}
			}
			
			
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			System.out.println("list : " + list);
			return "hoteladmin/mngApprove/ApproveList/partiApprove";
			
		} catch (ReportException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
		

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
	public String goWriteFixApprove(HttpServletRequest request, Model m) {
		
		try {
			List<HashMap<String, Object>> list = as.selectRepairInfo();
			List<HashMap<String, Object>> listCon =as.selectRepairConList(); 
			
			m.addAttribute("list", list);
			m.addAttribute("listCon", listCon);
			
			return "hoteladmin/mngApprove/writeApprove/writerFixApprove";
			
		} catch (ReportException e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
		
		
		
	}
	@RequestMapping("writeOrderApprove.ap")
	public String goWriteOrderApprove(HttpServletRequest request, Model m) {
		
		
		ArrayList<HashMap<String, Object>> list = as.selectOrderInfo();
		ArrayList<HashMap<String, Object>> listDocu = as.selectOrderDocu();
		
		System.out.println("listDocu : " + listDocu);
		
		m.addAttribute("list", list);
		m.addAttribute("listDocu", listDocu);
		
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
			System.out.println("type : " + type );
			try {
				type = "";
				type = "PURCHASE";
				List<HashMap<String, Object>> list = as.selectApprovePurDetail(rptNo, type);
				//list.get(0).put("DNAME", value)
				
				for(int i = 0; i < list.size(); i++) {
					if(list.get(i).get("ITYPE").equals("EQUIP")) {
						list.get(i).put("ITYPE","비품");
					}else {
						list.get(i).put("ITYPE","소모품");
					}
				}

				mv.addObject("list", list);
				mv.setViewName("jsonView");



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

				for(int i = 0; i < list.size(); i++) {
					if(list.get(i).get("ITYPE").equals("EQUIP")) {
						list.get(i).put("ITYPE","비품");
					}else {
						list.get(i).put("ITYPE","소모품");
					}
				}


				mv.addObject("list", list);
				mv.setViewName("jsonView");
				System.out.println("list : " + list);
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

				for(int i = 0; i < list.size(); i++) {
					if(list.get(i).get("ITYPE").equals("EQUIP")) {
						list.get(i).put("ITYPE","비품");
					}else {
						list.get(i).put("ITYPE","소모품");
					}
				}


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
	@RequestMapping("insertPurchase.ap")
	public String insertPurchase(HttpServletRequest request, Model m, String docno, String rptDate, 
			String sname, String mname, String title, String content, String type, String cname, String iname, String mfg, String vosprice, String amount,
			String price, String totPrice, String ino, Model model ) {
		
		System.out.println("sname : " + sname);
		System.out.println("docno : " + docno);
		
		if(ino.contains(",")) {
		
				int count = sname.indexOf("(");
				int countStart = count+1;
				int countEnd = sname.indexOf(")");
				
				String stfId = sname.substring(countStart, countEnd);
				String ssName = sname.substring(0, count);
				
				System.out.println("stfId : " + stfId);
				System.out.println("count : " + count);
				System.out.println("countEnd : " + countEnd);
				System.out.println("ssName : " + ssName);
				
				
		
		
				ArrayList<PurRequest> pRequestList = new ArrayList<>();
		
				//int docNo = Integer.parseInt(docno);
		
				int mno = Integer.parseInt(mname); 
				Long docNo = Long.parseLong(docno);
				int totalPrice = Integer.parseInt(totPrice);
				
				
				
				String[] cName = cname.split(",");
				String[] iName = iname.split(",");
				String[] mFg = mfg.split(",");
				
				//int
				String[] vo = vosprice.split(",");
				String[] am = amount.split(",");
				String[] pr = price.split(",");
				String[] in = ino.split(",");
				
				int[] vos2 = new int[cName.length];
				int[] amount2 = new int[cName.length];
				int[] price2 = new int[cName.length];
				int[] ino2 = new int[cName.length];
				
				
				System.out.println("cName.length : " + cName.length);
				
				PurRequest pRequest = null;
				
				
				
				
				for(int j = 0; j < cName.length; j++) {
					pRequest = new PurRequest();
					vos2[j] = Integer.parseInt(vo[j]);
					amount2[j] = Integer.parseInt(am[j]);
					price2[j] = Integer.parseInt(pr[j]);
					ino2[j] = Integer.parseInt(in[j]);
					
					pRequest.setVosprice(vos2[j]);
					pRequest.setAmount(amount2[j]);
					pRequest.setPrice(price2[j]);
					pRequest.setIno(ino2[j]);
					pRequest.setCname(cName[j]);
					pRequest.setIname(iName[j]);
					pRequest.setMfg(mFg[j]);
					pRequest.setDeptname("구매팀"); 
					pRequest.setMmno(mno);
					pRequest.setRptDate(rptDate); 
					pRequest.setSname(ssName); 
					pRequest.setTitle(title);
					pRequest.setContent(content);
					pRequest.setType(type);
					pRequest.setDocno(docNo);
					pRequest.setTotPrice(totPrice);
					pRequest.setStfId(stfId);
					pRequestList.add(pRequest);
					System.out.println("for문안 pRequestList : " + pRequestList);
				}
				
				
				
				
				//System.out.println("중간pRequestList : " + pRequestList);
				try {
					System.out.println("pRequestList : " + pRequestList);
					int result = as.insertList(pRequestList);
					model.addAttribute("pRequestList", pRequestList);
					
					return "redirect:/documentApproval.ap";
					
					
					
				} catch (ReportException e) {
					model.addAttribute("msg", "실패");
					return "common/errorPage";
				}
	}else {

		ArrayList<PurRequest> pRequestList = new ArrayList<>();
		
		int count = sname.indexOf("(");
		int countStart = count+1;
		int countEnd = sname.indexOf(")");
		
		String stfId = sname.substring(countStart, countEnd);
		String ssName = sname.substring(0, count);

		//int docNo = Integer.parseInt(docno);

		int mno = Integer.parseInt(mname); 
		Long docNo = Long.parseLong(docno);
		int totalPrice = Integer.parseInt(totPrice);
		int vos = Integer.parseInt(vosprice);
		int amountR = Integer.parseInt(amount);
		int priceR = Integer.parseInt(price);
		int inoR = Integer.parseInt(ino);
		
		PurRequest pRequest =  new PurRequest();
		
		 
		    
		
		pRequest.setDeptname("구매팀"); 
		pRequest.setMmno(mno);
		pRequest.setRptDate(rptDate); 
		pRequest.setSname(sname); 
		pRequest.setTitle(title);
		pRequest.setContent(content);
		pRequest.setType(type);
		pRequest.setDocno(docNo);
		pRequest.setTotPrice(totPrice);
		pRequest.setMname(mname);
		pRequest.setCname(cname);
		pRequest.setIname(iname);
		pRequest.setMfg(mfg);
		pRequest.setVosprice(vos);
		pRequest.setAmount(amountR);
		pRequest.setPrice(priceR);
		pRequest.setIno(inoR);
		pRequest.setStfId(stfId);
		
		pRequestList.add(pRequest);
		
		System.out.println("for문안 pRequestList : " + pRequestList);
		
		try {
			int result = as.insertList(pRequestList);
			
			
			
			model.addAttribute("pRequestList", pRequestList);
			
			
			return "redirect:/documentApproval.ap";
			
		} catch (ReportException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return null;
		
	}
		

	}
	@RequestMapping("insertOrder.ap")
	public String insertOrderApprove(HttpServletRequest request, Model m, String docuNos, String rptDate, 
			String sname, String mname, String title, String content, String type, String cname, String iname, String mfg, String vos, String amount,
			String price, String totPrice, String ino, String dnum, String docno, String orderDate, String rsn)  {
		
		
		
		
		
		System.out.println("orderDate : " + orderDate);
		System.out.println("sname : " + sname);
		System.out.println("rptDate : " + rptDate);
		System.out.println("mname : " + mname);
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("type : " + type);
		System.out.println("cname : " + cname);
		System.out.println("iname : " + iname);
		System.out.println("mfg : " + mfg);
		System.out.println("vos : " + vos);
		System.out.println("amount : " + amount);
		System.out.println("price : " + price);
		System.out.println("totPrice : " + totPrice);
		System.out.println("ino : " + ino);
		System.out.println("docuNos : " + docuNos);
		System.out.println("docno : " + docno);
		
		OrderRequest oRequest = new OrderRequest();
		
		ArrayList<OrderRequest> oRequestList = null;
		
		System.out.println("cname.length : " + cname.length());
		
		Long docuNo = Long.parseLong(docuNos);
		Long docno2 = Long.parseLong(docno);
		int mno = Integer.parseInt(mname);
		
	
		
		
		
		if(cname.contains(",")) {
			oRequestList =  new ArrayList<OrderRequest>();
			String[] typeR = type.split(",");
			String[] cnameR = cname.split(",");
			String[] mfgR = mfg.split(",");
			String[] inameR = iname.split(",");
			String[] vosR = vos.split(",");
			String[] amountR = amount.split(",");
			String[] priceR = price.split(",");
			String[] inoR = ino.split(",");
			//int docnNo = Integer.parseInt(docuNos);
			int vos2[] = new int[cnameR.length];
			int amount2[] = new int[cnameR.length];
			int price2[] = new int[cnameR.length];
			int ino2[] = new int[cnameR.length];
			
		System.out.println("cnameR : " + cnameR.length);
			System.out.println("여기좀되라 : " + oRequestList);

			for(int j = 0; j < cnameR.length; j++) {
				oRequest = new OrderRequest();
				vos2[j] = Integer.parseInt(vosR[j]);
				amount2[j] = Integer.parseInt(amountR[j]);
				price2[j] = Integer.parseInt(priceR[j]);
				ino2[j] = Integer.parseInt(inoR[j]);
				oRequest.setType(typeR[0]);
				oRequest.setVosprice(vos2[j]);
				oRequest.setAmount(amount2[j]);
				oRequest.setPrice(price2[j]);
				oRequest.setIno(ino2[j]);
				oRequest.setCname(cnameR[j]);
				oRequest.setIname(inameR[j]);
				oRequest.setMfg(mfgR[j]);
				oRequest.setPurDocuno(docuNo);
				oRequest.setDeptname("구매팀"); 
				oRequest.setMno(mno);
				oRequest.setRptDate(rptDate); 
				oRequest.setTitle(title);
				oRequest.setContent(content);
				oRequest.setDocno(docno2);
				oRequest.setTotPrice(totPrice);
				oRequest.setStfId(sname);
				oRequest.setRsvReqDate(orderDate);
				oRequest.setOrderRsn(rsn);
				oRequestList.add(oRequest);
				System.out.println("for문안 pRequestList : " + oRequestList);
			}
			
			System.out.println("controllerlist길이 : " + oRequestList.size());
			
			//pRequestList = as.insertOrderList(pRequestList);
			
			int result = as.insertOrderList(oRequestList);
			
			return "redirect:/documentApproval.ap";
			
		}else {
			oRequestList =  new ArrayList<OrderRequest>();
			oRequest = new OrderRequest();
			int vosR = Integer.parseInt(vos);
			int amountR = Integer.parseInt(amount);
			int priceR = Integer.parseInt(price);
			int inoR = Integer.parseInt(ino);
			
			
			
			oRequest.setType(type);
			oRequest.setVosprice(vosR);
			oRequest.setAmount(amountR);
			oRequest.setPrice(priceR);
			oRequest.setIno(inoR);
			oRequest.setCname(cname);
			oRequest.setIname(iname);
			oRequest.setMfg(mfg);
			oRequest.setPurDocuno(docuNo);
			oRequest.setDeptname("구매팀"); 
			oRequest.setMno(mno);
			oRequest.setRptDate(rptDate); 
			oRequest.setTitle(title);
			oRequest.setContent(content);
			oRequest.setDocno(docno2);
			oRequest.setTotPrice(totPrice);
			oRequest.setStfId(sname);
			oRequest.setRsvReqDate(orderDate);
			oRequestList.add(oRequest);
			
			//int result = as.insertOrderList(oRequestList);
			
		}
		int result = as.insertOrderList(oRequestList);
		return "redirect:/documentApproval.ap";
		
		
		
	}
	


	
	@GetMapping("itemType.ap")
	public ModelAndView itemType(HttpServletRequest request, ModelAndView mv, String value) {

		try {

			List<String> connName = as.selectConnName(value);
			mv.addObject("value", connName);
			mv.setViewName("jsonView");


			return mv;
		} catch (ReportException e) {
			mv.addObject("msg", e.getMessage()); 
			mv.setViewName("jsonView");



			return mv;
		}


	}
	@GetMapping("itemName.ap")
	public ModelAndView itemName(HttpServletRequest request, ModelAndView mv, String mfg, String cname, String type) {

		List<String> list = new ArrayList();
		PurRequest pRequest = new PurRequest();
		pRequest.setCname(cname);
		pRequest.setMfg(mfg);
		pRequest.setType(type);


		try {
			list = as.selectItemName(pRequest);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

			return mv;


		} catch (ReportException e) {
			return mv;
		}





	}



	//제조사 찾기
	@GetMapping("madeComName.ap")
	public ModelAndView madeComName(HttpServletRequest request, ModelAndView mv, String value, String type) {

		List<String> list;
		try {
			list = as.selectMadeComName(value, type);

			mv.addObject("list", list);
			mv.setViewName("jsonView");


			return mv;

		} catch (ReportException e) {
			mv.addObject("msg", e.getMessage()); 
			mv.setViewName("jsonView");



			return mv;
		}



	}
	@GetMapping("selectVos.ap")
	public ModelAndView selectVos(HttpServletRequest request, ModelAndView mv, String type, String cnName, String iname, String madeComName) {


		/*
		 * if(type.equals("비품")) { type = ""; type = "EQUIP"; }else { type = ""; type =
		 * "CONS"; }
		 */

		PurVos pv = new PurVos();
		pv.setCnName(cnName);
		pv.setIname(iname);
		pv.setMadeComName(madeComName);
		pv.setType(type);

		List<Integer> list = as.selectVosEquip(pv);


		mv.addObject("list", list);
		mv.setViewName("jsonView");




		return mv;
	}
	@GetMapping("repairIname.ap")
	public ModelAndView selectRepairIname(HttpServletRequest request, ModelAndView mv, String value) {
		
		int ino = Integer.parseInt(value);
		
		try {
			String result = as.selectIname(ino);
			
			mv.addObject("iname", result);
			mv.setViewName("jsonView");
			return mv;
			
		} catch (ReportException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("jsonView");
			return mv;

		}
		
		
		
	}
	
	@GetMapping("insertRepairRequest.ap")
	public String insertRepair(HttpServletRequest request, Model model, String docno, String mmno,
									String rptDate, String sname, String smno, String title, String content, 
									String ino, String iname, String cnName, String price, String rsn, String totalPrice) {
	
		ArrayList<RepRequest> rRequestList = new ArrayList<>();

		//int docNo = Integer.parseInt(docno);

		int mName = Integer.parseInt(mmno); 
		int sno = Integer.parseInt(smno);
		Long docNo = Long.parseLong(docno);
		int totPrice = Integer.parseInt(totalPrice);
		
		RepRequest rRequest = null;
		
		if(iname.contains(",")) {
			//수리비용
			String[] cName = cnName.split(",");
			//수리비용 끝
			
			String[] iName = iname.split(",");
			
			//거래처 이름
			String[] pr = price.split(",");
			//거래청 이름 끝
			
			//제품코드 
			String[] in = ino.split(",");
			int[] ino2 = new int[cName.length];
			//제품코드 종료
			
			//수리비용
			int[] repairPrice = new int[cName.length];
			
			//수리 사유
			String[] repairRsn = rsn.split(",");
			
			//
			
			for(int j = 0; j < repairPrice.length; j++) {
				rRequest = new RepRequest();
				
				//수리요청서 밑에 항목 5개
				ino2[j] = Integer.parseInt(in[j]);
				repairPrice[j] = Integer.parseInt(cName[j]);
				
				rRequest.setPrice(repairPrice[j]);
				rRequest.setIno(ino2[j]);
				rRequest.setCnName(pr[j]);
				rRequest.setRsn(repairRsn[j]);
				rRequest.setIname(iName[j]);
				//5개 항목 끝
				
				
				rRequest.setDeptName(("시설팀")); 
				rRequest.setMmno(mName);
				rRequest.setRptDate(rptDate); 
				rRequest.setSmno(sno);
				rRequest.setSname(sname); 
				rRequest.setTitle(title);
				rRequest.setContent(content);
				rRequest.setDocno(docNo);
				rRequest.setTotalPrice((totPrice));
				rRequest.setRsn(rsn);
				rRequestList.add(rRequest);
				
				System.out.println("for문안 pRequestList : " + rRequestList);
				
				
			}
			
			
			try {
				int result = as.insertRepairRequestList(rRequestList);
				
				model.addAttribute("rRequestList", rRequestList);
				return "redirect:/documentApproval.ap";
				
			} catch (ReportException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}else {
			
			
			
			
			int repairPrice = Integer.parseInt(cnName);
			int inoR = Integer.parseInt(ino);
			
			rRequest = new RepRequest();
			rRequest.setIno(inoR);
			rRequest.setPrice(repairPrice);
			rRequest.setRsn(rsn);
			rRequest.setIname(iname);
			
			
			rRequest.setCnName(price);
			rRequest.setDeptName(("시설팀")); 
			rRequest.setMmno(mName);
			rRequest.setRptDate(rptDate); 
			rRequest.setSmno(sno);
			rRequest.setSname(sname); 
			rRequest.setTitle(title);
			rRequest.setContent(content);
			rRequest.setDocno(docNo);
			rRequest.setTotalPrice((totPrice));
			rRequestList.add(rRequest);
			
			
			System.out.println("for문안 pRequestList : " + rRequestList);
			try {
				int result = as.insertRepairRequestList(rRequestList);
				
				model.addAttribute("rRequestList", rRequestList);
				return "redirect:/documentApproval.ap";
				
			} catch (ReportException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}
		
		
	
	}
	
	@GetMapping("documentPartiApproval.ap")
	public String partiApprovePaging(HttpServletRequest request, Model model) {
		
		int currentPage = 1;
		int mno = Integer.parseInt(request.getParameter("mno"));
				

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		int listCount = as.getPartiApproveListCount(mno);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	
		
		ArrayList<HashMap<String, Object>> list = null;
		
		list = as.selectPartiApproveList(mno, pi);
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).get("RPSTATUS").equals("WAIT")) {
				list.get(i).put("RPSTATUS", "진행중");
			}else if(list.get(i).get("RPSTATUS").equals("APPR")) {
				list.get(i).put("RPSTATUS", "승인");
			}else {
				list.get(i).put("RPSTATUS", "반려");
			}
		}
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).get("RPTYPE").equals("PURCHASE")) {
				list.get(i).put("RPTYPE", "구매 요청서");
			}else if(list.get(i).get("RPTYPE").equals("ORDER")) {
				list.get(i).put("RPTYPE", "발주 요청서");
			}else {
				list.get(i).put("RPTYPE", "수리 요청서");
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);



		return "hoteladmin/mngApprove/ApproveList/partiApprove";
		
		
		
	}
	@PostMapping("docuPartiFilter.ap")
	public ModelAndView partiCateFilter(ModelAndView mv, String cate, String scurrentPage, String mno) {
		System.out.println("넘어오니???");
		
		System.out.println("cate : " + cate);
		System.out.println("scurrentPage : " + scurrentPage);
		System.out.println("mno : " + mno);
		
		int currentPage = 1;
		
		int mmno = 0;
		
		String category = "";
		
		if(cate.equals("진행중")) {
			category = "WAIT";
		}else if(cate.equals("반려")) {
			category = "REJECT";
		}else if(cate.equals("승인")){
			category = "APPR";
			
		}else {
			category = "";
		}
		
		if(scurrentPage != null) {
			currentPage = Integer.parseInt(scurrentPage);
		}
		
		int listCount = 0;
		ArrayList<HashMap<String, Object>> partiReportList = null;
		PageInfo pi = null;
		
		if(category != "") {
			listCount = as.getListCountPartiFilter(category, mno);
			pi = Pagination.getPageInfo(currentPage, listCount);
			
			partiReportList = as.selectPartiApproveFilter(pi, category, mno);
		}else {
			
			mmno = Integer.parseInt(mno);
			
			  listCount = as.getPartiApproveListCount(mmno); 
			  pi = Pagination.getPageInfo(currentPage, listCount); 
			  partiReportList = as.selectPartiApproveList(mmno, pi);
		}
		
		for(int i = 0; i < partiReportList.size(); i++) {
			if(partiReportList.get(i).get("RPSTATUS").equals("WAIT")) {
				partiReportList.get(i).put("RPSTATUS", "진행중");
			}else if(partiReportList.get(i).get("RPSTATUS").equals("APPR")) {
				partiReportList.get(i).put("RPSTATUS", "승인");
			}else {
				partiReportList.get(i).put("RPSTATUS", "반려");
			}
		}
		for(int i = 0; i < partiReportList.size(); i++) {
			if(partiReportList.get(i).get("RPTYPE").equals("PURCHASE")) {
				partiReportList.get(i).put("RPTYPE", "구매 요청서");
			}else if(partiReportList.get(i).get("RPTYPE").equals("ORDER")) {
				partiReportList.get(i).put("RPTYPE", "발주 요청서");
			}else {
				partiReportList.get(i).put("RPTYPE", "수리 요청서");
			}
		}
		
		
		mv.addObject("partiReportList",partiReportList);
		mv.addObject("pi", pi);
		mv.setViewName("jsonView");
		
		
		
		
		return mv;
	}
	
	@RequestMapping("approveYn.ap")
	public String updateApproveStatus(HttpServletRequest request, String status, String dateString, String mno,
									RedirectAttributes redirect, String deptNo, String authNo, String rpt) {
		
		System.out.println("들어오니??");
		
		//int rptno = Integer.parseInt(rptNo);
		int mmno = Integer.parseInt(mno);
		System.out.println("1");
		int deptno = Integer.parseInt(deptNo);
		System.out.println("2");
		int rptNum = Integer.parseInt(rpt);
		System.out.println("3");
		
	
		
		//System.out.println("rptno : " + rptno);
		System.out.println("docuN : " + rptNum);
		System.out.println("mno : " + mmno);
		System.out.println("status : " + status);
		System.out.println("dateString : " + dateString);
		
		
		Report report = new Report();
		
		//report.setRptNo(rptno);
		report.setRptNo(rptNum);
		report.setRptStatus(status);
		report.setApprDate(dateString);
		
		System.out.println("report : " + report);
		
		int result = as.updateApproveStatus(report);
		
		
		  redirect.addAttribute("userMno",mmno); 
		  redirect.addAttribute("userDept", deptno);
		  redirect.addAttribute("userAuth",authNo );
		 
		
		System.out.println("결과 : " + result);
		
		return "redirect:joinDocumentApproval.ap";
	}
	@RequestMapping("selectOrderInfo.ap")
	public ModelAndView OrderInfo(ModelAndView mv, Long dnum) {
		
		System.out.println("dnum : " + dnum);
		
		
		
		ArrayList<HashMap<String, Object>> list = as.selectOrderList(dnum);
		System.out.println("list : " + list);
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).get("ITYPE").equals("EQUIP")){
				list.get(i).put("ITYPE", "비품");
			}else {
				list.get(i).put("ITYPE", "비품");
			}
		}
		
		mv.addObject("list", list);
		mv.setViewName("jsonView");
		
		
		return mv;
	}
	
}