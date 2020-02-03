package com.kh.hotels.mngSetting.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

public interface SettingService {

	ArrayList<SettingRoomType> selectRoomTypeList();

	int selectRoomCount(int rtNo);

	int insertRoomType(ArrayList<RoomType> roomTypeList);

	ArrayList<Room> selectRoomDetailList(int rtNo);


}
