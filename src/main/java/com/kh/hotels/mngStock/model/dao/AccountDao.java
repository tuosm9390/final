package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;

public interface AccountDao {

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<Conn> selectAccountList(SqlSessionTemplate sqlSession, PageInfo pi);

}
