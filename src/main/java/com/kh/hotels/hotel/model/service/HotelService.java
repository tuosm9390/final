package com.kh.hotels.hotel.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Ans;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

public interface HotelService {

	Map<String, RoomInfo> selectRoomList();

	RoomInfo selectRoom(int roomType);

	ReservationCheck reservationCheck(ReservationCheck rsv);

	int insertReservation(ReservationCheck rsvCheck);

	int reservationCnt(String rsvNo);

	int insertMember(ReservationCheck rsvCheck);

	Member selectMember(ReservationCheck rsvCheck);

	List<Que> selectQnAList(PageInfo pi) throws QnASelectListException;

	int insertQnA(Que q);

	Member selectMember(Member m);

	int insertMember(Member m);

	int listCount(Map<String, Object> map);

	Que selectOneQnA(Que q);

	Ans selectOneAns(Que q);

	Member selectMember(Que selectQnA);

	List<RoomInfo> selectRoomNoList(int roomType);

	int insertBreakfast(ReservationCheck rsvCheck);
}
