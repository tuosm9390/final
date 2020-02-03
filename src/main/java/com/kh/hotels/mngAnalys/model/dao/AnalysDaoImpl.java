package com.kh.hotels.mngAnalys.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngStay.model.vo.Stay;

@Repository
public class AnalysDaoImpl implements AnalysDao{

	@Override
	public ArrayList<SalesDetail> selectSalesDetailList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		
		System.out.println(map.get("startDate"));
		return (ArrayList)sqlSession.selectList("Analys.selectSalesDetailList", map);
	}

	@Override
	public ArrayList<SalesDetail> selectRsvList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectRsvList", map);
	}

	@Override
	public ArrayList<Stay> selectStayList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectStayList", map);
	}

}
