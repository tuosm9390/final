package com.kh.hotels.hotel.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

public interface HotelDao {

	Map<String, RoomInfo> selectRoomList(SqlSessionTemplate sqlSession);

	RoomInfo selectRoomList(SqlSessionTemplate sqlSession, int roomType);

	ReservationCheck reservationCheck(SqlSessionTemplate sqlSession, ReservationCheck rsv);

	int insertReservation(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck);

}
