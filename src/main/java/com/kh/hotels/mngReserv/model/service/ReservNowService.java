package com.kh.hotels.mngReserv.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.vo.RoomList;

public interface ReservNowService {

	ArrayList<RoomInfo> selectRoomInfo();

	ArrayList<RoomList> selectRoomList();

}
