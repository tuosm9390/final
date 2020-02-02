package com.kh.hotels.mngClient.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.BlackList;
import com.kh.hotels.mngClient.model.vo.ClientSearchCondition;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngClient.model.vo.QueFilter;
import com.kh.hotels.mngClient.model.vo.QueModal;
import com.kh.hotels.mngClient.model.vo.QueSearchCondition;
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

	int updateClientInfo(Member client, SqlSessionTemplate sqlSession);

	int getBlackListCount(SqlSessionTemplate sqlSession);

	ArrayList<Member> selectBlackLists(PageInfo pi, SqlSessionTemplate sqlSession);

	int insertBlackList(BlackList blackList, SqlSessionTemplate sqlSession);

	ArrayList<BlackList> selectBlackListContent(int blackListMno, SqlSessionTemplate sqlSession);

	int updateBlackListStatus(String[] mnos, SqlSessionTemplate sqlSession);

	int getSearchBlackListCount(ClientSearchCondition csc, SqlSessionTemplate sqlSession);

	ArrayList<Member> selectSearchBlackLists(ClientSearchCondition csc, PageInfo pi, SqlSessionTemplate sqlSession);

	int getQueListCount(SqlSessionTemplate sqlSession);

	ArrayList<Que> selectQueList(PageInfo pi, SqlSessionTemplate sqlSession);

	ArrayList<Que> selectFilterQueList(PageInfo pi, QueFilter queFilter, SqlSessionTemplate sqlSession);

	int getFilterQueListCount(SqlSessionTemplate sqlSession, QueFilter queFilter);

	QueModal selectQueDetail(Que que, SqlSessionTemplate sqlSession);

	int insertQue(Que que, SqlSessionTemplate sqlSession);

	int insertOfflineMember(Que que, SqlSessionTemplate sqlSession);

	int selectOfflineMember(Que que, SqlSessionTemplate sqlSession);

	int selectQueNo(Que que, SqlSessionTemplate sqlSession);

	int insertAns(Que que, SqlSessionTemplate sqlSession);

	int insertAnswer(Que que, SqlSessionTemplate sqlSession);

	int updateQueAns(Que que, SqlSessionTemplate sqlSession);

	int getSearchQueCount(QueSearchCondition qsc, SqlSessionTemplate sqlSession);

	ArrayList<Que> selectSearchQueList(QueSearchCondition qsc, PageInfo pi, SqlSessionTemplate sqlSession);

}
