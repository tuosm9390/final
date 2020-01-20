package com.kh.hotels.mngReserv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservController {
	
	@GetMapping("viewNow.re")
	public String goReservNow() {
		return "viewReservNow";
	}

	@GetMapping("viewHis.re")
	public String goReservHis() {
		return "viewReservHis";
	}

}
