package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.StrgArea;


public interface StockService {


	int insertStock(Model m, Stock st);

	ArrayList<Repair> selectRepairList();

	ArrayList<Stock> selectStockList(PageInfo pi);

	int getListCount();

	ArrayList<Stock> stockDetailList(String iName);

	ArrayList<ItemType> categoryList(ItemType it);

	int insertCategory(ItemType it);

	ArrayList<ItemType> selectScategory();

	ArrayList<Conn> selectCnName(int typeNo);

	int deleteStock(int check);

	ArrayList<Item> selectRmNoList();



	

}
