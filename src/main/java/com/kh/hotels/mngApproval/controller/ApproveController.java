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
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.service.ApprovalService;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.Report;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemType;

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
   public ModelAndView insertPurchase(HttpServletRequest request, Model m, int sMno, int mMno, String title,
                        String content, int tblDocuNum, String rptDate, String tblTeam, String[] tdArr) {
      
      
        System.out.println("sMno : " + sMno); System.out.println("title : " + title);
        System.out.println("content : " + content);
        System.out.println("tblDocuNum : " + tblDocuNum);
        System.out.println("rptDate : " + rptDate); System.out.println("tblTeam : " +
        tblTeam);
       
      
      //int mMno = 
      
      HashMap<String, Object> hmap = new HashMap<>();
      
      
      
      Report report = new Report();
      PurRequest pRequest = new PurRequest();
      
      report.setDocNo(tblDocuNum);
      report.setMno(mMno);
      report.setReceiver(sMno);
      report.setRptDate(rptDate);
      report.setRptTitle(title);
      pRequest.setPurRsn(content);
      //pRequest.setAmount(amount);
      
      System.out.println(tdArr.length);
      
      //ITEM, ITEM_TYPE, 끝
      Item item = new Item();
      ItemType itemType = new ItemType();
      
      
      
      
      int count = tdArr.length / 6;
      
      
      
      /*
       * for(int i = 0; i < tdArr.length; i++) { System.out.println(tdArr[i]);
       * //System.out.println("count : " + tdArr.length); List<HashMap<String,
       * Object>> list = as.selectInsertInfoList(tdArr[3], );
       * 
       * 
       * if(tdArr.count)
       * 
       * 
       * 
       * }
       */
      System.out.println("totalcount : " + count);
      
      
      
      
      
      //List<HashMap<String, Object>> list = 
      
      
      
      return null;
   }

	/*
	 * @GetMapping("showVos.ap") public ModelAndView showVos(HttpServletRequest
	 * request, ModelAndView mv, String iName) {
	 * 
	 * int vos = as.selectVos(iName);
	 * 
	 * 
	 * return null; }
	 */
   @GetMapping("itemType.ap")
   public ModelAndView itemType(HttpServletRequest request, ModelAndView mv, String value) {
      
      try {
         
         List<String> connName = as.selectConnName(value);
         mv.addObject("value", connName);
         mv.setViewName("jsonView");
         System.out.println("connName : " + connName);
         
         return mv;
      } catch (ReportException e) {
         mv.addObject("msg", e.getMessage()); 
          mv.setViewName("jsonView");
          
          
         
         return mv;
      }
      
      
   }
   @GetMapping("itemName.ap")
   public ModelAndView itemName(HttpServletRequest request, ModelAndView mv, String value) {
      
      List<String> list;
	try {
		list = as.selectItemName(value);
		
		 mv.addObject("list", list);
	      mv.setViewName("jsonView");
	      System.out.println("list : " + list);
	      
	      return mv;
		
	} catch (ReportException e) {
		mv.addObject("msg", e.getMessage()); 
        mv.setViewName("jsonView");
        
        
       
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
	      System.out.println("list : " + list);
	      
	      System.out.println("cnName : " + list);
	      
	      return mv;
		
	} catch (ReportException e) {
		mv.addObject("msg", e.getMessage()); 
        mv.setViewName("jsonView");
        
        
       
       return mv;
	}
      
     
      
   }
   @GetMapping("selectVos.ap")
   public ModelAndView selectVos(HttpServletRequest request, ModelAndView mv, String type, String cnName, String iname, String madeComName) {
	   
	  System.out.println("type : " + type);
	  System.out.println("type : " + cnName);
	  System.out.println("type : " + iname);
	  System.out.println("type : " + madeComName);
	   
	   PurVos pv = new PurVos();
	   pv.setCnName(cnName);
	   pv.setIname(iname);
	   pv.setMadeComName(madeComName);
	   pv.setType(type);
	   
	   
	   
	   int vos = as.selectVosEquip(pv);
	   mv.addObject("vos", vos);
	   mv.setViewName("jsonView");
	   
	   System.out.println("vos : "+ vos);
	   
	   
	   
	   return mv;
   }
   
   

}