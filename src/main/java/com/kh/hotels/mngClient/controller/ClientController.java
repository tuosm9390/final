package com.kh.hotels.mngClient.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClientController {
	
	@GetMapping("viewList.cl")
	public String goClientList() {
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
