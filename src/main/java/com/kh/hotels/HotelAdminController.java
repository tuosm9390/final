package com.kh.hotels;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HotelAdminController {

	@GetMapping("goMain.hadmin")
	public String showHotelAdmin() {
		
		return "hoteladmin/main/main";
	}
	

	@GetMapping("goMateriel.hadmin")
	public String showMateriel() {
		
		return "hoteladmin/stockMng/MaterielMng";
		
	}

	@RequestMapping("viewTrendList.hadmin")
	public String goAnalys(@RequestParam("Condition") String Condition, HttpServletRequest request) {
		
		request.setAttribute("Condition", Condition);
		
		return "hoteladmin/mngAnalys/trend";
	}

}
