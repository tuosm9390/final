package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.dao.StockDao;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.His;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.SearchItem;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.StockDetail;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.StrgArea;


@Service
public class StockServiceImpl implements StockService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StockDao sd;
	
	@Override
	public ArrayList<Stock> selectStockList(PageInfo pi) {
		// TODO Auto-generated method stub
		return sd.selectStockList(sqlSession,pi);
	}

	@Override
	public int insertStock(Model m, Stock st) {
		int result=0;
		
		
		int result1 = sd.insertStock(sqlSession,m,st);
		
		int result2 = sd.insertStockHis(sqlSession,m,st);
		
		if(result1 > 0 && result2 > 0 ) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public ArrayList<Repair> selectRepairList() {
		// TODO Auto-generated method stub
		return sd.selectRepairList(sqlSession);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return sd.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Stock> stockDetailList(String iName) {
		// TODO Auto-generated method stub
		return sd.selectStockDetailList(sqlSession,iName);
	}

	@Override
	public ArrayList<ItemType> categoryList(ItemType it) {
		// TODO Auto-generated method stub
		return sd.selectCategoryList(sqlSession,it);
	}

	@Override
	public int insertCategory(ItemType it) {
		// TODO Auto-generated method stub
		return sd.insertCategory(sqlSession,it);
	}

	@Override
	public ArrayList<ItemType> selectScategory() {
		// TODO Auto-generated method stub
		return sd.selectScategory(sqlSession);
	}

	@Override
	public ArrayList<Conn> selectCnName(int typeNo) {
		// TODO Auto-generated method stub
		return sd.selectCnName(sqlSession,typeNo); 
	}

	@Override
	public int deleteStock(int check) {
		// TODO Auto-generated method stub
		return sd.deleteStock(sqlSession,check);
	}

	@Override
	public ArrayList<Item> selectRmNoList() {
		// TODO Auto-generated method stub
		return sd.selectRmNoList(sqlSession);
	}

	@Override
	public int updateStockOk(Stock st) {
		// TODO Auto-generated method stub
		return sd.updateStockOk(sqlSession,st); 
	}

	@Override
	public int updateStockHis(His h) {
		// TODO Auto-generated method stub
		return sd.updateStockHis(sqlSession,h);
	}

	@Override
	public int deleteStockHis(His h) {
		// TODO Auto-generated method stub
		return sd.deleteStockHis(sqlSession,h);
	}

	@Override
	public ArrayList<Stock> serachList(SearchItem s) {
		// TODO Auto-generated method stub
		return sd.searchList(sqlSession,s);
	}

	@Override
	public int getRepairListCount() {
		// TODO Auto-generated method stub
		return sd.getRepairListCount(sqlSession);
	}

	@Override
	public ArrayList<Repair> repairList(PageInfo pi) {
		// TODO Auto-generated method stub
		return sd.getRepairList(sqlSession,pi);
	}

	





	


	
	
	

}
