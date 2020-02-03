package com.kh.hotels.mngRooms.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.BrokenRoomException;
import com.kh.hotels.mngRooms.model.exception.InsertStayException;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.exception.UpdateRoomException;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.RuleInfo;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

public interface RoomsService {

	ArrayList<RoomList> viewRoomList() throws RoomListException;

	ArrayList<Prc> viewRoomPrice() throws RoomListException;

	ArrayList<ServiceList> viewServiceList() throws RoomListException;

	RuleInfo viewRuleInfo() throws RoomListException;
	
	ArrayList<Member> ajxFindClient(String searchName);

	void ajxInsertClient(CheckIn newClient) throws InsertStayException;

	ArrayList<Member> ajxFindTempClient(String hipen);

	void insertTempMember(CheckIn checkIn) throws InsertStayException;

	int selectMno(String clientName);

	void insertCheckIn(CheckIn checkIn) throws InsertStayException;

	BrokenRoom ajxFindBrokenHis(int rmNo) throws BrokenRoomException;

	void ajxUpdateBrkStt(int rmNo) throws BrokenRoomException;

	int ajxUpdateRoomStt(String nowStt, int rmNo) throws UpdateRoomException;

	int ajxUpdateAllRoomStt(String nowStt, ArrayList<String> floorList);

}
