package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.stock.Stock;

@Repository
public class StockDaoImpl implements StockDao{

	@Override
	public ArrayList<Stock> selectStockList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectStockList");
	}

	@Override
	public int insertStock(SqlSessionTemplate sqlSession, Model m, Stock st) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Stock.insertStock");
	}

	@Override
	public ArrayList<Repair> selectRepairList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectRepairList");
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Stock.selectListCount");
	}

}
