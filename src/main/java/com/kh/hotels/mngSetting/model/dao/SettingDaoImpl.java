package com.kh.hotels.mngSetting.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.voEtc.Room;
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


}
