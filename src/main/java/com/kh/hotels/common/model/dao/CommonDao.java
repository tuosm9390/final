package com.kh.hotels.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.common.model.vo.Attach;
import com.kh.hotels.common.model.vo.Basic;
import com.kh.hotels.common.model.vo.Cal;
import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.common.model.vo.Law;
import com.kh.hotels.common.model.vo.NoShow;
import com.kh.hotels.common.model.vo.OffSeason;
import com.kh.hotels.common.model.vo.Rule;
import com.kh.hotels.common.model.vo.Season;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomPrc;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;

public interface CommonDao {

	int selectHotelInfoCount(SqlSessionTemplate sqlSession);

	int insertHotelInfo(Info info, SqlSessionTemplate sqlSession);

	int insertHotelRule(Rule rule, SqlSessionTemplate sqlSession);

	int insertHotelLaw(Law law, SqlSessionTemplate sqlSession);

	int insertHotelBasic(Basic basic, SqlSessionTemplate sqlSession);

	int insertHotelNoShow(NoShow noShow, SqlSessionTemplate sqlSession);

	int insertHotelCalculate(Cal cal, SqlSessionTemplate sqlSession);

	int insertHotelRefund(OffSeason offSeason, Season season,
			SqlSessionTemplate sqlSession);

	int insertHotelRoomType(ArrayList<RoomType> roomTypeList, SqlSessionTemplate sqlSession);

	int selectRtNo(String string, SqlSessionTemplate sqlSession);

	int insertHotelRoom(ArrayList<Room> roomList, SqlSessionTemplate sqlSession);

	int selectRtNoFare(String string, SqlSessionTemplate sqlSession);

	int insertHotelRoomFare(ArrayList<RoomPrc> roomPrcList, SqlSessionTemplate sqlSession);

	int insertHotelService(ArrayList<Svc> svcList, SqlSessionTemplate sqlSession);

	int selectPhotoRtNo(String string, SqlSessionTemplate sqlSession);

	int insertHotelPhoto(ArrayList<Attach> attachList, SqlSessionTemplate sqlSession);

	int deleteInformation(SqlSessionTemplate sqlSession);


}
