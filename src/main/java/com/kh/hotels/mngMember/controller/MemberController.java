package com.kh.hotels.mngMember.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hotels.mngMember.model.exception.LoginException;
import com.kh.hotels.mngMember.model.service.MemberService;
import com.kh.hotels.mngMember.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;

	@PostMapping("login.me")
	public String loginMember(Member m, Model model) {
		
		Member loginUser;
		
		try {
			loginUser = ms.loginMember(m);
			
			model.addAttribute("loginUser", loginUser);
			
			return "hoteladmin/main/main";
		} catch (LoginException e) {
			
			model.addAttribute("msg", "등록된 계정이 아닙니다.");
			
			return "index";
		}
		
	}
	
	@PostMapping("idCheck.me")
	public void idCheck(@RequestParam String userId, HttpServletResponse response) {
		
		int result = ms.selectMemberId(userId);
		
		if(result > 0) {
			try {
				response.getWriter().append("success");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				response.getWriter().append("fail");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	@PostMapping("insertMember.me")
	public String insertMember(Member m, HttpServletRequest request) {
		
		int result = ms.insertMember(m);
		
		if(result > 0) {
			return "redirect:index.jsp";
		}else {
			request.setAttribute("msg", "회원가입실패");
			return "";
		}
		
	}
	
}
