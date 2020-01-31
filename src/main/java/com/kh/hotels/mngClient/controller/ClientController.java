package com.kh.hotels.mngClient.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.mngClient.model.service.ClientService;
import com.kh.hotels.mngClient.model.vo.BlackList;
import com.kh.hotels.mngClient.model.vo.ClientSearchCondition;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngClient.model.vo.QueModal;
import com.kh.hotels.mngClient.model.vo.StayAndRsv;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.Reservation;
import com.kh.hotels.mngStay.model.vo.Stay;

@SessionAttributes({"searchContent","searchOption"})
@Controller
public class ClientController {
	
	@Autowired
	private ClientService cs;
	
	@GetMapping("viewList.cl")
	public String goClientList(HttpServletRequest request, Model model) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int clientCount = cs.getClientListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, clientCount);
		
		ArrayList<Member> clientList = cs.selectClientList(pi);
		
		model.addAttribute("clientCount", clientCount);
		model.addAttribute("clientList", clientList);
		model.addAttribute("pi", pi);
		
		return "viewClientList";
	}
	
	@RequestMapping("deleteClient.cl")
	public String deleteClient(String mno, Model model) {
		
		System.out.println(mno);
		
		String[] stringMno = mno.split(",");
		
		int[] mnos = new int[stringMno.length];
		
		for(int i = 0; i < stringMno.length; i++) {
			mnos[i] = Integer.parseInt(stringMno[i]);
		}
		
		int result = cs.updateClientStatus(mnos);
		
		if(result > 0) {
			model.addAttribute("deleteClientCount", mnos.length);
			return "redirect:/viewList.cl";
		}else {
			return "common/errorPage";
		}
		
	}
	@PostMapping("clientDetail.cl")
	public ModelAndView clientDetail(String mno, HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		HashMap<String, Object> hmap = new HashMap<>();

		int clientMno = Integer.parseInt(mno);
		
		// 고객 정보
		Member clientInfo = cs.selectClientInfo(clientMno);
		// 방문 횟수
		int visitCount = cs.selectVisitCount(clientMno);
		// 매출
		int price = cs.selectTotalPrice(clientMno);
		// 숙박일수
		int stayDay = cs.selectStayDay(clientMno);
		// 최종방문일자
		Stay lastVisit = cs.selectLastVisit(clientMno);
		String enddate;
		if(lastVisit != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			enddate = sdf.format(lastVisit.getCheckOut());
		}else {
			enddate = "기록없음";
		}
		
		ArrayList<Que> queList = cs.selectClientQue(clientMno);
		
		ArrayList<QueModal> queModalList = new ArrayList<>();
		QueModal queModal;
		
		String qdateStr;
		
		for(int i = 0; i < queList.size(); i++) {
			queModal = new QueModal();
			queModal.setQno(queList.get(i).getQno());
			queModal.setMno(queList.get(i).getMno());
			queModal.setQtype(queList.get(i).getQtype());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			qdateStr = sdf.format(queList.get(i).getQdate());
			queModal.setQdate(qdateStr);
			queModal.setQtitle(queList.get(i).getQtitle());
			queModal.setQcontent(queList.get(i).getQcontent());
			queModal.setAnsStatus(queList.get(i).getAnsStatus());
			queModal.setDelStatus(queList.get(i).getDelStatus());
			queModal.setQpwd(queList.get(i).getQpwd());
			queModal.setPwdStatus(queList.get(i).getPwdStatus());
			
			queModalList.add(queModal);
		}
		
		ArrayList<Reservation> rsvList = cs.selectRsvList(clientMno);
		ArrayList<Stay> stayList = cs.selectStayList(clientMno);
		
		System.out.println("rsvList : " + rsvList);
		System.out.println("stayList : "  + stayList);
		
		int listSize = rsvList.size() + stayList.size();
		
		ArrayList<StayAndRsv> sarList = new ArrayList<>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		StayAndRsv stayAndRsv;
		for(int i = 0; i < rsvList.size(); i ++) {
			stayAndRsv = new StayAndRsv();
			stayAndRsv.setCheckIn(sdf.format(rsvList.get(i).getCheckIn()));
			stayAndRsv.setCheckOut(sdf.format(rsvList.get(i).getCheckOut()));
			stayAndRsv.setPrice(rsvList.get(i).getStayPrice());
			stayAndRsv.setRmNo(rsvList.get(i).getRmNo());
			stayAndRsv.setRmNum(rsvList.get(i).getRmNum());
			stayAndRsv.setRsvDate(rsvList.get(i).getRsvDate());
			stayAndRsv.setStatus(rsvList.get(i).getRsvStatus());
			sarList.add(stayAndRsv);
		}
		
		for(int i = 0; i < stayList.size(); i++) {
			stayAndRsv = new StayAndRsv();
			stayAndRsv.setCheckIn(sdf.format(stayList.get(i).getCheckIn()));
			stayAndRsv.setCheckOut(sdf.format(stayList.get(i).getCheckOut()));
			stayAndRsv.setPrice(stayList.get(i).getPrice());
			stayAndRsv.setRmNo(stayList.get(i).getRmNo());
			stayAndRsv.setRmNum(stayList.get(i).getRmNum());
			stayAndRsv.setRsvDate(stayList.get(i).getRsvDate());
			stayAndRsv.setStatus(stayList.get(i).getStayStatus());
			sarList.add(stayAndRsv);
		}
		
		hmap.put("visitCount",visitCount);
		hmap.put("clientInfo", clientInfo);
		hmap.put("price", price);
		hmap.put("stayDay", stayDay);
		hmap.put("lastVisit",enddate);
		hmap.put("queModalList",queModalList);
		hmap.put("sarList",sarList);
		

		mv.addObject("hmap", hmap);
		mv.setViewName("jsonView");
		
		return mv;
	}

	@RequestMapping("searchClient.cl")
	public String selectSearchClient(String searchOption, String searchContent, HttpServletRequest request, Model model) {
		
		ClientSearchCondition csc = new ClientSearchCondition();
		
		if(searchOption.equals("clientName")) {
			csc.setClientName(searchContent);
		}else if(searchOption.equals("clientPhone")){
			csc.setClientPhone(searchContent);
		}else if(searchOption.equals("clientEmail")) {
			csc.setClientEmail(searchContent);
		}
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int clientCount = cs.getSearchClientListCount(csc);

		PageInfo pi = Pagination.getPageInfo(currentPage, clientCount);
		
		ArrayList<Member> searchClientList = cs.selectSearchClientList(csc, pi);
		
		model.addAttribute("check", "ok");
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchContent", searchContent);
		model.addAttribute("clientCount", clientCount);
		model.addAttribute("clientList", searchClientList);
		model.addAttribute("pi", pi);
		
		return "viewClientList";
		
	}
	@PostMapping("clientInfoUpdate.cl")
	public String updateClientInfo(String clientDetailMno, String clientDetailName, String clientDetailPhone, String clientDetailEmail, Model model) {
		
		Member client = new Member();
		client.setMno(Integer.parseInt(clientDetailMno));
		client.setUserName(clientDetailName);
		client.setEmail(clientDetailEmail);
		client.setPhone(clientDetailPhone);
		
		int result = cs.updateClientInfo(client);
		
		if(result > 0) {
			model.addAttribute("changeClient", client.getMno());
			return "redirect:/viewList.cl";
		}else {
			model.addAttribute("msg", "고객정보수정실패");
			return "common/errorPage";
		}
	}
	
	@GetMapping("viewBlackList.cl")
	public String goBlackList(HttpServletRequest request, Model model) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int blackListCount = cs.getBlackListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, blackListCount);
		
		ArrayList<Member> blackLists = cs.selectBlackLists(pi);
		
		model.addAttribute("blackListCount", blackListCount);
		model.addAttribute("blackLists", blackLists);
		model.addAttribute("pi", pi);
		
		return "blackList";
	}

	@PostMapping("addBlackList.cl")
	public String insertBlackList(String blackListMno,String blackListContent,String blackListRes,Model model) {
		
		BlackList blackList = new BlackList();
		blackList.setMno(Integer.parseInt(blackListMno));
		blackList.setRegRsn(blackListContent);
		blackList.setResponse(blackListRes);
		
		int result = cs.insertBlackList(blackList);
		
		if(result > 0) {
			return "redirect:/viewBlackList.cl";
		}else {
			model.addAttribute("msg", "블랙리스트 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("blackListDetail.cl")
	public ModelAndView blackListDetail(ModelAndView mv, String mno) {
		
		int blackListMno = Integer.parseInt(mno);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		// 고객 정보
		Member blackListInfo = cs.selectClientInfo(blackListMno);
		// 방문 횟수
		int visitCount = cs.selectVisitCount(blackListMno);
		// 매출
		int price = cs.selectTotalPrice(blackListMno);
		// 숙박일수
		int stayDay = cs.selectStayDay(blackListMno);
		// 최종방문일자
		Stay lastVisit = cs.selectLastVisit(blackListMno);
		String enddate;
		if(lastVisit != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			enddate = sdf.format(lastVisit.getCheckOut());
		}else {
			enddate = "기록없음";
		}
		
		ArrayList<BlackList> blackListContent = cs.selectBlackListContent(blackListMno);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String to;
		for(int i = 0; i < blackListContent.size(); i++) {
			to = sdf.format(blackListContent.get(i).getRegDate());
			blackListContent.get(i).setRegDate(null);
			blackListContent.get(i).setRegDate2(to);
		}
		
		
		hmap.put("visitCount",visitCount);
		hmap.put("blackListInfo", blackListInfo);
		hmap.put("price", price);
		hmap.put("stayDay", stayDay);
		hmap.put("lastVisit",enddate);
		hmap.put("blackListContent",blackListContent);

		mv.addObject("hmap", hmap);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@GetMapping("question.cl")
	public String goQuestion() {
		return "viewQuestion";
	}

}
