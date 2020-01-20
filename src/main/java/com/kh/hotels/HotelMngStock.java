package com.kh.hotels;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HotelMngStock {

	@GetMapping("goStockNow.st")
	public String showStockNow() {
		
		return "hoteladmin/mngStock/stock/stockNow";
	}
	
	
	@GetMapping("goPurchaseHis.st")
	public String showPurchaseHis() {
		
		return "hoteladmin/mngStock/stock/purchaseHis";
	}
	
	@GetMapping("goStockHis.st")
	public String showStockHis() {
		
		return "hoteladmin/mngStock/stock/stockHis";
	}
	
	@GetMapping("goAccount.st")
	public String showAccount() {
		
		return "hoteladmin/mngStock/account/account";
	}
	
	@GetMapping("goWarehouse.st")
	public String showWarehouse() {
		
		return "hoteladmin/mngStock/warehouse/warehouse";
	}
	
	@GetMapping("goRepairRequest.st")
	public String showRepairRequest() {
		
		return "hoteladmin/mngStock/stock/repairRequest";
	}
}
