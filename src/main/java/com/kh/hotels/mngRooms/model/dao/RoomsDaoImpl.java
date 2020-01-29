package com.kh.hotels.mngRooms.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;

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

}
