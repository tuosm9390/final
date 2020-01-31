package com.kh.hotels.mngAnalys.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngAnalys.model.vo.SalesDetail;

@Repository
public class AnalysDaoImpl implements AnalysDao{

	@Override
	public ArrayList<SalesDetail> selectSalesDetailList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectSalesDetailList", map);
	}

}
