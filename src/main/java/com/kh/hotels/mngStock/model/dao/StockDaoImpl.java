package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.hotels.mngApproval.model.vo.PageInfo;
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

	@Override
	public ArrayList<StockDetail> selectStockDetailList(SqlSessionTemplate sqlSession, String iname) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectStockDetailList",iname);
	}

}
