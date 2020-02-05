package com.kh.hotels.mngRooms.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.dao.RoomsDao;
import com.kh.hotels.mngRooms.model.exception.BrokenRoomException;
import com.kh.hotels.mngRooms.model.exception.InsertStayException;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.exception.UpdateRoomException;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.ModalClient;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.RuleInfo;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

@Service
public class RoomsServiceImpl implements RoomsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RoomsDao rd;

	@Override
	public ArrayList<RoomList> viewRoomList() throws RoomListException {
		ArrayList<RoomList> roomList = rd.viewRoomList(sqlSession);
		return roomList;
	}

	@Override
	public ArrayList<Prc> viewRoomPrice() throws RoomListException {
		ArrayList<Prc> roomPrice = rd.viewRoomPrice(sqlSession);
		return roomPrice;
	}

	@Override
	public ArrayList<ServiceList> viewServiceList() throws RoomListException {
		ArrayList<ServiceList> svcList = rd.viewServiceList(sqlSession);
		return svcList;
	}
	
	@Override
	public RuleInfo viewRuleInfo() throws RoomListException {
		RuleInfo ruleInfo = rd.viewRuleInfo(sqlSession);
		return ruleInfo;
	}

	@Override
	public ArrayList<Member> ajxFindClient(String searchName) {
		ArrayList<Member> clientList = rd.ajxFindClient(sqlSession, searchName);
		return clientList;
	}
	
	@Override
	public void ajxInsertClient(CheckIn newClient) throws InsertStayException {
		int result = rd.ajxInsertClient(sqlSession, newClient);
		if(result > 0) {
		} else {
			throw new InsertStayException("Error : Insert Client Failed");
		}
	}

	@Override
	public ArrayList<Member> ajxFindTempClient(String hipen) {
		ArrayList<Member> clientList = rd.ajxFindTempClient(sqlSession, hipen);
		return clientList;
	}
	
	@Override
	public void insertTempMember(CheckIn checkIn) throws InsertStayException {
		int result = rd.insertTempMember(sqlSession, checkIn);
		if(result > 0) {
		} else {
			throw new InsertStayException("Error : Insert tempMember Failed");
		}
	}
	
	@Override
	public int selectMno(String clientName) {
		return rd.selectMno(sqlSession, clientName);
	}

	@Override
	public void insertCheckIn(CheckIn checkIn) throws InsertStayException {
		int result1 = rd.insertCIstay(sqlSession, checkIn);
		int result2 = rd.insertCIstayHis(sqlSession);

		int result3 = 0; int result31, result32, result33;
		if(checkIn.getCreditCard() != 0) {
			checkIn.setPayWay("CARD"); checkIn.setPayWayMoney(checkIn.getCreditCard());
			result31 = rd.insertCIpayment(sqlSession, checkIn);
		} else { result31 = 1; }
		if(checkIn.getCash() != 0) {
			checkIn.setPayWay("CASH"); checkIn.setPayWayMoney(checkIn.getCash());
			result32 = rd.insertCIpayment(sqlSession, checkIn);
		} else { result32 = 1; }
		if(checkIn.getAccount() != 0) {
			checkIn.setPayWay("ACCOUNT"); checkIn.setPayWayMoney(checkIn.getAccount());
			result33 = rd.insertCIpayment(sqlSession, checkIn);
		} else { result33 = 1; }
		if(result31 > 0 && result32 > 0 && result33 > 0) {
			result3 = 1;
		}
		
		int result4 = 0;
		String[] svcList = checkIn.getSelSvc().split(",");
		String[] svcCnt = checkIn.getSvcCnt().split(",");
		ArrayList<Integer> tempSvc = new ArrayList<Integer>();
		if(svcList.length > 1) {
			for(int i = 1; i < svcList.length; i++) {
				checkIn.setSvcCode(svcList[i]);
				checkIn.setSvcCount(Integer.parseInt(svcCnt[i]));
				tempSvc.add(rd.insertCIsvcuse(sqlSession, checkIn));
				tempSvc.add(rd.insertCIsvcuseHis(sqlSession, checkIn));
			}
			for(int j = 0; j < tempSvc.size(); j++) {
				if(tempSvc.get(j) > 0) {
					result4 = 1;
				} else {
					result4 = 0;
				}
			}
		} else { result4 = 1; }
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
		} else {
			throw new InsertStayException("Error : Insert Stay Failed");
		}
		
	}

	@Override
	public BrokenRoom ajxFindBrokenHis(int rmNo) throws BrokenRoomException {
		BrokenRoom brkRoom = rd.ajxFindBrokenHis(sqlSession, rmNo);
		if(brkRoom == null) {
			throw new BrokenRoomException("Error : View BrokenDetail Failed");
		}
		return brkRoom;
	}

	@Override
	public void ajxUpdateBrkStt(int rmNo) throws BrokenRoomException {
		int result = rd.ajxUpdateBrkStt(sqlSession, rmNo);
		if(result > 0) {
		} else {
			throw new BrokenRoomException("Error : Insert Client Failed");
		}
	}

	@Override
	public int ajxUpdateRoomStt(String nowStt, int rmNo) throws UpdateRoomException {
		int result = 0;
		if(nowStt.equals("noClean")) {
			result = rd.ajxUpdateRoomClean(sqlSession, rmNo);
		} else if(nowStt.equals("clean")) {
			result = rd.ajxUpdateRoomNoClean(sqlSession, rmNo);
		}
		
		if(result > 0) {
		} else {
			throw new UpdateRoomException("Error : Update CleanStatus Failed");
		}
		
		return result;
	}

	@Override
	public int ajxUpdateAllRoomStt(String nowStt, ArrayList<String> floorList) {
		int result = 0;
		if(nowStt.equals("clean")) {
			result = rd.ajxUpdateAllRoomSttClean(sqlSession, floorList);
		} else if(nowStt.equals("unclean")) {
			result = rd.ajxUpdateAllRoomSttNoClean(sqlSession, floorList);
		}
		
		return result;
	}

	@Override
	public ModalClient ajxSelectStayInfo(int stayNo) {
		return rd.ajxSelectStayInfo(sqlSession, stayNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectStaySvc(int stayNo) {
		return rd.ajxSelectStaySvc(sqlSession, stayNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectStayPay(int stayNo) {
		return rd.ajxSelectStayPay(sqlSession, stayNo);
	}

	@Override
	public ModalClient ajxSelectRsvInfo(String rsvNo) {
		return rd.ajxSelectRsvInfo(sqlSession, rsvNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectRsvSvc(String rsvNo) {
		return rd.ajxSelectRsvSvc(sqlSession, rsvNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectRsvPay(String rsvNo) {
		return rd.ajxSelectRsvPay(sqlSession, rsvNo);
	}

}
