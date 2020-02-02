package com.kh.hotels.mngClient.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

public interface ClientService {

	int getClientListCount();

	ArrayList<Member> selectClientList(PageInfo pi);

	int updateClientStatus(int[] mnos);

	Member selectClientInfo(int clientMno);

	int selectVisitCount(int clientMno);

	int selectTotalPrice(int clientMno);

	int selectStayDay(int clientMno);

	Stay selectLastVisit(int clientMno);

	ArrayList<Que> selectClientQue(int clientMno);

	ArrayList<Reservation> selectRsvList(int clientMno);

	ArrayList<Stay> selectStayList(int clientMno);

	int getSearchClientListCount(ClientSearchCondition csc);

	ArrayList<Member> selectSearchClientList(ClientSearchCondition csc, PageInfo pi);

	int updateClientInfo(Member client);

	int getBlackListCount();

	ArrayList<Member> selectBlackLists(PageInfo pi);

	int insertBlackList(BlackList blackList);

	ArrayList<BlackList> selectBlackListContent(int blackListMno);

	int updateBlackListStatus(String[] mnos);

	int getSearchBlackListCount(ClientSearchCondition csc);

	ArrayList<Member> selectSearchBlackLists(ClientSearchCondition csc, PageInfo pi);

	int getQueListCount();

	ArrayList<Que> selectQueList(PageInfo pi);

	ArrayList<Que> selectFilterQueList(PageInfo pi, QueFilter queFilter);

	int getFilterQueListCount(QueFilter queFilter);

	QueModal selectQueDetail(Que que);

	int insertOfflineMember(Que que);

	int selectOfflineMember(Que que);

	int insertQue(Que que);

	int selectQueNo(Que que);

	int insertAns(Que que);

	int insertAnswer(Que que);

	int getSearchQueCount(QueSearchCondition qsc);

	ArrayList<Que> selectSearchQueList(QueSearchCondition qsc, PageInfo pi);




}
