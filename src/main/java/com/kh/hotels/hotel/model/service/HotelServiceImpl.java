package com.kh.hotels.hotel.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.hotel.model.dao.HotelDao;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

@Service
public class HotelServiceImpl implements HotelService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private HotelDao hd;
	
	@Override
	public Map<String, RoomInfo> selectRoomList() {
		
		return hd.selectRoomList(sqlSession);
	}

	@Override
	public RoomInfo selectRoomList(int roomType) {
		
		return hd.selectRoomList(sqlSession, roomType);
	}

	@Override
	public ReservationCheck reservationCheck(ReservationCheck rsv) {
		
		return hd.reservationCheck(sqlSession, rsv);
	}

	@Override
	public int insertReservation(ReservationCheck rsvCheck) {

		return hd.insertReservation(sqlSession, rsvCheck);
	}

}
