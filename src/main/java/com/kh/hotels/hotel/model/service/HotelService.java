package com.kh.hotels.hotel.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.mngClient.model.vo.Ans;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.Rfd;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

public interface HotelService {

	ArrayList<RoomInfo> selectRoomList();

	ArrayList<RoomInfo> selectRoom(int roomType);

	ReservationCheck reservationCheck(ReservationCheck rsv);

	int insertReservation(ReservationCheck rsvCheck);

	int reservationCnt(String rsvNo);

	int insertMember(ReservationCheck rsvCheck);

	Member selectMember(ReservationCheck rsvCheck);

	int insertQnA(Que q);

	Member selectMember(Member m);

	int insertMember(Member m);

	int listCount(Map<String, Object> map);

	Que selectOneQnA(Que q);

	Ans selectOneAns(Que q);

	Member selectMember(Que selectQnA);

	List<RoomInfo> selectRoomNoList(int roomType);

	int insertBreakfast(ReservationCheck rsvCheck);

	List<Que> selectQnAList(Map<String, Object> map) throws QnASelectListException;

	int selectRoomType(String rsvNo);

	ArrayList<RoomInfo> selectFile(int roomType);

	int insertPayment(ReservationCheck rsvCheck);

	int insertStay(ReservationCheck rsvCheck);

	int selectStayNo(String rsvNo);

	int insertSvcUseHis(ReservationCheck rsvCheck);

	int insertStayUse(ReservationCheck rsvCheck);

	int insertMemberHis(ReservationCheck rsvCheck);

	int insertReservationHis(ReservationCheck rsvCheck);

	ArrayList<Prc> selectRoomPrice(int roomType);

	ArrayList<Rfd> selectRfdList(Map<String, String> map);
}
