package com.kh.hotels.mngSetting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	@Override
	public int getStaffListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Setting.getStaffListCount");
	}

	@Override
	public ArrayList<Member> selectStaffList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		ArrayList<Member> staffList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		staffList = (ArrayList) sqlSession.selectList("Setting.selectStaffList", null, rowBounds);
		
		return staffList;
	}

	@Override
	public Member selectStaffInfo(SqlSessionTemplate sqlSession, int staffMno) {
		
		return sqlSession.selectOne("Setting.selectStaffInfo", staffMno);
	}

	@Override
	public int updateStaffPwdReset(SqlSessionTemplate sqlSession, Member staff) {
		
		return sqlSession.update("Setting.updateStaffPwdReset", staff);
	}

	@Override
	public int updateStaffPwdStatus(SqlSessionTemplate sqlSession, Member staff) {
		
		return sqlSession.update("Setting.updateStaffPwdStatus", staff);
	}

	@Override
	public int getSearchStaffListCount(SqlSessionTemplate sqlSession, SearchStaff searchS) {
		
		return sqlSession.selectOne("Setting.getSearchStaffListCount", searchS);
	}

	@Override
	public ArrayList<Member> selectSearchStaffList(SearchStaff searchS, PageInfo pi, SqlSessionTemplate sqlSession) {

		ArrayList<Member> searchStaffList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		searchStaffList = (ArrayList) sqlSession.selectList("Setting.selectSearchStaffList", searchS, rowBounds);
		
		return searchStaffList;
	}

	@Override
	public int updateStaffInfoMember(Member staff, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("Setting.updateStaffInfoMember", staff);
	}

	@Override
	public int updateStaffInfoStaff(Member staff, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Setting.updateStaffInfoStaff", staff);
	}

	@Override
	public ArrayList<Svc> selectServiceList(SqlSessionTemplate sqlSession) {

		ArrayList<Svc> svcList = null;
		
		svcList = (ArrayList)sqlSession.selectList("Setting.selectServiceList");
		
		return svcList;
	}

	@Override
	public int insertNewService(SqlSessionTemplate sqlSession, Svc svc) {

		return sqlSession.insert("Setting.insertNewService", svc);
	}

	@Override
	public Svc selectServiceOne(SqlSessionTemplate sqlSession, String svcCode) {

		return sqlSession.selectOne("Setting.selectServiceOne", svcCode);
	}

	@Override
	public int updateService(Svc svc, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("Setting.updateService", svc);
	}

	@Override
	public ArrayList<Svc> selectSearchServiceList(SqlSessionTemplate sqlSession, SearchService searchService) {
		
		ArrayList<Svc> searchServiceList = null;
		
		searchServiceList = (ArrayList)sqlSession.selectList("Setting.selectSearchServiceList", searchService);
		
		return searchServiceList;
	}

	@Override
	public ArrayList<BrokenRoom> selectBrokenRoomList(SqlSessionTemplate sqlSession) {
		
		ArrayList<BrokenRoom> brokenRoomList = null;
		
		brokenRoomList = (ArrayList)sqlSession.selectList("Setting.selectBrokenRoomList");
		
		return brokenRoomList;
	}

	@Override
	public ArrayList<Integer> selectFloorList(SqlSessionTemplate sqlSession) {

		ArrayList<Integer> floorList = null;
		
		floorList = (ArrayList)sqlSession.selectList("Setting.selectFloorList");
		
		System.out.println(floorList + "  dao floorList ");
		
		return floorList;
	}

	@Override
	public ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession) {
		
		ArrayList<Room> roomList = null;
		
		roomList = (ArrayList)sqlSession.selectList("Setting.selectRoomList");
		
		return roomList;
	}

	@Override
	public int insertBrokenRoom(SqlSessionTemplate sqlSession, BrokenRoom brokenRoom) {

		return sqlSession.insert("Setting.insertBrokenRoom", brokenRoom);
	}

	@Override
	public int updateBrokenRoom(SqlSessionTemplate sqlSession, BrokenRoom brokenRoom) {
		
		return sqlSession.update("Setting.updateBrokenRoom", brokenRoom);
	}

	@Override
	public ArrayList<BrokenRoom> selectSearchBrokenRoomList(BrokenRoom brokenRoom, SqlSessionTemplate sqlSession) {
		
		ArrayList<BrokenRoom> searchBrokenRoomList = null;
		
		searchBrokenRoomList = (ArrayList)sqlSession.selectList("Setting.searchBrokenRoomList", brokenRoom);
		
		return searchBrokenRoomList;
	}

	@Override
	public ArrayList<Prc> selectRoomPrcList(SqlSessionTemplate sqlSession) {

		ArrayList<Prc> roomPrcList = null;
		
		roomPrcList = (ArrayList)sqlSession.selectList("Setting.selectRoomPrcList");
		
		return roomPrcList;
	}

	@Override
	public int getRoomTypeCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Setting.getRoomTypeCount");
	}

	@Override
	public int insertNewRoomType(SqlSessionTemplate sqlSession, RoomType roomType) {
		
		return sqlSession.insert("Setting.insertNewRoomType", roomType);
	}

	@Override
	public int selectRtNo(SqlSessionTemplate sqlSession, RoomType roomType) {

		return sqlSession.selectOne("Setting.selecrRtNo", roomType);
	}

	@Override
	public int insertNewRoomTypePhoto(SqlSessionTemplate sqlSession, ArrayList<Attach> attachList) {
		
		int result = 0;
		
		for(int i = 0; i < attachList.size(); i++) {
			result = sqlSession.insert("Setting.insertHotelPhoto", attachList.get(i));
		}
		
		return result;
	}

	@Override
	public int insertNewRoomTypeFare(SqlSessionTemplate sqlSession, RoomPrc roomPrc) {
		int result = 0;
			// 비성수기 /////////////////////////////////////////////////////////////////////////////////////
		int monOffRentResult = sqlSession.insert("Setting.insertOffMonRentFare", roomPrc);
		int tueOffRentResult = sqlSession.insert("Setting.insertOffTueRentFare", roomPrc);
		int wedOffRentResult = sqlSession.insert("Setting.insertOffWedRentFare", roomPrc);
		int thuOffRentResult = sqlSession.insert("Setting.insertOffThuRentFare", roomPrc);
		int friOffRentResult = sqlSession.insert("Setting.insertOffFriRentFare", roomPrc);
		int satOffRentResult = sqlSession.insert("Setting.insertOffSatRentFare", roomPrc);
		int sunOffRentResult = sqlSession.insert("Setting.insertOffSunRentFare", roomPrc);
		
		int monOffResult = sqlSession.insert("Setting.insertOffMonStayFare", roomPrc);
		int tueOffResult = sqlSession.insert("Setting.insertOffTueStayFare", roomPrc);
		int wedOffResult = sqlSession.insert("Setting.insertOffWedStayFare", roomPrc);
		int thuOffResult = sqlSession.insert("Setting.insertOffThuStayFare", roomPrc);
		int friOffResult = sqlSession.insert("Setting.insertOffFriStayFare", roomPrc);
		int satOffResult = sqlSession.insert("Setting.insertOffSatStayFare", roomPrc);
		int sunOffResult = sqlSession.insert("Setting.insertOffSunStayFare", roomPrc);
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		// 성수기 ///////////////////////////////////////////////////////////////////////////////////////
		int monRentResult = sqlSession.insert("Setting.insertMonRentFare", roomPrc);
		int tueRentResult = sqlSession.insert("Setting.insertTueRentFare", roomPrc);
		int wedRentResult = sqlSession.insert("Setting.insertWedRentFare", roomPrc);
		int thuRentResult = sqlSession.insert("Setting.insertThuRentFare", roomPrc);
		int friRentResult = sqlSession.insert("Setting.insertFriRentFare", roomPrc);
		int satRentResult = sqlSession.insert("Setting.insertSatRentFare", roomPrc);
		int sunRentResult = sqlSession.insert("Setting.insertSunRentFare", roomPrc);
		
		int monResult = sqlSession.insert("Setting.insertMonStayFare", roomPrc);
		int tueResult = sqlSession.insert("Setting.insertTueStayFare", roomPrc);
		int wedResult = sqlSession.insert("Setting.insertWedStayFare", roomPrc);
		int thuResult = sqlSession.insert("Setting.insertThuStayFare", roomPrc);
		int friResult = sqlSession.insert("Setting.insertFriStayFare", roomPrc);
		int satResult = sqlSession.insert("Setting.insertSatStayFare", roomPrc);
		int sunResult = sqlSession.insert("Setting.insertSunStayFare", roomPrc);
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		if(monOffRentResult > 0 && tueOffRentResult > 0 && wedOffRentResult > 0 && thuOffRentResult > 0 && friOffRentResult > 0 && satOffRentResult > 0 &&
				sunOffRentResult > 0 && monOffResult > 0 && tueOffResult > 0 && wedOffResult > 0 && thuOffResult > 0 && friOffResult > 0 
				&& satOffResult > 0 && sunOffResult > 0 && monRentResult > 0 && tueRentResult > 0 && wedRentResult > 0 && thuRentResult > 0 
				&& friRentResult > 0 && satRentResult > 0 && sunRentResult > 0 && monResult > 0 && tueResult > 0 && wedResult > 0 
				&& thuResult > 0 && friResult > 0 && satResult > 0 && sunResult > 0 ) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectHotelInfo(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("Setting.selectHotelInfo");
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelNoshowInfo(SqlSessionTemplate sqlSession) {
		
		
		
		return (ArrayList)sqlSession.selectList("Setting.selectHotelRfdInfo");
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelRfdSWList(SqlSessionTemplate sqlSession) {
		
		
		
		return (ArrayList)sqlSession.selectList("Setting.selectRfdSWList");
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelRfdOWList(SqlSessionTemplate sqlSession) {
		
		
		
		return (ArrayList)sqlSession.selectList("Setting.selectRfdOW");
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectHotelRfdOWEList(SqlSessionTemplate sqlSession) {
		
		
		
		return (ArrayList)sqlSession.selectList("Setting.selectRfdOWE");
	}

	@Override
	public RoomType selectMinPerMaxPer(SqlSessionTemplate sqlSession, int rtNo) {
		
		return sqlSession.selectOne("Setting.selectMinPerMaxPer", rtNo);
	}

	@Override
	public int insertAddNewRoomDetail(SqlSessionTemplate sqlSession, ArrayList<Room> roomList) {

		int result = 0;
		
		for(int i = 0; i < roomList.size(); i++) {
			result = sqlSession.insert("Setting.insertAddNewRoomDetail", roomList.get(i));
		}
		
		return result;
	}

	@Override
	public int updateRoomDisable(SqlSessionTemplate sqlSession, int[] rmNo) {

		int result = 0;
		
		for(int i = 0; i < rmNo.length; i++) {
			result = sqlSession.update("Setting.updateRoomDisable", rmNo[i]);
		}
		
		return result;
	}

	@Override
	public int updateRoomEnable(SqlSessionTemplate sqlSession, int[] rmNo) {
		
		int result = 0;
		
		for(int i = 0; i < rmNo.length; i++) {
			result = sqlSession.update("Setting.updateRoomEnable", rmNo[i]);
		}
		
		return result;
	}


}
