package com.kh.hotels.hotel.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Ans;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.Rfd;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

@Component
//@Repository
public class HotelDaoImpl implements HotelDao{

	@Override
	public ArrayList<RoomInfo> selectRoomList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("hotel.selectRoomList");
	}

	@Override
	public ArrayList<RoomInfo> selectRoom(SqlSessionTemplate sqlSession, int roomType) {
		
		return (ArrayList)sqlSession.selectList("hotel.selectRoom", roomType);
	}

	@Override
	public ReservationCheck reservationCheck(SqlSessionTemplate sqlSession, ReservationCheck rsv) {

		return sqlSession.selectOne("hotel.reservationCheck", rsv);
	}

	@Override
	public int insertReservation(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		
		return sqlSession.insert("hotel.insertReservation", rsvCheck);
	}

	@Override
	public int reservationCnt(SqlSessionTemplate sqlSession, String rsvNo) {
		
		return sqlSession.selectOne("hotel.reservationCnt", rsvNo);
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		
		return sqlSession.insert("hotel.insertMember", rsvCheck);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {

		return sqlSession.selectOne("hotel.selectMember", rsvCheck);
	}

	@Override
	public List<Que> selectQnAList(SqlSessionTemplate sqlSession, Map<String, Object> map) throws QnASelectListException {
		List<Que> list = null;
		
		int offset = (((PageInfo)(map.get("pi"))).getCurrentPage() - 1) * ((PageInfo)(map.get("pi"))).getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, ((PageInfo)(map.get("pi"))).getLimit());
		
		System.out.println("dao pi : " + ((PageInfo)(map.get("pi"))));
		
		list = (List) sqlSession.selectList("hotel.selectQnAList", map, rowBounds);
		
		if(list == null) {
			throw new QnASelectListException("게시물 조회 실패!");
		}
		
		return list;
	}

	@Override
	public int insertQnA(SqlSessionTemplate sqlSession, Que q) {
		return sqlSession.insert("hotel.insertQnA", q);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("hotel.selectQnAMember", m);
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("hotel.insertQnAMember", m);
	}

	@Override
	public int listCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("hotel.selectListCount", map);
	}

	@Override
	public Que selectOneQnA(SqlSessionTemplate sqlSession, Que q) {
		return sqlSession.selectOne("hotel.selectOneQnA", q);
	}

	@Override
	public Ans selectOneAns(SqlSessionTemplate sqlSession, Que q) {
		return sqlSession.selectOne("hotel.selectOneAns", q);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Que selectQnA) {
		return sqlSession.selectOne("hotel.selectQueMember", selectQnA);
	}

	@Override
	public List<RoomInfo> selectRoomNoList(SqlSessionTemplate sqlSession, int roomType) {
		return sqlSession.selectList("hotel.selectRoomNoList", roomType);
	}

	@Override
	public int insertBreakfast(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		return sqlSession.insert("hotel.insertBreakfast", rsvCheck);
	}

	@Override
	public int selectRoomType(SqlSessionTemplate sqlSession, String rsvNo) {
		return sqlSession.selectOne("hotel.selectRoomType", rsvNo);
	}

	@Override
	public ArrayList<RoomInfo> selectFile(SqlSessionTemplate sqlSession, int roomType) {
		return (ArrayList)sqlSession.selectList("hotel.selectFile", roomType);
	}

	@Override
	public int insertPayment(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		return sqlSession.insert("hotel.insertPayment", rsvCheck);
	}

	@Override
	public int insertStay(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		return sqlSession.insert("hotel.insertStay", rsvCheck);
	}

	@Override
	public int selectStayNo(SqlSessionTemplate sqlSession, String rsvNo) {
		return sqlSession.selectOne("hotel.selectStayNo", rsvNo);
	}

	@Override
	public int insertSvcUseHis(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		return sqlSession.insert("hotel.insertSvcUseHis", rsvCheck);
	}

	@Override
	public int insertStayUse(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		return sqlSession.insert("hotel.insertStayHis", rsvCheck);
	}

	@Override
	public int insertMemberHis(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		return sqlSession.insert("hotel.insertMemberHis", rsvCheck);
	}

	@Override
	public int insertReservationHis(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		return sqlSession.insert("hotel.insertReservationHis", rsvCheck);
	}

	@Override
	public ArrayList<Prc> selectRoomPrice(SqlSessionTemplate sqlSession, int roomType) {
		return (ArrayList)sqlSession.selectList("hotel.selectRoomPrice", roomType);
	}

	@Override
	public ArrayList<Rfd> selectRfdList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return (ArrayList)sqlSession.selectList("hotel.selectRfdList", map);
	}

	@Override
	public int cancelRsv(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("hotel.cancelRsv", map);
	}

	@Override
	public int cancelRsvHis(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("hotel.cancelRsvHis", map);
	}

	@Override
	public int cancelRsvSvcUse(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("hotel.cancelRsvSvcUse", map);
	}

	@Override
	public int cancelRsvSvcUseHis(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("hotel.cancelRsvSvcUseHis", map);
	}

	@Override
	public int cancelRsvFindSvcNo(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("hotel.cancelRsvFindSvcNo", map);
	}

	@Override
	public int cancelRsvRFD(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("hotel.cancelRsvRFD", map);
	}

	@Override
	public Que matchPwd(SqlSessionTemplate sqlSession, Que matchpwd) {
		return sqlSession.selectOne("hotel.matchPwd", matchpwd);
	}



}
