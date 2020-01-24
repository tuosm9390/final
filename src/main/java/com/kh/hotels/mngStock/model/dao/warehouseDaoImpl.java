package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.hotels.mngStock.model.vo.SearchCondition;
import com.kh.hotels.mngStock.model.vo.Strg;

@Repository
public class warehouseDaoImpl implements warehouseDao{

	@Override
	public int insertWarehouse(SqlSessionTemplate sqlSession, Model m, Strg st) {
		
		System.out.println("dao  m :  " + m);
		
		return sqlSession.insert("Strg.insertWarehouse", st);
	}

	@Override
	public ArrayList<Strg> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Strg.selectList");
	}

	@Override
	public ArrayList<Strg> searchList(SqlSessionTemplate sqlSession, SearchCondition sc) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Strg.searchList",sc);
	}

}
