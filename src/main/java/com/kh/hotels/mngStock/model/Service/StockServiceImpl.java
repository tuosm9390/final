package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.dao.StockDao;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.StockDetail;
import com.kh.hotels.mngStock.model.vo.Strg;


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
		// TODO Auto-generated method stub
		return sd.insertStock(sqlSession,m,st);
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


	
	
	

}
