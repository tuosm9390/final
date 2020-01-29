package com.kh.hotels.mngClient.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface ClientDao {

	int getClientListCount(SqlSessionTemplate sqlSession);

}
