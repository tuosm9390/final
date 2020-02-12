package com.kh.hotels.hotel.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hotels.hotel.model.dao.HotelDao;
import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Ans;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.Prc;
import com.kh.hotels.mngRooms.model.vo.Rfd;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

@Service
public class HotelServiceImpl implements HotelService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private HotelDao hd;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public ArrayList<RoomInfo> selectRoomList() {
		
		return hd.selectRoomList(sqlSession);
	}

	@Override
	public ArrayList<RoomInfo> selectRoom(int roomType) {
		
		return hd.selectRoom(sqlSession, roomType);
	}

	@Override
	public ReservationCheck reservationCheck(ReservationCheck rsv) {
		
		return hd.reservationCheck(sqlSession, rsv);
	}

	@Override
	public int insertReservation(ReservationCheck rsvCheck) {

		return hd.insertReservation(sqlSession, rsvCheck);
	}

	@Override
	public int reservationCnt(String rsvNo) {
		return hd.reservationCnt(sqlSession, rsvNo);
	}

	@Override
	public int insertMember(ReservationCheck rsvCheck) {

		return hd.insertMember(sqlSession, rsvCheck);
	}

	@Override
	public Member selectMember(ReservationCheck rsvCheck) {

		return hd.selectMember(sqlSession, rsvCheck);
	}

	@Override
	public List<Que> selectQnAList(Map<String, Object> map) throws QnASelectListException {
		
		return hd.selectQnAList(sqlSession, map);
	}

	@Override
	public int insertQnA(Que q) {
		String encPassword = bcryptPasswordEncoder.encode(q.getQpwd());
		q.setQpwd(encPassword);
		
		return hd.insertQnA(sqlSession, q);
	}

	@Override
	public Member selectMember(Member m) {
		return hd.selectMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return hd.insertMember(sqlSession, m);
	}

	@Override
	public int listCount(Map<String, Object> map) {
		return hd.listCount(sqlSession, map);
	}

	@Override
	public Que selectOneQnA(Que q) {
		return hd.selectOneQnA(sqlSession, q);
	}

	@Override
	public Ans selectOneAns(Que q) {
		return hd.selectOneAns(sqlSession, q);
	}

	@Override
	public Member selectMember(Que selectQnA) {
		return hd.selectMember(sqlSession, selectQnA);
	}

	@Override
	public List<RoomInfo> selectRoomNoList(int roomType) {
		return hd.selectRoomNoList(sqlSession, roomType);
	}

	@Override
	public int insertBreakfast(ReservationCheck rsvCheck) {
		return hd.insertBreakfast(sqlSession, rsvCheck);
	}

	@Override
	public int selectRoomType(String rsvNo) {
		return hd.selectRoomType(sqlSession, rsvNo);
	}

	@Override
	public ArrayList<RoomInfo> selectFile(int roomType) {
		return hd.selectFile(sqlSession, roomType);
	}

	@Override
	public int insertPayment(ReservationCheck rsvCheck) {
		return hd.insertPayment(sqlSession, rsvCheck);
	}

	@Override
	public int insertStay(ReservationCheck rsvCheck) {
		return hd.insertStay(sqlSession, rsvCheck);
	}

	@Override
	public int selectStayNo(String rsvNo) {
		return hd.selectStayNo(sqlSession, rsvNo);
	}

	@Override
	public int insertSvcUseHis(ReservationCheck rsvCheck) {
		return hd.insertSvcUseHis(sqlSession, rsvCheck);
	}

	@Override
	public int insertStayUse(ReservationCheck rsvCheck) {
		return hd.insertStayUse(sqlSession, rsvCheck);
	}

	@Override
	public int insertMemberHis(ReservationCheck rsvCheck) {
		return hd.insertMemberHis(sqlSession, rsvCheck);
	}

	@Override
	public int insertReservationHis(ReservationCheck rsvCheck) {
		return hd.insertReservationHis(sqlSession, rsvCheck);
	}

	@Override
	public ArrayList<Prc> selectRoomPrice(int roomType) {
		return hd.selectRoomPrice(sqlSession, roomType);
	}

	@Override
	public ArrayList<Rfd> selectRfdList(Map<String, String> map) {
		return hd.selectRfdList(sqlSession, map);
	}

	@Override
	public int cancelRsv(Map<String, String> map) {
		return hd.cancelRsv(sqlSession, map);
	}

	@Override
	public int cancelRsvHis(Map<String, String> map) {
		return hd.cancelRsvHis(sqlSession, map);
	}

	@Override
	public int cancelRsvSvcUse(Map<String, String> map) {
		return hd.cancelRsvSvcUse(sqlSession, map);
	}

	@Override
	public int cancelRsvSvcUseHis(Map<String, String> map) {
		return hd.cancelRsvSvcUseHis(sqlSession, map);
	}

	@Override
	public int cancelRsvFindSvcNo(Map<String, String> map) {
		return hd.cancelRsvFindSvcNo(sqlSession, map);
	}

	@Override
	public int cancelRsvRFD(Map<String, String> map) {
		return hd.cancelRsvRFD(sqlSession, map);
	}

	// 비밀문의글 조회시 비밀번호 확인
	@Override
	public String matchPwd(Que matchpwd) {
		
		String result = "";
		
		Que q = hd.matchPwd(sqlSession, matchpwd);
		
		if(bcryptPasswordEncoder.matches(matchpwd.getQpwd(), q.getQpwd())){
			result = "success";
		} else {
			result = "error";
		}
		
		return result;
	}

}
