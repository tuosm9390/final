package com.kh.hotels.mngRooms.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;

public interface RoomsDao {

	ArrayList<RoomList> viewRoomList(SqlSessionTemplate sqlSession) throws RoomListException;

	ArrayList<Prc> viewRoomPrice(SqlSessionTemplate sqlSession) throws RoomListException;

}
