package com.kh.hotels.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface CommonDao {

	int selectHotelInfoCount(SqlSessionTemplate sqlSession);

}
