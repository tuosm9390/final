package com.kh.hotels.hotel.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

@Component
//@Repository
public class HotelDaoImpl implements HotelDao{

	@Override
	public Map<String, RoomInfo> selectRoomList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectMap("hotel.selectRoomList", "rt_No");
	}

	@Override
	public RoomInfo selectRoomList(SqlSessionTemplate sqlSession, int roomType) {
		
		return sqlSession.selectOne("hotel.selectRoom", roomType);
	}

	@Override
	public ReservationCheck reservationCheck(SqlSessionTemplate sqlSession, ReservationCheck rsv) {

		return sqlSession.selectOne("hotel.reservationCheck", rsv);
	}

	@Override
	public int insertReservation(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		
		return sqlSession.insert("hotel.insertReservation", rsvCheck);
	}

}
