package com.kh.hotels.mngAnalys.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngAnalys.model.dao.AnalysDao;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;

@Service
public class AnalysServiceImpl implements AnalysService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AnalysDao hd;
	
	@Override
	public ArrayList<SalesDetail> selectSalesDetailList(Map<String, String> map) {
		return hd.selectSalesDetailList(sqlSession, map);
	}

}
