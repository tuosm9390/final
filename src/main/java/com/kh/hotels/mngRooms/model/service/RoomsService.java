package com.kh.hotels.mngRooms.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.RoomList;

public interface RoomsService {

	ArrayList<RoomList> viewRoomList() throws RoomListException;

}
