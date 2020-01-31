package com.kh.hotels.mngClient.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.BlackList;
import com.kh.hotels.mngClient.model.vo.ClientSearchCondition;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.Reservation;
import com.kh.hotels.mngStay.model.vo.Stay;

@Repository
public class ClientDaoImpl implements ClientDao {

	@Override
	public int getClientListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.getClientListCount");
	}

	@Override
	public ArrayList<Member> selectClientList(PageInfo pi, SqlSessionTemplate sqlSession) {

		ArrayList<Member> clientList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		clientList = (ArrayList) sqlSession.selectList("Client.selectClientList", null, rowBounds);
		
		return clientList;
	}

	@Override
	public int updateClientStatus(int[] mnos, SqlSessionTemplate sqlSession) {
		
		int result = 0;
		
		for(int i = 0; i < mnos.length; i++) {
			result = sqlSession.update("Client.updateClientStatus", mnos[i]);
		}
		
		return result;
	}

	@Override
	public Member selectClientInfo(int clientMno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.selectClientInfo", clientMno);
	}

	@Override
	public int selectVisitCount(int clientMno, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Client.selectVisitCount", clientMno);
	}

	@Override
	public int selectTotalPrice(int clientMno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.selectTotalPrice", clientMno);
	}

	@Override
	public int selectStayDay(int clientMno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.selectStayDay", clientMno);
	}

	@Override
	public Stay selectLastVisit(int clientMno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.selectLastVisit", clientMno);
	}

	@Override
	public ArrayList<Que> selectClientQue(int clientMno, SqlSessionTemplate sqlSession) {

		ArrayList<Que> queList = null;
		
		queList = (ArrayList)sqlSession.selectList("Client.selectClientQue", clientMno);
		
		return queList;
	}

	@Override
	public ArrayList<Reservation> selectRsvList(int clientMno, SqlSessionTemplate sqlSession) {
		
		ArrayList<Reservation> rsvList = null;
		
		rsvList = (ArrayList)sqlSession.selectList("Client.selectRsvList", clientMno);
		
		return rsvList;
	}

	@Override
	public ArrayList<Stay> selectStayList(int clientMno, SqlSessionTemplate sqlSession) {

		ArrayList<Stay> stayList = null;
		
		stayList = (ArrayList)sqlSession.selectList("Client.selectStayList", clientMno);
		
		return stayList;
	}

	@Override
	public int getSearchClientListCount(ClientSearchCondition csc, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.getSearchClientListCount", csc);
	}

	@Override
	public ArrayList<Member> selectSearchClientList(SqlSessionTemplate sqlSession, ClientSearchCondition csc,
			PageInfo pi) {
		
		ArrayList<Member> searchClientList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		searchClientList = (ArrayList) sqlSession.selectList("Client.selectSearchClientList", csc, rowBounds);
		
		return searchClientList;
		
	}

	@Override
	public int updateClientInfo(Member client, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Client.updateClientInfo", client);
	}

	@Override
	public int getBlackListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Client.getBlackListCount");
	}

	@Override
	public ArrayList<Member> selectBlackLists(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		ArrayList<Member> blackLists = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		blackLists = (ArrayList) sqlSession.selectList("Client.selectBlackLists", null, rowBounds);
		
		return blackLists;
	}

	@Override
	public int insertBlackList(BlackList blackList, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Client.insertBlackList", blackList);
	}

	@Override
	public ArrayList<BlackList> selectBlackListContent(int blackListMno, SqlSessionTemplate sqlSession) {
		
		ArrayList<BlackList> blackListContent = null;
		
		blackListContent = (ArrayList)sqlSession.selectList("Client.selectBlackListContent", blackListMno);
		
		return blackListContent;
	}


}
