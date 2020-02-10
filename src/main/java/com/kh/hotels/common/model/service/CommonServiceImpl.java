package com.kh.hotels.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.common.model.dao.CommonDao;
import com.kh.hotels.common.model.vo.Attach;
import com.kh.hotels.common.model.vo.Basic;
import com.kh.hotels.common.model.vo.Cal;
import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.common.model.vo.Law;
import com.kh.hotels.common.model.vo.NoShow;
import com.kh.hotels.common.model.vo.OffSeason;
import com.kh.hotels.common.model.vo.Rfd;
import com.kh.hotels.common.model.vo.Rule;
import com.kh.hotels.common.model.vo.Season;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomPrc;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommonDao cd;

	@Override
	public int selectHotelInfoCount() {
		
		return cd.selectHotelInfoCount(sqlSession);
	}

	
	@Override
	public int insertHotelInfomation(Info info, Rule rule,Law law, Basic basic, NoShow noShow, Cal cal, Rfd rfd,
			OffSeason offSeason, Season season) {
		
		int result = 0;
		
		int result1 = cd.insertHotelInfo(info,sqlSession);
		
		int result2 = cd.insertHotelRule(rule,sqlSession);
		
		int result3 = cd.insertHotelLaw(law, sqlSession);
		
		int result4 = cd.insertHotelBasic(basic, sqlSession);
		
		int result5 = cd.insertHotelNoShow(noShow, sqlSession);
		
		int result6 = cd.insertHotelCalculate(cal, sqlSession);
		
		int result7 = cd.insertHotelRefund(offSeason, season, sqlSession);
		
		if( result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0 && result6 > 0 && result7 > 0) {
			result = 1;
			return result;
		}else {
			result = 0;
			return result;
		}
	}


	@Override
	public int insertHotelRoomType(ArrayList<RoomType> roomTypeList) {
		
		return cd.insertHotelRoomType(roomTypeList, sqlSession);
	}


	@Override
	public int selectRtNo(String string) {
		
		return cd.selectRtNo(string, sqlSession);
	}


	@Override
	public int insertHotelRoom(ArrayList<Room> roomList) {
		
		return cd.insertHotelRoom(roomList, sqlSession);
	}


	@Override
	public int selectRtNoFare(String string) {
		
		return cd.selectRtNoFare(string, sqlSession);
	}


	@Override
	public int insertHotelRoomFare(ArrayList<RoomPrc> roomPrcList) {

		return cd.insertHotelRoomFare(roomPrcList, sqlSession);
	}


	@Override
	public int insertHotelService(ArrayList<Svc> svcList) {
		
		return cd.insertHotelService(svcList, sqlSession);
	}


	@Override
	public int selectPhotoRtNo(String string) {

		return cd.selectPhotoRtNo(string, sqlSession);
	}


	@Override
	public int insertHotelPhoto(ArrayList<Attach> attachList) {
		
		return cd.insertHotelPhoto(attachList, sqlSession);
	}


	@Override
	public int deleteInfomation() {

		return cd.deleteInformation(sqlSession);
	}


	@Override
	public int deleteRoomType() {
		
		return cd.deleteRoomType(sqlSession);
	}

	

}
