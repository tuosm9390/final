package com.kh.hotels.mngRooms.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

public interface RoomsService {

	ArrayList<RoomList> viewRoomList() throws RoomListException;

	ArrayList<Prc> viewRoomPrice() throws RoomListException;

	ArrayList<ServiceList> viewServiceList() throws RoomListException;

	ArrayList<Member> ajxFindClient(String searchName);

	void insertCheckIn(CheckIn checkIn);

}
