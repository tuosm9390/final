package com.kh.hotels.mngReserv.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.vo.RoomList;

public interface ReservNowDao {

	ArrayList<RoomInfo> selectRoomInfo(SqlSessionTemplate sqlSession);

	ArrayList<RoomList> selectRoomList(SqlSessionTemplate sqlSession);

}
