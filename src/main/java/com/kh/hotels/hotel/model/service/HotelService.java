package com.kh.hotels.hotel.model.service;

import java.util.Map;

import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

public interface HotelService {

	Map<String, RoomInfo> selectRoomList();

	RoomInfo selectRoomList(int roomType);

	ReservationCheck reservationCheck(ReservationCheck rsv);

	int insertReservation(ReservationCheck rsvCheck);

}
