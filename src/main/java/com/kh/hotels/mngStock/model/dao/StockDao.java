package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.His;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.StockDetail;
import com.kh.hotels.mngStock.model.vo.Strg;


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





}
