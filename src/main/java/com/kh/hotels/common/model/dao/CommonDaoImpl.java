package com.kh.hotels.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class CommonDaoImpl implements CommonDao{


	@Override
	public int selectHotelInfoCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Common.selectHotelInfoCount");
	}
	
}
