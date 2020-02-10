package com.kh.hotels.mngReserv.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.RoomList;

public interface ReservNowDao {

	ArrayList<RoomInfo> selectRoomInfo(SqlSessionTemplate sqlSession);

	ArrayList<RoomList> selectRoomList(SqlSessionTemplate sqlSession);

	BrokenRoom ajxFindBrokenHis(SqlSessionTemplate sqlSession, int rmNo);

	ArrayList<RoomList> searchReservNowDay(SqlSessionTemplate sqlSession, String day);

	void insertMember(SqlSessionTemplate sqlSession, CheckIn checkIn);

	int selectMno(SqlSessionTemplate sqlSession, CheckIn checkIn);

	void insertRsv(SqlSessionTemplate sqlSession, CheckIn checkIn);

	void insertRsvHis(SqlSessionTemplate sqlSession, CheckIn checkIn);

	void insertPayment(SqlSessionTemplate sqlSession, CheckIn checkIn);

	Integer insertSvcUse(SqlSessionTemplate sqlSession, CheckIn checkIn);

	Integer insertSvcUseHis(SqlSessionTemplate sqlSession, CheckIn checkIn);

}
