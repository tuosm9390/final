package com.kh.hotels.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.common.model.dao.CommonDao;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommonDao cd;

	@Override
	public int selectHotelInfoCount() {
		
		return cd.selectHotelInfoCount(sqlSession);
	}
	

}
