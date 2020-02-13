package com.kh.hotels.mngRooms.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.BrokenRoomException;
import com.kh.hotels.mngRooms.model.exception.InsertStayException;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.exception.UpdateRoomException;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.ModalClient;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RequestStayRsv;
import com.kh.hotels.mngRooms.model.vo.Rfd;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.RuleInfo;
import com.kh.hotels.mngRooms.model.vo.ServiceList;
import com.kh.hotels.mngRooms.model.voEtc.RsvMemo;

public interface RoomsService {

	ArrayList<RoomList> viewRoomList() throws RoomListException;

	ArrayList<Prc> viewRoomPrice() throws RoomListException;

	ArrayList<ServiceList> viewServiceList() throws RoomListException;

	RuleInfo viewRuleInfo() throws RoomListException;
	
	Rfd viewRefundRate();
	
	ArrayList<Member> ajxFindClient(String searchName);

	void ajxInsertClient(CheckIn newClient) throws InsertStayException;

	ArrayList<Member> ajxFindTempClient(String hipen);

	void insertTempMember(CheckIn checkIn) throws InsertStayException;

	int selectMno(String clientName);

	void insertCheckIn(CheckIn checkIn) throws InsertStayException;

	BrokenRoom ajxFindBrokenHis(int rmNo) throws BrokenRoomException;

	void ajxUpdateBrkStt(int rmNo);

	int ajxUpdateRoomStt(String nowStt, int rmNo) throws UpdateRoomException;

	int ajxUpdateAllRoomStt(String nowStt, ArrayList<String> floorList);

	ModalClient ajxSelectStayInfo(int stayNo);

	ArrayList<ModalClient> ajxSelectStaySvc(int stayNo);

	ArrayList<ModalClient> ajxSelectStayPay(int stayNo);

	ModalClient ajxSelectRsvInfo(String rsvNo);

	ArrayList<ModalClient> ajxSelectRsvSvc(String rsvNo);

	ArrayList<ModalClient> ajxSelectRsvPay(String rsvNo);

	void cancelReservRSV(Rfd rfd);

	void cancelReservSVC(Rfd rfd);

	void cancelReservRFD(Rfd rfd);

	void insertRsvCheckIn(CheckIn checkIn);

	void doCheckout(int sno);

	Rfd ajxFindRfdRate(String checkin);

	ArrayList<RequestStayRsv> selectRsrList(RequestStayRsv rsr);

	int insertMemo(RsvMemo rm);

	void updateCheckIn(CheckIn checkIn);

	void updateReserv(CheckIn checkIn);

}
