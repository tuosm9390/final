package com.kh.hotels.mngClient.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.hotel.controller.Pagination;
import com.kh.hotels.mngClient.model.service.ClientService;
import com.kh.hotels.mngMember.model.vo.Member;

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
		
		//PageInfo pi = new PageInfo(currentPage, clientCount); 
//		
//		BoardService bs = new BoardServiceImpl();
//		try {
//			int listCount = bs.getListCount();
//			
//			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//			
//			ArrayList<Board> list = bs.selectBoardList(pi);
//			
//			request.setAttribute("list", list);
//			request.setAttribute("pi", pi);
//			
//			request.getRequestDispatcher("WEB-INF/views/board/boardList.jsp").forward(request, response);
//			
//		} catch (BoardSelectListException e) {
//			request.setAttribute("message", e.getMessage());
//			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
//		}
//		
		
		
		return "viewClientList";
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
