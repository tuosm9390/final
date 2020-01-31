package com.kh.hotels.mngClient.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.ClientSearchCondition;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.Reservation;
import com.kh.hotels.mngStay.model.vo.Stay;

public interface ClientDao {

	int getClientListCount(SqlSessionTemplate sqlSession);

	ArrayList<Member> selectClientList(PageInfo pi, SqlSessionTemplate sqlSession);

	int updateClientStatus(int[] mnos, SqlSessionTemplate sqlSession);

	Member selectClientInfo(int clientMno, SqlSessionTemplate sqlSession);

	int selectVisitCount(int clientMno, SqlSessionTemplate sqlSession);

	int selectTotalPrice(int clientMno, SqlSessionTemplate sqlSession);

	int selectStayDay(int clientMno, SqlSessionTemplate sqlSession);

	Stay selectLastVisit(int clientMno, SqlSessionTemplate sqlSession);

	ArrayList<Que> selectClientQue(int clientMno, SqlSessionTemplate sqlSession);

	ArrayList<Reservation> selectRsvList(int clientMno, SqlSessionTemplate sqlSession);

	ArrayList<Stay> selectStayList(int clientMno, SqlSessionTemplate sqlSession);

	int getSearchClientListCount(ClientSearchCondition csc, SqlSessionTemplate sqlSession);

	ArrayList<Member> selectSearchClientList(SqlSessionTemplate sqlSession, ClientSearchCondition csc, PageInfo pi);

}
