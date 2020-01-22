package com.kh.hotels.mngApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApproveController {
	
	@RequestMapping("documentApproval.ap")
	public String goApproval() {
		
		return "hoteladmin/mngApprove/ApproveList/allApprove";
	}
	@RequestMapping("joinDocumentApproval.ap")
	public String goJoinApproval() {
		
		return "hoteladmin/mngApprove/ApproveList/partiApprove";
	}
	
	
	@RequestMapping("writeApprove.ap")
	public String gowrite() {
		return "hoteladmin/mngApprove/writeApprove/writePurchaseApprove";
	}
	@RequestMapping("writePurchaseApprove.ap")
	public String goWrite() {
		return "hoteladmin/mngApprove/writeApprove/writePurchaseApprove";
	}
	@RequestMapping("writeFixApprove.ap")
	public String goWriteFixApprove() {
		
		return "hoteladmin/mngApprove/writeApprove/writeFixApprove";
	}
	@RequestMapping("writeOrderApprove.ap")
	public String goWriteOrderApprove() {
		
		return "hoteladmin/mngApprove/writeApprove/writeOrderApprove";
	}
	@RequestMapping("allApproveDetail.ap")
	public String showApproveDetail() {
		
		return "hoteladmin/mngApprove/allApproveDetail";
	}
	@RequestMapping("writeAllApprove.ap")
	public String showWriteAll() {
		
		return "hoteladmin/mngApprove/writeApprove/writeAllApprove";
	}
	
}
