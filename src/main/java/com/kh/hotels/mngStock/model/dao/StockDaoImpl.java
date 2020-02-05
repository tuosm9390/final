package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.StockDetail;
import com.kh.hotels.mngStock.model.vo.Strg;


@Repository
public class StockDaoImpl implements StockDao{

	@Override
	public ArrayList<Stock> selectStockList(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Stock.selectStockList", null, rowBounds);
	}

	@Override
	public int insertStock(SqlSessionTemplate sqlSession, Model m, Stock st) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Stock.insertStock",st);
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

	@Override
	public ArrayList<Stock> selectStockDetailList(SqlSessionTemplate sqlSession, String iName) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectStockDetailList", iName);
	}

	@Override
	public ArrayList<ItemType> selectCategoryList(SqlSessionTemplate sqlSession, ItemType it) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectCategoryList",it);
	}

	@Override
	public int insertCategory(SqlSessionTemplate sqlSession, ItemType it) {
		System.out.println(it);
		return sqlSession.insert("Stock.insertCategory",it);
	}

	@Override
	public ArrayList<ItemType> selectScategory(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectScategory");
	}


	@Override
	public ArrayList<Conn> selectCnName(SqlSessionTemplate sqlSession,int typeNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectCnName",typeNo);
	}

	@Override
	public int deleteStock(SqlSessionTemplate sqlSession, int check) {
		// TODO Auto-generated method stub
		return sqlSession.update("Stock.deleteStock",check);
	}

	@Override
	public ArrayList<Item> selectRmNoList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectRmNoList");
	}

	@Override
	public int insertStockHis(SqlSessionTemplate sqlSession, Model m, Stock st) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Stock.insertStockHis",st);
	}


}
