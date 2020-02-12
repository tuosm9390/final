package com.kh.hotels.mngRooms.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
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

@Repository
public class RoomsDaoImpl implements RoomsDao {
 
	@Override
	public ArrayList<RoomList> viewRoomList(SqlSessionTemplate sqlSession) throws RoomListException {
		ArrayList<RoomList> roomList = (ArrayList) sqlSession.selectList("Rooms.viewRoomList");
		if(roomList == null) {
			throw new RoomListException("Error : View RoomList Failed");
		}
		return roomList;
	}

	@Override
	public ArrayList<Prc> viewRoomPrice(SqlSessionTemplate sqlSession) throws RoomListException {
		ArrayList<Prc> roomPrice = (ArrayList) sqlSession.selectList("Rooms.viewRoomPrice");
		if(roomPrice == null) {
			throw new RoomListException("Error : View RoomPrice Failed");
		}
		return roomPrice;
	}

	@Override
	public ArrayList<ServiceList> viewServiceList(SqlSessionTemplate sqlSession) throws RoomListException {
		ArrayList<ServiceList> svcList = (ArrayList) sqlSession.selectList("Rooms.viewServiceList");
		if(svcList == null) {
			throw new RoomListException("Error : View ServiceList Failed");
		}
		return svcList;
	}
	
	@Override
	public RuleInfo viewRuleInfo(SqlSessionTemplate sqlSession) throws RoomListException {
		RuleInfo ruleInfo = (RuleInfo) sqlSession.selectOne("Rooms.viewRuleInfo");
		if(ruleInfo == null) {
			throw new RoomListException("Error : View RuleInfo Failed");
		}
		return ruleInfo;
	}
	
	@Override
	public Rfd viewRefundRate(SqlSessionTemplate sqlSession) {
		return (Rfd) sqlSession.selectOne("Rooms.viewRefundRate");
	}

	@Override
	public ArrayList<Member> ajxFindClient(SqlSessionTemplate sqlSession, String searchName) {
		ArrayList<Member> clientList = (ArrayList) sqlSession.selectList("Rooms.ajxFindClient", searchName);
		return clientList;
	}
	
	@Override
	public int ajxInsertClient(SqlSessionTemplate sqlSession, CheckIn newClient) {
		return sqlSession.insert("Rooms.ajxInsertClient", newClient);
	}

	@Override
	public ArrayList<Member> ajxFindTempClient(SqlSessionTemplate sqlSession, String hipen) {
		ArrayList<Member> clientList = (ArrayList) sqlSession.selectList("Rooms.ajxFindTempClient", hipen);
		return clientList;
	}
	
	@Override
	public int insertTempMember(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertTempMember", checkIn);
	}
	
	@Override
	public int selectMno(SqlSessionTemplate sqlSession, String clientName) {
		return sqlSession.selectOne("Rooms.selectMno", clientName);
	}

	@Override
	public int insertCIstay(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertCIstay", checkIn);
	}

	@Override
	public int insertCIstayHis(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Rooms.insertCIstayHis");
	}
	
	@Override
	public int insertCIpayment(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertCIpayment", checkIn);
	}

	@Override
	public int insertCIsvcuse(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertCIsvcuse", checkIn);
	}

	@Override
	public int insertCIsvcuseHis(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Rooms.insertCIsvcuseHis", checkIn);
	}

	@Override
	public BrokenRoom ajxFindBrokenHis(SqlSessionTemplate sqlSession, int rmNo) {
		return sqlSession.selectOne("Rooms.ajxFindBrokenHis", rmNo);
	}

	@Override
	public int ajxUpdateBrkStt(SqlSessionTemplate sqlSession, int rmNo) {
		return sqlSession.update("Rooms.ajxUpdateBrkStt", rmNo);
	}

	@Override
	public int ajxUpdateRoomClean(SqlSessionTemplate sqlSession, int rmNo) {
		int result, result1, result2;
		result1 = sqlSession.update("Rooms.ajxUpdateRoomClean", rmNo);
		if(result1 > 0) {
			result2 = sqlSession.insert("Rooms.ajxUpdateRoomCleanHis", rmNo);
			if(result2 > 0) {
				result = 1;
			} else {
				result = 0;
			}
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public int ajxUpdateRoomNoClean(SqlSessionTemplate sqlSession, int rmNo) {
		int result, result1, result2;
		result1 = sqlSession.update("Rooms.ajxUpdateRoomNoClean", rmNo);
		if(result1 > 0) {
			result2 = sqlSession.insert("Rooms.ajxUpdateRoomNoCleanHis", rmNo);
			if(result2 > 0) {
				result = 1;
			} else {
				result = 0;
			}
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public int ajxUpdateAllRoomSttClean(SqlSessionTemplate sqlSession, ArrayList<String> floorList) {
		return sqlSession.update("Rooms.ajxUpdateAllRoomSttClean", floorList);
	}

	@Override
	public int ajxUpdateAllRoomSttNoClean(SqlSessionTemplate sqlSession, ArrayList<String> floorList) {
		return sqlSession.update("Rooms.ajxUpdateAllRoomSttNoClean", floorList);
	}

	@Override
	public ModalClient ajxSelectStayInfo(SqlSessionTemplate sqlSession, int stayNo) {
		return sqlSession.selectOne("Rooms.ajxSelectStayInfo", stayNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectStaySvc(SqlSessionTemplate sqlSession, int stayNo) {
		return (ArrayList) sqlSession.selectList("Rooms.ajxSelectStaySvc", stayNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectStayPay(SqlSessionTemplate sqlSession, int stayNo) {
		return (ArrayList) sqlSession.selectList("Rooms.ajxSelectStayPay", stayNo);
	}

	@Override
	public ModalClient ajxSelectRsvInfo(SqlSessionTemplate sqlSession, String rsvNo) {
		return sqlSession.selectOne("Rooms.ajxSelectRsvInfo", rsvNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectRsvSvc(SqlSessionTemplate sqlSession, String rsvNo) {
		return (ArrayList) sqlSession.selectList("Rooms.ajxSelectRsvSvc", rsvNo);
	}

	@Override
	public ArrayList<ModalClient> ajxSelectRsvPay(SqlSessionTemplate sqlSession, String rsvNo) {
		return (ArrayList) sqlSession.selectList("Rooms.ajxSelectRsvPay", rsvNo);
	}

	@Override
	public void cancelReservRSV(SqlSessionTemplate sqlSession, Rfd rfd) {
		int result = sqlSession.update("Rooms.cancelReservRSV", rfd);
		if(result > 0) {
			sqlSession.insert("Rooms.cancelReservRSVhis", rfd);
		}
	}

	@Override
	public void cancelReservSVC(SqlSessionTemplate sqlSession, Rfd rfd) {
		sqlSession.update("Rooms.cancelReservSVC", rfd);
		ArrayList<Integer> svcList = (ArrayList) sqlSession.selectList("Rooms.cancelReservFindSvc", rfd);
		if(svcList.size() > 0) {
			for(int i = 0; i < svcList.size(); i++) {
				rfd.setSvcNo(svcList.get(i));
				sqlSession.insert("Rooms.cancelReservSVChis", rfd);
			}
		}
	}

	@Override
	public void cancelReservRFD(SqlSessionTemplate sqlSession, Rfd rfd) {
		sqlSession.insert("Rooms.cancelReservRFD", rfd);
	}

	@Override
	public void insertRsvCheckIn(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		int result1 = sqlSession.insert("Rooms.insertRsvCheckIn", checkIn);
		if(result1 > 0) {
			sqlSession.insert("Rooms.insertCIstayHis");
		}
	}

	@Override
	public void updateRsvPayment(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		sqlSession.update("Rooms.updateRsvPayment", checkIn);
	}

	@Override
	public void updateRsvSvc(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		int result = sqlSession.update("Rooms.updateRsvSvc", checkIn);
		if(result > 0) {
			ArrayList<Integer> svcList = (ArrayList) sqlSession.selectList("Rooms.findRsvCISvc", checkIn);
			if(svcList.size() > 0) {
				for(int i = 0; i < svcList.size(); i++) {
					checkIn.setSvcNo(svcList.get(i));
					sqlSession.insert("Rooms.insertRsvSvcHis", checkIn);
				}
			}
		}
		
	}

	@Override
	public void doCheckOut(SqlSessionTemplate sqlSession, int sno) {
		int result = sqlSession.update("Rooms.doCheckOutStay", sno);
		if(result > 0) {
			sqlSession.insert("Rooms.doCheckOutStayHis", sno);
		}
	}

	@Override
	public void updateRoomSttCO(SqlSessionTemplate sqlSession, int sno) {
		int rmNo = sqlSession.selectOne("Rooms.selectCOrmNo", sno);
		int result = sqlSession.update("Rooms.ajxUpdateRoomNoClean", rmNo);
		if(result > 0) {
			sqlSession.insert("Rooms.updateRoomNoCleanCO", rmNo);
		}
	}

	@Override
	public Rfd ajxFindRfdRate(SqlSessionTemplate sqlSession, String checkin) {
		return sqlSession.selectOne("Rooms.ajxFindRfdRate", checkin);
	}

	@Override
	public ArrayList<RequestStayRsv> selectRsrList(SqlSessionTemplate sqlSession, RequestStayRsv rsr) {
		ArrayList<RequestStayRsv> rsrList = (ArrayList)sqlSession.selectList("Rooms.selectRsrList", rsr);
		return rsrList;
	}

	@Override
	public int insertMemo(SqlSessionTemplate sqlSession, RsvMemo rm) {
		return sqlSession.insert("Rooms.insertMemo", rm);
	}

}
