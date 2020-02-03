package com.kh.hotels.mngSetting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

@Repository
public class SettingDaoImpl implements SettingDao{

	@Override
	public ArrayList<SettingRoomType> selectRoomTypeList(SqlSessionTemplate sqlSession) {

		ArrayList<SettingRoomType> roomTypeList = null;
		
		roomTypeList = (ArrayList)sqlSession.selectList("Setting.selectRoomTypeList");
		
		return roomTypeList;
	}

	@Override
	public int selectRoomCount(int rtNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Setting.selectRoomCount", rtNo);
	}

	@Override
	public int insertRoomType(ArrayList<RoomType> roomTypeList, SqlSessionTemplate sqlSession) {

		int result = 0;
		
		for(int i = 0; i < roomTypeList.size(); i++) {
			result = sqlSession.insert("Setting.insertRoomType", roomTypeList.get(i));
		}
		
		return result;
	}

	@Override
	public ArrayList<Room> selectRoomDetailList(int rtNo, SqlSessionTemplate sqlSession) {
		
		ArrayList<Room> roomDetailList = null;
		
		roomDetailList = (ArrayList)sqlSession.selectList("Setting.selectRoomDetailList", rtNo);
		
		return roomDetailList;
	}


}
