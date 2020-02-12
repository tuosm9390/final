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

	@Override
	public ArrayList<Conn> selectDetailList(String cnCode) {
		// TODO Auto-generated method stub
		return ad.selectDetailList(sqlSession,cnCode);
	}

	@Override
	public int insertAcc(Conn c) {
		// TODO Auto-generated method stub
		return ad.insertAcc(sqlSession,c);
	}

	@Override
	public int insertDetailAcc(Conn c) {
		// TODO Auto-generated method stub
		return ad.insertAccDetail(sqlSession,c);
	}

	@Override
	public int updateDetail(Conn c) {
		// TODO Auto-generated method stub
		return ad.updateDetail(sqlSession,c);
	}

	@Override
	public int updateAcc(Conn c) {
		// TODO Auto-generated method stub
		return ad.updateAcc(sqlSession,c);
	}
    
}
