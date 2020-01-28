package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.stock.Stock;

public interface StockDao {

	ArrayList<Stock> selectStockList(SqlSessionTemplate sqlSession);

	int insertStock(SqlSessionTemplate sqlSession, Model m, Stock st);

	ArrayList<Repair> selectRepairList(SqlSessionTemplate sqlSession);

	int getListCount(SqlSessionTemplate sqlSession);

}
