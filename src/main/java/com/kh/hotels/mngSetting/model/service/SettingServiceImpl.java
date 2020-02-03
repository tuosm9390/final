package com.kh.hotels.mngSetting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.dao.SettingDao;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

@Service
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingDao sd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<SettingRoomType> selectRoomTypeList() {

		return sd.selectRoomTypeList(sqlSession);
	}

	@Override
	public int selectRoomCount(int rtNo) {
		
		return sd.selectRoomCount(rtNo, sqlSession);
	}

	@Override
	public int insertRoomType(ArrayList<RoomType> roomTypeList) {

		return sd.insertRoomType(roomTypeList, sqlSession);
	}

	@Override
	public ArrayList<Room> selectRoomDetailList(int rtNo) {
		
		return sd.selectRoomDetailList(rtNo, sqlSession);
	}
	

}
