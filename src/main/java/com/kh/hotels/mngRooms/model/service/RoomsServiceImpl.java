package com.kh.hotels.mngRooms.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngRooms.model.dao.RoomsDao;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.RoomList;

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

}
