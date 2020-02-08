package com.kh.hotels.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

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

@Component
public class CommonDaoImpl implements CommonDao{


	@Override
	public int selectHotelInfoCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Common.selectHotelInfoCount");
	}

	@Override
	public int insertHotelInfo(Info info, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Common.insertHotelInfo", info);
	}

	@Override
	public int insertHotelRule(Rule rule, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Common.insertHotelRule", rule);
	}

	@Override
	public int insertHotelLaw(Law law, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("Common.insertHotelLaw", law);
	}

	@Override
	public int insertHotelBasic(Basic basic, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Common.insertHotelBasic", basic);
	}

	@Override
	public int insertHotelNoShow(NoShow noShow, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("Common.insertHotelNoShow", noShow);
	}

	@Override
	public int insertHotelCalculate(Cal cal, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Common.insertHotelCalculate", cal);
	}


	@Override
	public int insertHotelRefund(OffSeason offSeason, Season season,
			SqlSessionTemplate sqlSession) {
		
		int result = 0;
		int seasonResult1 = sqlSession.insert("Common.insertHotelRefundSeasonList", season);
		int seasonResult2 = sqlSession.insert("Common.insertHotelRefundSeasonList2", season);
		int seasonResult3 = sqlSession.insert("Common.insertHotelRefundSeasonList3", season);
		int seasonResult4 = sqlSession.insert("Common.insertHotelRefundSeasonList4", season);
		int seasonResult5 = sqlSession.insert("Common.insertHotelRefundSeasonList5", season);
		int seasonResult6 = sqlSession.insert("Common.insertHotelRefundSeasonList6", season);
		int seasonResult7 = sqlSession.insert("Common.insertHotelRefundSeasonList7", season);
		int seasonResult8 = sqlSession.insert("Common.insertHotelRefundSeasonList8", season);
		int seasonResult9 = sqlSession.insert("Common.insertHotelRefundSeasonList9", season);
		int seasonResult10 = sqlSession.insert("Common.insertHotelRefundSeasonList10", season);
		int seasonResult11 = sqlSession.insert("Common.insertHotelRefundSeasonList11", season);
		int seasonResult12 = sqlSession.insert("Common.insertHotelRefundSeasonList12", season);
		int offSeasonResult1 = sqlSession.insert("Common.insertHotelRefundOffSeasonList", offSeason);
		int offSeasonResult2 = sqlSession.insert("Common.insertHotelRefundOffSeasonList2", offSeason);
		int offSeasonResult3 = sqlSession.insert("Common.insertHotelRefundOffSeasonList3", offSeason);
		int offSeasonResult4 = sqlSession.insert("Common.insertHotelRefundOffSeasonList4", offSeason);
		int offSeasonResult5 = sqlSession.insert("Common.insertHotelRefundOffSeasonList5", offSeason);
		int offSeasonResult6 = sqlSession.insert("Common.insertHotelRefundOffSeasonList6", offSeason);
		
		if(seasonResult1 > 0 && seasonResult2 > 0 && seasonResult3 > 0 && seasonResult4 > 0 && seasonResult5 > 0 && seasonResult6 > 0 && seasonResult7 > 0 
				&& seasonResult8 > 0 && seasonResult9 > 0 && seasonResult10 > 0 && seasonResult11 > 0 && seasonResult12 > 0 && offSeasonResult1 > 0 && offSeasonResult2 > 0 
				&& offSeasonResult3 > 0 && offSeasonResult4 > 0 && offSeasonResult5 > 0 && offSeasonResult6 > 0 ) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
		
	}

	@Override
	public int insertHotelRoomType(ArrayList<RoomType> roomTypeList, SqlSessionTemplate sqlSession) {

		int result = 0;
		
		for(int i = 0; i < roomTypeList.size(); i++ ) {
			result = sqlSession.insert("Common.insertHotelRoomType", roomTypeList.get(i));
		}
		
		return result;
	}

	@Override
	public int selectRtNo(String string, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Common.selectRtNo", string);
	}

	@Override
	public int insertHotelRoom(ArrayList<Room> roomList, SqlSessionTemplate sqlSession) {

		int result = 0;
		
		for(int i = 0; i < roomList.size(); i++) {
			result = sqlSession.insert("Common.insertHotelRoom", roomList.get(i));
		}
		
		return result;
	}

	@Override
	public int selectRtNoFare(String string, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Common.selectRtNoFare", string);
	}

	@Override
	public int insertHotelRoomFare(ArrayList<RoomPrc> roomPrcList, SqlSessionTemplate sqlSession) {
		
		int result = 0;
		for(int i = 0; i < roomPrcList.size(); i++) {
			// 비성수기 /////////////////////////////////////////////////////////////////////////////////////
			int monOffRentResult = sqlSession.insert("Common.insertOffMonRentFare", roomPrcList.get(i));
			int tueOffRentResult = sqlSession.insert("Common.insertOffTueRentFare", roomPrcList.get(i));
			int wedOffRentResult = sqlSession.insert("Common.insertOffWedRentFare", roomPrcList.get(i));
			int thuOffRentResult = sqlSession.insert("Common.insertOffThuRentFare", roomPrcList.get(i));
			int friOffRentResult = sqlSession.insert("Common.insertOffFriRentFare", roomPrcList.get(i));
			int satOffRentResult = sqlSession.insert("Common.insertOffSatRentFare", roomPrcList.get(i));
			int sunOffRentResult = sqlSession.insert("Common.insertOffSunRentFare", roomPrcList.get(i));
			
			int monOffResult = sqlSession.insert("Common.insertOffMonStayFare", roomPrcList.get(i));
			int tueOffResult = sqlSession.insert("Common.insertOffTueStayFare", roomPrcList.get(i));
			int wedOffResult = sqlSession.insert("Common.insertOffWedStayFare", roomPrcList.get(i));
			int thuOffResult = sqlSession.insert("Common.insertOffThuStayFare", roomPrcList.get(i));
			int friOffResult = sqlSession.insert("Common.insertOffFriStayFare", roomPrcList.get(i));
			int satOffResult = sqlSession.insert("Common.insertOffSatStayFare", roomPrcList.get(i));
			int sunOffResult = sqlSession.insert("Common.insertOffSunStayFare", roomPrcList.get(i));
			///////////////////////////////////////////////////////////////////////////////////////////////
			
			// 성수기 ///////////////////////////////////////////////////////////////////////////////////////
			int monRentResult = sqlSession.insert("Common.insertMonRentFare", roomPrcList.get(i));
			int tueRentResult = sqlSession.insert("Common.insertTueRentFare", roomPrcList.get(i));
			int wedRentResult = sqlSession.insert("Common.insertWedRentFare", roomPrcList.get(i));
			int thuRentResult = sqlSession.insert("Common.insertThuRentFare", roomPrcList.get(i));
			int friRentResult = sqlSession.insert("Common.insertFriRentFare", roomPrcList.get(i));
			int satRentResult = sqlSession.insert("Common.insertSatRentFare", roomPrcList.get(i));
			int sunRentResult = sqlSession.insert("Common.insertSunRentFare", roomPrcList.get(i));
			
			int monResult = sqlSession.insert("Common.insertMonStayFare", roomPrcList.get(i));
			int tueResult = sqlSession.insert("Common.insertTueStayFare", roomPrcList.get(i));
			int wedResult = sqlSession.insert("Common.insertWedStayFare", roomPrcList.get(i));
			int thuResult = sqlSession.insert("Common.insertThuStayFare", roomPrcList.get(i));
			int friResult = sqlSession.insert("Common.insertFriStayFare", roomPrcList.get(i));
			int satResult = sqlSession.insert("Common.insertSatStayFare", roomPrcList.get(i));
			int sunResult = sqlSession.insert("Common.insertSunStayFare", roomPrcList.get(i));
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
		}
		
		
		return result;
	}

	@Override
	public int insertHotelService(ArrayList<Svc> svcList, SqlSessionTemplate sqlSession) {
		
		int result = 0;
		
		for(int i = 0; i < svcList.size(); i++) {
			
			result = sqlSession.insert("Common.insertHotelService", svcList.get(i));
			
		}
		
		return result;
	}

	@Override
	public int selectPhotoRtNo(String string, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Common.selectRtNo", string);
	}

	@Override
	public int insertHotelPhoto(ArrayList<Attach> attachList, SqlSessionTemplate sqlSession) {
		
		int result = 0;
		
		for(int i = 0; i < attachList.size(); i++) {
			result = sqlSession.insert("Common.insertHotelPhoto", attachList.get(i));
		}
		
		return result;
	}

	@Override
	public int deleteInformation(SqlSessionTemplate sqlSession) {
		
		int result  = 0;
		int result1 = sqlSession.delete("Common.deleteInfo");
		int result2 = sqlSession.delete("Common.deleteRule");
		int result4 = sqlSession.delete("Common.deleteRfd");
		int result5 = sqlSession.delete("Common.deleteNoshow");
		int result6 = sqlSession.delete("Common.deleteBasic");
		int result7 = sqlSession.delete("Common.deleteCal");
		int result8 = sqlSession.delete("Common.deleteLaw");
		
		System.out.println("result1 : " + result1);
		System.out.println("result2 : " + result2);
		System.out.println("result4 : " + result4);
		System.out.println("result5 : " + result5);
		System.out.println("result6 : " + result6);
		System.out.println("result7 : " + result7);
		System.out.println("result8 : " + result8);
		
		if(result1 > 0 && result2 > 0 &&  result4 > 0 && result5 > 0 && result6 > 0 && result7 > 0 && result8 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	
}
