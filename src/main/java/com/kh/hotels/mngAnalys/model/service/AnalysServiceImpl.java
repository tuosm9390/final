package com.kh.hotels.mngAnalys.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngAnalys.model.dao.AnalysDao;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngStay.model.vo.Stay;

@Service
public class AnalysServiceImpl implements AnalysService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AnalysDao ad;
	
	@Override
	public ArrayList<SalesDetail> selectSalesDetailList(Map<String, String> map) {
		return ad.selectSalesDetailList(sqlSession, map);
	}

	@Override
	public ArrayList<SalesDetail> selectRsvList(Map<String, Object> map) {
		return ad.selectRsvList(sqlSession, map);
	}

	@Override
	public ArrayList<Stay> selectStayList(Map<String, Object> map) {
		return ad.selectStayList(sqlSession, map);
	}

}
