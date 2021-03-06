package com.kh.hotels.mngSetting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.common.model.vo.Attach;
import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomPrc;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.vo.SearchService;
import com.kh.hotels.mngSetting.model.vo.SearchStaff;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

public interface SettingDao {

	ArrayList<SettingRoomType> selectRoomTypeList(SqlSessionTemplate sqlSession);

	int selectRoomCount(int rtNo, SqlSessionTemplate sqlSession);

	int insertRoomType(ArrayList<RoomType> roomTypeList, SqlSessionTemplate sqlSession);

	ArrayList<Room> selectRoomDetailList(int rtNo, SqlSessionTemplate sqlSession);

	int getStaffListCount(SqlSessionTemplate sqlSession);

	ArrayList<Member> selectStaffList(SqlSessionTemplate sqlSession, PageInfo pi);

	Member selectStaffInfo(SqlSessionTemplate sqlSession, int staffMno);

	int updateStaffPwdReset(SqlSessionTemplate sqlSession, Member staff);

	int updateStaffPwdStatus(SqlSessionTemplate sqlSession, Member staff);

	int getSearchStaffListCount(SqlSessionTemplate sqlSession, SearchStaff searchS);

	ArrayList<Member> selectSearchStaffList(SearchStaff searchS, PageInfo pi, SqlSessionTemplate sqlSession);

	int updateStaffInfoMember(Member staff, SqlSessionTemplate sqlSession);

	int updateStaffInfoStaff(Member staff, SqlSessionTemplate sqlSession);

	ArrayList<Svc> selectServiceList(SqlSessionTemplate sqlSession);

	int insertNewService(SqlSessionTemplate sqlSession, Svc svc);

	Svc selectServiceOne(SqlSessionTemplate sqlSession, String svcCode);

	int updateService(Svc svc, SqlSessionTemplate sqlSession);

	ArrayList<Svc> selectSearchServiceList(SqlSessionTemplate sqlSession, SearchService searchService);

	ArrayList<BrokenRoom> selectBrokenRoomList(SqlSessionTemplate sqlSession);

	ArrayList<Integer> selectFloorList(SqlSessionTemplate sqlSession);

	ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession);

	int insertBrokenRoom(SqlSessionTemplate sqlSession, BrokenRoom brokenRoom);

	int updateBrokenRoom(SqlSessionTemplate sqlSession, BrokenRoom brokenRoom);

	ArrayList<BrokenRoom> selectSearchBrokenRoomList(BrokenRoom brokenRoom, SqlSessionTemplate sqlSession);

	ArrayList<Prc> selectRoomPrcList(SqlSessionTemplate sqlSession);

	int getRoomTypeCount(SqlSessionTemplate sqlSession);

	int insertNewRoomType(SqlSessionTemplate sqlSession, RoomType roomType);

	int selectRtNo(SqlSessionTemplate sqlSession, RoomType roomType);

	int insertNewRoomTypePhoto(SqlSessionTemplate sqlSession, ArrayList<Attach> attachList);

	int insertNewRoomTypeFare(SqlSessionTemplate sqlSession, RoomPrc roomPrc);
	
	ArrayList<HashMap<String, Object>> selectHotelInfo(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> selectHotelNoshowInfo(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> selectHotelRfdSWList(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> selectHotelRfdOWList(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> selectHotelRfdOWEList(SqlSessionTemplate sqlSession);

	RoomType selectMinPerMaxPer(SqlSessionTemplate sqlSession, int rtNo);

	int insertAddNewRoomDetail(SqlSessionTemplate sqlSession, ArrayList<Room> roomList);

	int updateRoomDisable(SqlSessionTemplate sqlSession, int[] rmNo);

	int updateRoomEnable(SqlSessionTemplate sqlSession, int[] rmNo);

}
