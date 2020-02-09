package com.kh.hotels.mngReserv.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.vo.RoomList;

@Repository
public class ReservNowDaoImpl implements ReservNowDao {

	@Override
	public ArrayList<RoomInfo> selectRoomInfo(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Reserv.selectRoomInfo");
	}

	@Override
	public ArrayList<RoomList> selectRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Reserv.selectRoomList");
	}

}
