package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.kh.hotels.mngStock.model.vo.SearchCondition;
import com.kh.hotels.mngStock.model.vo.Strg;

public interface warehouseDao {

	int insertWarehouse(SqlSessionTemplate sqlSession, Model m, Strg st);

	ArrayList<Strg> selectList(SqlSessionTemplate sqlSession);

	ArrayList<Strg> searchList(SqlSessionTemplate sqlSession, SearchCondition sc);

}
