package com.kh.hotels.mngRooms.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.dao.RoomsDao;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

@Service
public class RoomsServiceImpl implements RoomsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RoomsDao rd;

	@Override
	public ArrayList<RoomList> viewRoomList() throws RoomListException {
		ArrayList<RoomList> roomList = rd.viewRoomList(sqlSession);
		return roomList;
	}

	@Override
	public ArrayList<Prc> viewRoomPrice() throws RoomListException {
		ArrayList<Prc> roomPrice = rd.viewRoomPrice(sqlSession);
		return roomPrice;
	}

	@Override
	public ArrayList<ServiceList> viewServiceList() throws RoomListException {
		ArrayList<ServiceList> svcList = rd.viewServiceList(sqlSession);
		return svcList;
	}

	@Override
	public ArrayList<Member> ajxFindClient(String searchName) {
		ArrayList<Member> clientList = rd.ajxFindClient(sqlSession, searchName);
		return clientList;
	}

	@Override
	public void insertCheckIn(CheckIn checkIn) {
		int result1 = rd.insertCIstay(sqlSession, checkIn);
		int result2 = rd.insertCIpayment(sqlSession, checkIn);
		int result3 = rd.insertCIsvcuse(sqlSession, checkIn);
	}

}
