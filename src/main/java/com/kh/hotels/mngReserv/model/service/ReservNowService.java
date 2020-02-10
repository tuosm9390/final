package com.kh.hotels.mngReserv.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.RoomList;

public interface ReservNowService {

	ArrayList<RoomInfo> selectRoomInfo();

	ArrayList<RoomList> selectRoomList();

	BrokenRoom ajxFindBrokenHis(int rmNo);

	ArrayList<RoomList> searchReservNowDay(String day);

	void insertMember(CheckIn checkIn);

	int selectMno(CheckIn checkIn);

	void insertReserv(CheckIn checkIn);

}
