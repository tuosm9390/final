package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.His;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemHistory;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.RepHistory;
import com.kh.hotels.mngStock.model.vo.OrderHis;
import com.kh.hotels.mngStock.model.vo.OrderHisDetail;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.SearchItem;
import com.kh.hotels.mngStock.model.vo.Stock;


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

	int updateStockOk(Stock st);

	int updateStockHis(His h);

	int deleteStockHis(His h);

	ArrayList<Stock> serachList(SearchItem s);

	int getRepairListCount();


	int getPurchaseHisListCount();

	ArrayList<OrderHis> selectOrderHisList(PageInfo pi);

	ArrayList<OrderHis> selectOrderHisInfoList();

	ArrayList<OrderHisDetail> selectOrderHisDetail(int reportNo);

	int insertCheckItem(ArrayList<OrderHisDetail> orderHisDetailList);

	int updateOrderHisStatus(int reportNo);

	ArrayList<RepHistory> repairList(PageInfo pi);

	ArrayList<HashMap<String, Object>> selectRepairDetail(RepHistory rHistory);

	String selectReceiver(int receiver);

	int getStockHisList();

	ArrayList<ItemHistory> stockHisList();

	ItemHistory itemHis();

	int getSearchCount(SearchItem s);

	ArrayList<Stock> selectSearchList(SearchItem s, PageInfo pi);


	

}
