package com.kh.hotels.mngRooms.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

@Repository
public class RoomsDaoImpl implements RoomsDao {

	@Override
	public ArrayList<RoomList> viewRoomList(SqlSessionTemplate sqlSession) throws RoomListException {
		ArrayList<RoomList> roomList = (ArrayList) sqlSession.selectList("Rooms.viewRoomList");
		if(roomList == null) {
			throw new RoomListException("Error : View RoomList Failed");
		}
		return roomList;
	}

	@Override
	public ArrayList<Prc> viewRoomPrice(SqlSessionTemplate sqlSession) throws RoomListException {
		ArrayList<Prc> roomPrice = (ArrayList) sqlSession.selectList("Rooms.viewRoomPrice");
		if(roomPrice == null) {
			throw new RoomListException("Error : View RoomPrice Failed");
		}
		return roomPrice;
	}

	@Override
	public ArrayList<ServiceList> viewServiceList(SqlSessionTemplate sqlSession) throws RoomListException {
		ArrayList<ServiceList> svcList = (ArrayList) sqlSession.selectList("Rooms.viewServiceList");
		if(svcList == null) {
			throw new RoomListException("Error : View ServiceList Failed");
		}
		return svcList;
	}

	@Override
	public ArrayList<Member> ajxFindClient(SqlSessionTemplate sqlSession, String searchName) {
		ArrayList<Member> clientList = (ArrayList) sqlSession.selectList("Rooms.ajxFindClient", searchName);
		return clientList;
	}

	@Override
	public int insertCIstay(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertCIstay", checkIn);
	}

	@Override
	public int insertCIpayment(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertCIpayment", checkIn);
	}

	@Override
	public int insertCIsvcuse(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertCIsvcuse", checkIn);
	}

}
