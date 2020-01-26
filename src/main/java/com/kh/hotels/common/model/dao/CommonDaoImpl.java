package com.kh.hotels.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.kh.hotels.common.model.vo.Basic;
import com.kh.hotels.common.model.vo.Cal;
import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.common.model.vo.Law;
import com.kh.hotels.common.model.vo.NoShow;
import com.kh.hotels.common.model.vo.OffSeason;
import com.kh.hotels.common.model.vo.Rule;
import com.kh.hotels.common.model.vo.Season;
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

		return sqlSession.insert("Common.insertHotelRoomType", roomTypeList);
	}
	
}
