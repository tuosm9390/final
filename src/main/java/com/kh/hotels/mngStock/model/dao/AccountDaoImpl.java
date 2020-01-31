package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;

@Repository
public class AccountDaoImpl implements AccountDao{

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Account.selectListCount");
	}

	@Override
	public ArrayList<Conn> selectAccountList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("Account.selectAccountList",null,rowBounds);
	}

}
