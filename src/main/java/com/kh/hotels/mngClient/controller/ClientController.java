package com.kh.hotels.mngClient.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.mngClient.model.service.ClientService;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngStay.model.vo.Stay;

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
		
		
		hmap.put("visitCount",visitCount);
		hmap.put("clientInfo", clientInfo);
		hmap.put("price", price);
		hmap.put("stayDay", stayDay);
		hmap.put("lastVisit",enddate);

		mv.addObject("hmap", hmap);
		mv.setViewName("jsonView");
		
		return mv;
	}

	@GetMapping("viewBlackList.cl")
	public String goBlackList() {
		return "blackList";
	}

	@GetMapping("question.cl")
	public String goQuestion() {
		return "viewQuestion";
	}

}
