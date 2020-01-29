package com.kh.hotels.mngClient.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngClient.model.dao.ClientDao;

@Service
public class ClientServiceImpl implements ClientService{

	@Autowired
	private ClientDao cd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getClientListCount() {

		return cd.getClientListCount(sqlSession);
	}
	

}

















