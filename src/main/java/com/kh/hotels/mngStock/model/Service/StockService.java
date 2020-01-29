package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.StockDetail;
import com.kh.hotels.mngStock.model.vo.Strg;


public interface StockService {


	int insertStock(Model m, Stock st);

	ArrayList<Repair> selectRepairList();

	ArrayList<Stock> selectStockList(PageInfo pi);

	int getListCount();

	ArrayList<StockDetail> stockDetailList(String iname);

}
