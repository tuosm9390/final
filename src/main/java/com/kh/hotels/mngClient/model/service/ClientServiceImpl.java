package com.kh.hotels.mngClient.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.dao.ClientDao;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngStay.model.vo.Stay;

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

	@Override
	public ArrayList<Member> selectClientList(PageInfo pi) {

		return cd.selectClientList(pi, sqlSession);
	}

	@Override
	public int updateClientStatus(int[] mnos) {

		return cd.updateClientStatus(mnos, sqlSession);
	}

	@Override
	public Member selectClientInfo(int clientMno) {
		
		return cd.selectClientInfo(clientMno, sqlSession);
	}

	@Override
	public int selectVisitCount(int clientMno) {
		
		return cd.selectVisitCount(clientMno, sqlSession);
	}

	@Override
	public int selectTotalPrice(int clientMno) {
		
		return cd.selectTotalPrice(clientMno, sqlSession);
	}

	@Override
	public int selectStayDay(int clientMno) {
		
		return cd.selectStayDay(clientMno, sqlSession);
	}

	@Override
	public Stay selectLastVisit(int clientMno) {
		
		return cd.selectLastVisit(clientMno, sqlSession);
	}

	@Override
	public ArrayList<Que> selectClientQue(int clientMno) {

		return cd.selectClientQue(clientMno, sqlSession);
	}
	

}

















