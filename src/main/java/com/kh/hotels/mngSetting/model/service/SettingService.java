package com.kh.hotels.mngSetting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.vo.SearchService;
import com.kh.hotels.mngSetting.model.vo.SearchStaff;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

public interface SettingService {

	ArrayList<SettingRoomType> selectRoomTypeList();

	int selectRoomCount(int rtNo);

	int insertRoomType(ArrayList<RoomType> roomTypeList);

	ArrayList<Room> selectRoomDetailList(int rtNo);

	int getStaffListCount();

	ArrayList<Member> selectStaffList(PageInfo pi);

	Member selectStaffInfo(int staffMno);

	int updateStaffPwdReset(Member staff);

	int getSearchStaffListCount(SearchStaff searchS);

	ArrayList<Member> selectSearchStafftList(SearchStaff searchS, PageInfo pi);

	int updateStaffInfo(Member staff);

	ArrayList<Svc> selectServiceList();

	int insertNewService(Svc svc);

	Svc selectServiceOne(String svcCode);

	int updateService(Svc svc);

	ArrayList<Svc> selectSearchServiceList(SearchService searchService);

	ArrayList<BrokenRoom> selectBrokenRoomList();

	HashMap<String, Object> selectFloorList();

	int insertBrokenRoom(BrokenRoom brokenRoom);

	ArrayList<HashMap<String, Object>> selectHotelInfo();

	ArrayList<HashMap<String, Object>> selectHotelNoshowInfo();

	ArrayList<HashMap<String, Object>> selectHotelRfdSWInfo();

	ArrayList<HashMap<String, Object>> selectHotelRfdOWInfo();

	ArrayList<HashMap<String, Object>> selectHotelRfdOWEInfo();



}
