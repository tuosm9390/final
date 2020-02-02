package com.kh.hotels.mngClient.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.dao.ClientDao;
import com.kh.hotels.mngClient.model.vo.BlackList;
import com.kh.hotels.mngClient.model.vo.ClientSearchCondition;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngClient.model.vo.QueFilter;
import com.kh.hotels.mngClient.model.vo.QueModal;
import com.kh.hotels.mngClient.model.vo.QueSearchCondition;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.Reservation;
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

	@Override
	public ArrayList<Reservation> selectRsvList(int clientMno) {

		return cd.selectRsvList(clientMno, sqlSession);
	}

	@Override
	public ArrayList<Stay> selectStayList(int clientMno) {
		
		return cd.selectStayList(clientMno, sqlSession);
	}

	@Override
	public int getSearchClientListCount(ClientSearchCondition csc) {

		return cd.getSearchClientListCount(csc, sqlSession);
	}

	@Override
	public ArrayList<Member> selectSearchClientList(ClientSearchCondition csc, PageInfo pi) {

		return cd.selectSearchClientList(sqlSession, csc, pi);
	}

	@Override
	public int updateClientInfo(Member client) {

		return cd.updateClientInfo(client, sqlSession);
	}

	@Override
	public int getBlackListCount() {

		return cd.getBlackListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectBlackLists(PageInfo pi) {
		
		return cd.selectBlackLists(pi, sqlSession);
	}

	@Override
	public int insertBlackList(BlackList blackList) {
		
		return cd.insertBlackList(blackList, sqlSession);
	}

	@Override
	public ArrayList<BlackList> selectBlackListContent(int blackListMno) {

		return cd.selectBlackListContent(blackListMno, sqlSession);
	}

	@Override
	public int updateBlackListStatus(String[] mnos) {

		return cd.updateBlackListStatus(mnos, sqlSession);
	}

	@Override
	public int getSearchBlackListCount(ClientSearchCondition csc) {

		return cd.getSearchBlackListCount(csc, sqlSession);
	}

	@Override
	public ArrayList<Member> selectSearchBlackLists(ClientSearchCondition csc, PageInfo pi) {

		return cd.selectSearchBlackLists(csc, pi, sqlSession);
	}

	@Override
	public int getQueListCount() {

		return cd.getQueListCount(sqlSession);
	}

	@Override
	public ArrayList<Que> selectQueList(PageInfo pi) {
		
		return cd.selectQueList(pi, sqlSession);
	}

	@Override
	public ArrayList<Que> selectFilterQueList(PageInfo pi, QueFilter queFilter) {

		return cd.selectFilterQueList(pi, queFilter, sqlSession);
	}

	@Override
	public int getFilterQueListCount(QueFilter queFilter) {

		return cd.getFilterQueListCount(sqlSession, queFilter);
	}

	@Override
	public QueModal selectQueDetail(Que que) {

		return cd.selectQueDetail(que, sqlSession);
	}


	@Override
	public int insertOfflineMember(Que que) {

		return cd.insertOfflineMember(que, sqlSession);
	}

	@Override
	public int selectOfflineMember(Que que) {
		
		return cd.selectOfflineMember(que, sqlSession);
	}

	@Override
	public int insertQue(Que que) {
		
		return cd.insertQue(que, sqlSession);
	}
	
	@Override
	public int selectQueNo(Que que) {
		
		return cd.selectQueNo(que, sqlSession);
	}

	@Override
	public int insertAns(Que que) {
		
		return cd.insertAns(que, sqlSession);
	}

	@Override
	public int insertAnswer(Que que) {

		int result = 0;
		
		int result1 = cd.insertAnswer(que, sqlSession);
		
		int result2 = cd.updateQueAns(que, sqlSession);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int getSearchQueCount(QueSearchCondition qsc) {
		
		return cd.getSearchQueCount(qsc, sqlSession);
	}

	@Override
	public ArrayList<Que> selectSearchQueList(QueSearchCondition qsc, PageInfo pi) {

		return cd.selectSearchQueList(qsc, pi, sqlSession);
	}


	

}

















