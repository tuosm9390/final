package com.kh.hotels.mngClient.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDaoImpl implements ClientDao {

	@Override
	public int getClientListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.getClientListCount");
	}

}
