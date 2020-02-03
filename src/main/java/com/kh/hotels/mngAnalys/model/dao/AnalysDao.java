package com.kh.hotels.mngAnalys.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngStay.model.vo.Stay;

public interface AnalysDao {

	ArrayList<SalesDetail> selectSalesDetailList(SqlSessionTemplate sqlSession, Map<String, String> map);

	ArrayList<SalesDetail> selectRsvList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	ArrayList<Stay> selectStayList(SqlSessionTemplate sqlSession, Map<String, Object> map);

}
