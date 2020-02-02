package com.kh.hotels.mngAnalys.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngAnalys.model.vo.SalesDetail;

public interface AnalysDao {

	ArrayList<SalesDetail> selectSalesDetailList(SqlSessionTemplate sqlSession, Map<String, String> map);

}
