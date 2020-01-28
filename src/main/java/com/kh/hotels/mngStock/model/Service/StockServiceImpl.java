package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.dao.StockDao;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.stock.Stock;

@Service
public class StockServiceImpl implements StockService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StockDao sd;
	
	@Override
	public ArrayList<Stock> selectStockList(PageInfo pi) {
		// TODO Auto-generated method stub
		return sd.selectStockList(sqlSession);
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
	
	
	

}
