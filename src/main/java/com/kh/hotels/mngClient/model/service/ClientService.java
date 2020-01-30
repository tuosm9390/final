package com.kh.hotels.mngClient.model.service;

import java.util.ArrayList;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
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

}
