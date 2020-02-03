package com.kh.hotels.mngRooms.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.RuleInfo;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

public interface RoomsDao {

	ArrayList<RoomList> viewRoomList(SqlSessionTemplate sqlSession) throws RoomListException;

	ArrayList<Prc> viewRoomPrice(SqlSessionTemplate sqlSession) throws RoomListException;

	ArrayList<ServiceList> viewServiceList(SqlSessionTemplate sqlSession) throws RoomListException;

	RuleInfo viewRuleInfo(SqlSessionTemplate sqlSession) throws RoomListException;
	
	ArrayList<Member> ajxFindClient(SqlSessionTemplate sqlSession, String searchName);
	
	int ajxInsertClient(SqlSessionTemplate sqlSession, CheckIn newClient);
	
	ArrayList<Member> ajxFindTempClient(SqlSessionTemplate sqlSession, String hipen);
	
	int insertTempMember(SqlSessionTemplate sqlSession, CheckIn checkIn);

	int selectMno(SqlSessionTemplate sqlSession, String clientName);

	int insertCIstay(SqlSessionTemplate sqlSession, CheckIn checkIn);

	int insertCIstayHis(SqlSessionTemplate sqlSession);
	
	int insertCIpayment(SqlSessionTemplate sqlSession, CheckIn checkIn);

	int insertCIsvcuse(SqlSessionTemplate sqlSession, CheckIn checkIn);

	int insertCIsvcuseHis(SqlSessionTemplate sqlSession, CheckIn checkIn);

	BrokenRoom ajxFindBrokenHis(SqlSessionTemplate sqlSession, int rmNo);

	int ajxUpdateBrkStt(SqlSessionTemplate sqlSession, int rmNo);

	int ajxUpdateRoomClean(SqlSessionTemplate sqlSession, int rmNo);

	int ajxUpdateRoomNoClean(SqlSessionTemplate sqlSession, int rmNo);

	int ajxUpdateAllRoomSttClean(SqlSessionTemplate sqlSession, ArrayList<String> floorList);

	int ajxUpdateAllRoomSttNoClean(SqlSessionTemplate sqlSession, ArrayList<String> floorList);

}
