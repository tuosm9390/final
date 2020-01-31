package com.kh.hotels.mngRooms.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

public interface RoomsDao {

	ArrayList<RoomList> viewRoomList(SqlSessionTemplate sqlSession) throws RoomListException;

	ArrayList<Prc> viewRoomPrice(SqlSessionTemplate sqlSession) throws RoomListException;

	ArrayList<ServiceList> viewServiceList(SqlSessionTemplate sqlSession) throws RoomListException;

	ArrayList<Member> ajxFindClient(SqlSessionTemplate sqlSession, String searchName);

	int insertCIstay(SqlSessionTemplate sqlSession, CheckIn checkIn);

	int insertCIpayment(SqlSessionTemplate sqlSession, CheckIn checkIn);

	int insertCIsvcuse(SqlSessionTemplate sqlSession, CheckIn checkIn);

}
