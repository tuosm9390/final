package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;

public interface AccountDao {

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<Conn> selectAccountList(SqlSessionTemplate sqlSession, PageInfo pi);
 
	ArrayList<Conn> selectDetailList(SqlSessionTemplate sqlSession, String cnCode);

	int insertAcc(SqlSessionTemplate sqlSession, Conn c);
 
	int insertAccDetail(SqlSessionTemplate sqlSession, Conn c);

	int updateDetail(SqlSessionTemplate sqlSession, Conn c);

	int updateAcc(SqlSessionTemplate sqlSession, Conn c);

}
