package com.kh.hotels.mngApproval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.hotel.controller.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.service.ApprovalService;
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
	public String goJoinApproval(HttpServletRequest request, String userDept, String userAuth, String userMno, Model model) {
		System.out.println("userDept : " + userDept);
		System.out.println("userAuth : " + userAuth);
		System.out.println("mno : " + userMno);
		
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		

		Report report = new Report();
		
		PartiReport member = new PartiReport();
		
		int userDeptNum = Integer.parseInt(userDept);
		int mno = Integer.parseInt(userMno);
		
		member.setAuth(userAuth);
		member.setDeptNo(userDeptNum);
		member.setMno(mno);
		
		
		
		try {
			
			int listCount = as.getPartiApproveListCount(mno);

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);


			//List<HashMap<String, Object>> ReportList = as.selectReportList(pi);
		
			
			ArrayList<HashMap<String, Object>> list = null;
			
			if(userDeptNum == 2) {
				list = as.selectPartiApproveList(member, pi);
				
			}else if(userDeptNum == 3){
				
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
			m.addAttribute("list", list);
			
			return "hoteladmin/mngApprove/writeApprove/writerFixApprove";
			
		} catch (ReportException e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
		
		
		
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
			String sname, String mname, String smno, String title, String content, String type, String cname, String iname, String mfg, String vosprice, String amount,
			String price, String totPrice, String ino, Model model ) {


		System.out.println("처음넘어오는 리스트 : " + ino);
		
		/*
		 * System.out.println("docno : " + docno); System.out.println("rptDate : " +
		 * rptDate); System.out.println("sname : " + sname);
		 * System.out.println("smno : " + smno); System.out.println("title : " + title);
		 * System.out.println("content : " + content); System.out.println("type : " +
		 * type); System.out.println("mmno : " + mname); System.out.println("smno : " +
		 * smno);
		 * 
		 * System.out.println("cname : " + cname); System.out.println("iname : " +
		 * iname); System.out.println("mfg : " + mfg); System.out.println("vosPrice : "
		 * + vosprice); System.out.println("amount : " + amount);
		 * System.out.println("price : " + price); System.out.println("totPrice : " +
		 * totPrice); System.out.println("ino : " + ino);
		 */

		ArrayList<PurRequest> pRequestList = new ArrayList<>();

		//int docNo = Integer.parseInt(docno);

		int mno = Integer.parseInt(mname); 
		int sno = Integer.parseInt(smno);
		int docNo = Integer.parseInt(docno);
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
			pRequest.setSmno(sno);
			pRequest.setSname(sname); 
			pRequest.setTitle(title);
			pRequest.setContent(content);
			pRequest.setType(type);
			pRequest.setDocno(docNo);
			pRequest.setTotPrice(totPrice);
			pRequestList.add(pRequest);
			System.out.println("for문안 pRequestList : " + pRequestList);
		}
		
		
		
		
		System.out.println("중간pRequestList : " + pRequestList);
		try {
			System.out.println("pRequestList : " + pRequestList);
			int result = as.insertList(pRequestList);
			model.addAttribute("pRequestList", pRequestList);
			
			return "redirect:/documentApproval.ap";
			
			
			
		} catch (ReportException e) {
			model.addAttribute("msg", "실패");
			return "common/errorPage";
		}
		

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
	public ModelAndView itemName(HttpServletRequest request, ModelAndView mv, String mfg, String cname) {

		List<String> list = new ArrayList();
		PurRequest pRequest = new PurRequest();
		pRequest.setCname(cname);
		pRequest.setMfg(mfg);


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
	public ModelAndView madeComName(HttpServletRequest request, ModelAndView mv, String value) {

		List<String> list;
		try {
			list = as.selectMadeComName(value);

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
		int docNo = Integer.parseInt(docno);
		int totPrice = Integer.parseInt(totalPrice);
		
		String[] cName = cnName.split(",");
		String[] iName = iname.split(",");
		String[] repRson = rsn.split(",");
		
		//int
		String[] pr = price.split(",");
		String[] in = ino.split(",");
		
		int[] price2 = new int[cName.length];
		int[] ino2 = new int[cName.length];
		
		
		System.out.println("cName.length : " + cName.length);
		
		RepRequest rRequest = null;
		
		
		
		
		for(int j = 0; j < cName.length; j++) {
			rRequest = new RepRequest();
			price2[j] = Integer.parseInt(pr[j]);
			ino2[j] = Integer.parseInt(in[j]);
			
			rRequest.setPrice(price2[j]);
			rRequest.setIno(ino2[j]);
			rRequest.setCnName(cName[j]);
			rRequest.setIname(iName[j]);
			rRequest.setDeptName(("시설팀")); 
			rRequest.setMmno(mName);
			rRequest.setRptDate(rptDate); 
			rRequest.setSmno(sno);
			rRequest.setSname(sname); 
			rRequest.setTitle(title);
			rRequest.setContent(content);
			rRequest.setDocno(docNo);
			rRequest.setTotalPrice((totPrice));
			rRequest.setRsn(repRson[j]);
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
		int currentPage = 1;
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
			
			/*
			 * listCount = as.getPartiApproveListCount(mno); pi =
			 * Pagination.getPageInfo(currentPage, listCount); partiReportList =
			 * as.selectPartiApproveList(pi, mno);
			 */
			 
		}
		
		
		mv.addObject("partiReportList",partiReportList);
		mv.addObject("pi", pi);
		mv.setViewName("jsonView");
		
		
		
		
		return mv;
	}
	
}