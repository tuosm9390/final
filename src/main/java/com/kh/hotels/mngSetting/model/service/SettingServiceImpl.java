package com.kh.hotels.mngSetting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hotels.common.model.vo.Attach;
import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomPrc;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;
import com.kh.hotels.mngSetting.model.dao.SettingDao;
import com.kh.hotels.mngSetting.model.vo.SearchService;
import com.kh.hotels.mngSetting.model.vo.SearchStaff;
import com.kh.hotels.mngSetting.model.vo.SettingRoomType;

@Service
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingDao sd;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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

	@Override
	public int getStaffListCount() {

		return sd.getStaffListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectStaffList(PageInfo pi) {

		return sd.selectStaffList(sqlSession, pi);
	}

	@Override
	public Member selectStaffInfo(int staffMno) {
		
		return sd.selectStaffInfo(sqlSession, staffMno);
	}

	@Override
	public int updateStaffPwdReset(Member staff) {

		String encPwd = bcryptPasswordEncoder.encode(staff.getUserPwd());
		
		staff.setUserPwd(encPwd);
		
		int result = 0;
		
		int result1 = sd.updateStaffPwdReset(sqlSession, staff);
		
		int result2 = sd.updateStaffPwdStatus(sqlSession, staff);

		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int getSearchStaffListCount(SearchStaff searchS) {

		return sd.getSearchStaffListCount(sqlSession, searchS);
	}

	@Override
	public ArrayList<Member> selectSearchStafftList(SearchStaff searchS, PageInfo pi) {

		return sd.selectSearchStaffList(searchS, pi, sqlSession);
	}

	@Override
	public int updateStaffInfo(Member staff) {

		int result = 0;
		
		int result1 = sd.updateStaffInfoMember(staff, sqlSession);
		
		int result2 = sd.updateStaffInfoStaff(staff, sqlSession);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public ArrayList<Svc> selectServiceList() {
		
		return sd.selectServiceList(sqlSession);
	}

	@Override
	public int insertNewService(Svc svc) {
		
		return sd.insertNewService(sqlSession, svc);
	}

	@Override
	public Svc selectServiceOne(String svcCode) {
		
		return sd.selectServiceOne(sqlSession, svcCode);
	}

	@Override
	public int updateService(Svc svc) {

		return sd.updateService(svc, sqlSession);
	}

	@Override
	public ArrayList<Svc> selectSearchServiceList(SearchService searchService) {
		
		return sd.selectSearchServiceList(sqlSession, searchService);
	}

	@Override
	public ArrayList<BrokenRoom> selectBrokenRoomList() {

		return sd.selectBrokenRoomList(sqlSession);
	}

	@Override
	public HashMap<String, Object> selectFloorList() {

		ArrayList<Integer> floorList = sd.selectFloorList(sqlSession);
		
		ArrayList<Room> roomInfoList = sd.selectRoomList(sqlSession);
		
		HashMap<String, Object> roomList = new HashMap<>();
		
		roomList.put("floorList", floorList);
		roomList.put("roomInfoList", roomInfoList);
		
		return roomList;
	}

	@Override
	public int insertBrokenRoom(BrokenRoom brokenRoom) {

		return sd.insertBrokenRoom(sqlSession, brokenRoom);
	}

	@Override
	public int updateBrokenRoom(BrokenRoom brokenRoom) {

		return sd.updateBrokenRoom(sqlSession, brokenRoom);
	}

	@Override
	public ArrayList<BrokenRoom> selectSearchBrokenRoomList(BrokenRoom brokenRoom) {

		return sd.selectSearchBrokenRoomList(brokenRoom, sqlSession);
	}

	@Override
	public ArrayList<Prc> selectRoomPrcList() {
		
		return sd.selectRoomPrcList(sqlSession);
	}

	@Override
	public int getRoomTypeCount() {

		return sd.getRoomTypeCount(sqlSession);
	}

	@Override
	public int insertNewRoomType(RoomType roomType) {

		int result = sd.insertNewRoomType(sqlSession, roomType);
		
		int rtNo = 0;
		
		if(result > 0) {
			rtNo = sd.selectRtNo(sqlSession, roomType);
		}
		
		return rtNo;
	}

	@Override
	public int insertNewRoomTypePhotoAndPrice(RoomPrc roomPrc, ArrayList<Attach> attachList) {

		int result = 0;
		
		int result1 = sd.insertNewRoomTypePhoto(sqlSession, attachList);
		
		int result2 = sd.insertNewRoomTypeFare(sqlSession, roomPrc);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> selectHotelInfo() {
		
		ArrayList<HashMap<String, Object>> list = sd.selectHotelInfo(sqlSession);
		
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelNoshowInfo() {
		
		ArrayList<HashMap<String, Object>> list = sd.selectHotelNoshowInfo(sqlSession);
		
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelRfdSWInfo() {
		
		ArrayList<HashMap<String, Object>> list = sd.selectHotelRfdSWList(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelRfdOWInfo() {
		
		ArrayList<HashMap<String, Object>> list = sd.selectHotelRfdOWList(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelRfdOWEInfo() {
		
		ArrayList<HashMap<String, Object>> list = sd.selectHotelRfdOWEList(sqlSession);
		
		return list;
	}

	@Override
	public RoomType selectMinPerMaxPer(int rtNo) {
		
		return sd.selectMinPerMaxPer(sqlSession, rtNo);
	}

	@Override
	public int insertAddNewRoomDetail(ArrayList<Room> roomList) {

		return sd.insertAddNewRoomDetail(sqlSession, roomList);
	}

	@Override
	public int updateRoomDisable(int[] rmNo) {
		
		return sd.updateRoomDisable(sqlSession, rmNo);
	}

	@Override
	public int updateRoomEnable(int[] rmNo) {
		
		return sd.updateRoomEnable(sqlSession, rmNo);
	}


}
