package com.kh.hotels.mngApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApproveController {
	
	@GetMapping("documentApproval.ap")
	public String goApproval() {
		
		return "hoteladmin/mngApprove/allApprove";
	}
	@GetMapping("writeApprove.ap")
	public String goWrite() {
		return "hoteladmin/mngApprove/writePurchaseApprove";
	}
	@GetMapping("writeFixApprove")
	public String goWriteFixApprove() {
		
		return "hoteladmin/mngApprove/writeFixApprove";
	}
	@GetMapping("writeOrderApprove")
	public String goWriteOrderApprove() {
		
		return "hoteladmin/mngApprove/writeOrderApprove";
	}
	@GetMapping("allApproveDetail.ap")
	public String showApproveDetail() {
		
		return "hoteladmin/mngApprove/allApproveDetail";
	}
}
