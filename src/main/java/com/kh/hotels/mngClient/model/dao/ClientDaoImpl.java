package com.kh.hotels.mngClient.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
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

}
