package com.kh.hotels.hotel.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Ans;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

public interface HotelDao {

	Map<String, RoomInfo> selectRoomList(SqlSessionTemplate sqlSession);

	RoomInfo selectRoom(SqlSessionTemplate sqlSession, int roomType);

	ReservationCheck reservationCheck(SqlSessionTemplate sqlSession, ReservationCheck rsv);

	int insertReservation(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck);

	int reservationCnt(SqlSessionTemplate sqlSession, String rsvNo);

	int insertMember(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck);

	Member selectMember(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck);

	List<Que> selectQnAList(SqlSessionTemplate sqlSession, PageInfo pi) throws QnASelectListException;

	int insertQnA(SqlSessionTemplate sqlSession, Que q);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int listCount(SqlSessionTemplate sqlSession);

	Que selectOneQnA(SqlSessionTemplate sqlSession, Que q);

	Ans selectOneAns(SqlSessionTemplate sqlSession, Que q);

	Member selectMember(SqlSessionTemplate sqlSession, Que selectQnA);

	int listCount(SqlSessionTemplate sqlSession, PageInfo pi);

}
