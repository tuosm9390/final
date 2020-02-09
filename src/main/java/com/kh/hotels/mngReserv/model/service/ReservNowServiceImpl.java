package com.kh.hotels.mngReserv.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngReserv.model.dao.ReservNowDao;
import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.vo.RoomList;

@Service
public class ReservNowServiceImpl implements ReservNowService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservNowDao nd;

	@Override
	public ArrayList<RoomInfo> selectRoomInfo() {
		return nd.selectRoomInfo(sqlSession);
	}

	@Override
	public ArrayList<RoomList> selectRoomList() {
		return nd.selectRoomList(sqlSession);
	}

}
