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
import com.kh.hotels.mngClient.model.vo.QueFilter;
import com.kh.hotels.mngClient.model.vo.QueModal;
import com.kh.hotels.mngClient.model.vo.QueSearchCondition;
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
	
	@RequestMapping("deleteBlackList.cl")
	public String deleteBlackList(String mno, Model model) {
		
		String[] mnos = mno.split(",");
		
		int result = cs.updateBlackListStatus(mnos);
		
		if(result > 0) {
			return "redirect:/viewBlackList.cl";
		}else {
			model.addAttribute("msg", "블랙리스트 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("searchBlackList.cl")
	public String selectSearchBlackList(String searchOption, String searchContent, HttpServletRequest request, Model model) {
		
		ClientSearchCondition csc = new ClientSearchCondition();
		
		if(searchOption.equals("blackListName")) {
			csc.setClientName(searchContent);
		}else if(searchOption.equals("blackListPhone")){
			csc.setClientPhone(searchContent);
		}else if(searchOption.equals("blackListEmail")) {
			csc.setClientEmail(searchContent);
		}
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int blackListCount = cs.getSearchBlackListCount(csc);

		PageInfo pi = Pagination.getPageInfo(currentPage, blackListCount);
		
		ArrayList<Member> blackLists = cs.selectSearchBlackLists(csc, pi);
		
		model.addAttribute("check", "ok");
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchContent", searchContent);
		model.addAttribute("blackListCount", blackListCount);
		model.addAttribute("blackLists", blackLists);
		model.addAttribute("pi", pi);
		
		return "blackList";
		
	}
	
	@GetMapping("question.cl")
	public String goQuestion(Model model, HttpServletRequest request) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String qdate;
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int QueCount = cs.getQueListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, QueCount);
		
		ArrayList<Que> queList = cs.selectQueList(pi);
		
		for(int i = 0; i < queList.size(); i++) {
			qdate = sdf.format(queList.get(i).getQdate());
			queList.get(i).setQdate(null);
			queList.get(i).setQdateView(qdate);
			if(queList.get(i).getQtype().equals("ROOM")) {
				queList.get(i).setQtype("객실");
			}else if(queList.get(i).getQtype().equals("SERVICE")) {
				queList.get(i).setQtype("서비스");
			}else if(queList.get(i).getQtype().equals("RESERVE")) {
				queList.get(i).setQtype("예약");
			}else if(queList.get(i).getQtype().equals("ETC")) {
				queList.get(i).setQtype("기타");
			}
			if(queList.get(i).getAnsStatus().equals("Y")) {
				queList.get(i).setAnsStatus("답변완료");
			}else if(queList.get(i).getAnsStatus().equals("N")) {
				queList.get(i).setAnsStatus("미답변");
			}
		}
		
		model.addAttribute("queList", queList);
		model.addAttribute("pi", pi);
		
		return "viewQuestion";
	}
	
	@RequestMapping("queFilter.cl")
	public String queFilter(String filterType, Model model, HttpServletRequest request) {
		
		QueFilter queFilter = new QueFilter();
		
		if(filterType.equals("on")) {
			queFilter.setOnline(filterType);
		}else if(filterType.equals("off")) {
			queFilter.setOffline(filterType);
		}else if(filterType.equals("unQue")) {
			queFilter.setUnQue(filterType);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String qdate;
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int QueCount = cs.getFilterQueListCount(queFilter);

		PageInfo pi = Pagination.getPageInfo(currentPage, QueCount);
		
		ArrayList<Que> queList = cs.selectFilterQueList(pi, queFilter);
		
		for(int i = 0; i < queList.size(); i++) {
			qdate = sdf.format(queList.get(i).getQdate());
			queList.get(i).setQdate(null);
			queList.get(i).setQdateView(qdate);
			if(queList.get(i).getQtype().equals("ROOM")) {
				queList.get(i).setQtype("객실");
			}else if(queList.get(i).getQtype().equals("SERVICE")) {
				queList.get(i).setQtype("서비스");
			}else if(queList.get(i).getQtype().equals("RESERVE")) {
				queList.get(i).setQtype("예약");
			}else if(queList.get(i).getQtype().equals("ETC")) {
				queList.get(i).setQtype("기타");
			}
			if(queList.get(i).getAnsStatus().equals("Y")) {
				queList.get(i).setAnsStatus("답변완료");
			}else if(queList.get(i).getAnsStatus().equals("N")) {
				queList.get(i).setAnsStatus("미답변");
			}
		}
		
		model.addAttribute("filterType", filterType);
		model.addAttribute("queList", queList);
		model.addAttribute("pi", pi);
		
		return "viewQuestion";
	}
	
	@PostMapping("queDetail.cl")
	public ModelAndView queDetailModal(String qno, String mno, ModelAndView mv) {
		
		int mnoInt = Integer.parseInt(mno);
		int qnoInt = Integer.parseInt(qno);
		
		Que que = new Que();
		que.setMno(mnoInt);
		que.setQno(qnoInt);
		
		QueModal queModal = cs.selectQueDetail(que);
		if(queModal.getQtype().equals("ETC")) {
			queModal.setQtype("기타");
		}else if(queModal.getQtype().equals("RESERVE")) {
			queModal.setQtype("예약");
		}else if(queModal.getQtype().equals("ROOM")) {
			queModal.setQtype("객실");
		}else if(queModal.getQtype().equals("SERVICE")) {
			queModal.setQtype("서비스");
		}
		mv.addObject("queModal", queModal);
		mv.setViewName("jsonView");
		
		System.out.println(queModal);
		
		return mv;
	}
	
	@PostMapping("insertQue.cl")
	public String insertQue(String queType, String queName, String quePhone, String queTitle, String queContent, String queAnswer, String hotelMno, Model model) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date date = new Date();
		String offlineMemberDate = sdf.format(date);
		
		Que que = new Que();
		que.setHotelMno(Integer.parseInt(hotelMno));
		que.setQtype(queType);
		que.setUserName(queName);
		que.setPhone(quePhone);
		que.setQtitle(queTitle);
		que.setQcontent(queContent);
		que.setQueAnswer(queAnswer);
		que.setQueOfflineDate(offlineMemberDate + "전화문의고객");
		
		int result = 0;
		
		int result1 = cs.insertOfflineMember(que);
		
		int mno = cs.selectOfflineMember(que);
		que.setMno(mno);
		
		int result2 = cs.insertQue(que);
		
		int qno = cs.selectQueNo(que);
		que.setQno(qno);
		
		int result3 = cs.insertAns(que);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		if(result > 0) {
			return "redirect:/question.cl";
		}else {
			model.addAttribute("msg", "오프라인 고객문의 등록 실패");
			return "common/errorPage";
		}
		
	}
	@PostMapping("saveAnswer.cl")
	public String saveAnswer(String qno, String acontent, String mno, Model model) {
		
		Que que = new Que();
		que.setQno(Integer.parseInt(qno));
		que.setQueAnswer(acontent);
		que.setMno(Integer.parseInt(mno));
		
		int result = cs.insertAnswer(que);
		
		if(result > 0) {
			return "redirect:/question.cl";
		}else {
			model.addAttribute("msg", "답변등록실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("searchQue.cl")
	public String searchQue(HttpServletRequest request, Model model, String searchOption, String searchContent) {
		
		QueSearchCondition qsc = new QueSearchCondition();
		
		if(searchOption.equals("clientName")) {
			qsc.setClientName(searchContent);
		}else if(searchOption.equals("clientPhone")){
			qsc.setClientPhone(searchContent);
		}else if(searchOption.equals("queTitle")) {
			qsc.setQueTitle(searchContent);
		}else if(searchOption.equals("queType")) {
			qsc.setQueType(searchContent);
		}
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int queCount = cs.getSearchQueCount(qsc);

		PageInfo pi = Pagination.getPageInfo(currentPage, queCount);
		
		ArrayList<Que> queList = cs.selectSearchQueList(qsc, pi);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String qdate;
		
		for(int i = 0; i < queList.size(); i++) {
			qdate = sdf.format(queList.get(i).getQdate());
			queList.get(i).setQdate(null);
			queList.get(i).setQdateView(qdate);
			if(queList.get(i).getQtype().equals("ROOM")) {
				queList.get(i).setQtype("객실");
			}else if(queList.get(i).getQtype().equals("SERVICE")) {
				queList.get(i).setQtype("서비스");
			}else if(queList.get(i).getQtype().equals("RESERVE")) {
				queList.get(i).setQtype("예약");
			}else if(queList.get(i).getQtype().equals("ETC")) {
				queList.get(i).setQtype("기타");
			}
			if(queList.get(i).getAnsStatus().equals("Y")) {
				queList.get(i).setAnsStatus("답변완료");
			}else if(queList.get(i).getAnsStatus().equals("N")) {
				queList.get(i).setAnsStatus("미답변");
			}
		}
		model.addAttribute("check", "ok");
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchContent", searchContent);
		model.addAttribute("queCount", queCount);
		model.addAttribute("queList", queList);
		model.addAttribute("pi", pi);
		
		return "viewQuestion";
	}
}
