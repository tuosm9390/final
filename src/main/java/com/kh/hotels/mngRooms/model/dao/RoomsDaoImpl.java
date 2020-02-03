package com.kh.hotels.mngRooms.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngRooms.model.exception.RoomListException;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.RoomList;
import com.kh.hotels.mngRooms.model.vo.RuleInfo;
import com.kh.hotels.mngRooms.model.vo.ServiceList;

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

}
