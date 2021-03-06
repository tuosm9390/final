package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
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


public interface StockDao {

	ArrayList<Stock> selectStockList(SqlSessionTemplate sqlSession, PageInfo pi);
 
	int insertStock(SqlSessionTemplate sqlSession, Model m, Stock st);

	ArrayList<Repair> selectRepairList(SqlSessionTemplate sqlSession);

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<Stock> selectStockDetailList(SqlSessionTemplate sqlSession, String iName);

	ArrayList<ItemType> selectCategoryList(SqlSessionTemplate sqlSession, ItemType it);

	int insertCategory(SqlSessionTemplate sqlSession, ItemType it);


	ArrayList<ItemType> selectScategory(SqlSessionTemplate sqlSession);

	ArrayList<Conn> selectCnName(SqlSessionTemplate sqlSession, int typeNo);

	int deleteStock(SqlSessionTemplate sqlSession, int check);

	ArrayList<Item> selectRmNoList(SqlSessionTemplate sqlSession);

	int insertStockHis(SqlSessionTemplate sqlSession, Model m, Stock st);

	int updateStockOk(SqlSessionTemplate sqlSession, Stock st);

	int updateStockHis(SqlSessionTemplate sqlSession, His h);

	int deleteStockHis(SqlSessionTemplate sqlSession, His h);

	ArrayList<Stock> searchList(SqlSessionTemplate sqlSession, SearchItem s);

	int getRepairListCount(SqlSessionTemplate sqlSession);


	int getPurchaseHisListCount(SqlSessionTemplate sqlSession);

	ArrayList<OrderHis> selectOrderHisList(PageInfo pi, SqlSessionTemplate sqlSession);

	ArrayList<OrderHis> selectOrderHisInfoList(SqlSessionTemplate sqlSession);

	ArrayList<OrderHisDetail> selectOrderHisDetail(int reportNo, SqlSessionTemplate sqlSession);

	ArrayList<Item> selectItemList(SqlSessionTemplate sqlSession, ArrayList<OrderHisDetail> orderHisDetailList);

	int insertItemList(SqlSessionTemplate sqlSession, ArrayList<Item> itemList);

	int updateOrderHisStatus(SqlSessionTemplate sqlSession, int reportNo);

	int getSearchStockListCount(SqlSessionTemplate sqlSession);
	
	ArrayList<RepHistory> getRepairList(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<String> selectRepairInfo(SqlSessionTemplate sqlSession, ArrayList<RepHistory> repList);

	ArrayList<HashMap<String, Object>> selectRepairDetail(SqlSessionTemplate sqlSession, RepHistory rHistory);

	String selectReceiverName(SqlSessionTemplate sqlSession, int receiver);

	int getStockHisCount(SqlSessionTemplate sqlSession);

	ArrayList<ItemHistory> getstockHisList(SqlSessionTemplate sqlSession);

	ItemHistory getItemHis(SqlSessionTemplate sqlSession);

	int getSearchCount(SqlSessionTemplate sqlSession, SearchItem s);

	ArrayList<Stock> selectSearchList(SqlSessionTemplate sqlSession, SearchItem s, PageInfo pi);


}
