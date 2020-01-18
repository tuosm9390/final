package com.kh.hotels.mngMember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
			
			return "index";
		} catch (LoginException e) {
			
			model.addAttribute("msg", e.getMessage());
			
			return "index";
		}
		
	}
	
}
