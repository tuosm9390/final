package com.kh.hotels.mngApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApproveController {
	
	@RequestMapping("documentApproval.ap")
	public String goApproval() {
		
		return "hoteladmin/mngApprove/allApprove";
	}
	@RequestMapping("writePurchaseApprove.ap")
	public String goWrite() {
		return "hoteladmin/mngApprove/writeApprove/writePurchaseApprove";
	}
	@RequestMapping("writeFixApprove")
	public String goWriteFixApprove() {
		
		return "hoteladmin/mngApprove/writeApprove/writeFixApprove";
	}
	@RequestMapping("writeOrderApprove")
	public String goWriteOrderApprove() {
		
		return "hoteladmin/mngApprove/writeApprove/writeOrderApprove";
	}
	@RequestMapping("allApproveDetail.ap")
	public String showApproveDetail() {
		
		return "hoteladmin/mngApprove/allApproveDetail";
	}
}
