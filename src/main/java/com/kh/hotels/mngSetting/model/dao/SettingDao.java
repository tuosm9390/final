package com.kh.hotels.mngSetting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

public interface SettingDao {

	ArrayList<SettingRoomType> selectRoomTypeList(SqlSessionTemplate sqlSession);

	int selectRoomCount(int rtNo, SqlSessionTemplate sqlSession);

	int insertRoomType(ArrayList<RoomType> roomTypeList, SqlSessionTemplate sqlSession);

	ArrayList<Room> selectRoomDetailList(int rtNo, SqlSessionTemplate sqlSession);

}
