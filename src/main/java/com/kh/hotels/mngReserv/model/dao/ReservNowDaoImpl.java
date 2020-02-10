package com.kh.hotels.mngReserv.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.RoomList;

@Repository
public class ReservNowDaoImpl implements ReservNowDao {

	@Override
	public ArrayList<RoomInfo> selectRoomInfo(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Reserv.selectRoomInfo");
	}

	@Override
	public ArrayList<RoomList> selectRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Reserv.selectRoomList");
	}

	@Override
	public BrokenRoom ajxFindBrokenHis(SqlSessionTemplate sqlSession, int rmNo) {
		return sqlSession.selectOne("Reserv.ajxFindBrokenHis", rmNo);
	}

	@Override
	public ArrayList<RoomList> searchReservNowDay(SqlSessionTemplate sqlSession, String day) {
		return (ArrayList) sqlSession.selectList("Reserv.searchReservNowDay", day);
	}

	@Override
	public void insertMember(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		sqlSession.insert("Reserv.insertMember", checkIn);
	}

	@Override
	public int selectMno(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.selectOne("Reserv.selectMno", checkIn);
	}

	@Override
	public void insertRsv(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		sqlSession.insert("Reserv.insertRsv", checkIn);
	}

	@Override
	public void insertRsvHis(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		sqlSession.insert("Reserv.insertRsvHis", checkIn);
	}

	@Override
	public void insertPayment(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		sqlSession.insert("Reserv.insertPayment", checkIn);
	}

	@Override
	public Integer insertSvcUse(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Reserv.insertSvcUse", checkIn);
	}

	@Override
	public Integer insertSvcUseHis(SqlSessionTemplate sqlSession, CheckIn checkIn) {
		return sqlSession.insert("Reserv.insertSvcUseHis", checkIn);
	}

}
