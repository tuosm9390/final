package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.dao.AccountDao;
import com.kh.hotels.mngStock.model.vo.Conn;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AccountDao ad;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return ad.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Conn> selectAccountList(PageInfo pi) {
		// TODO Auto-generated method stub
		return ad.selectAccountList(sqlSession,pi);
	}

}
