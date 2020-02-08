package com.kh.hotels.mngReserv.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngReserv.model.vo.ReservHisList;

@Repository
public class ReservHisDaoImpl implements ReservHisDao {

	@Override
	public ArrayList<ReservHisList> goReservHis(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Reserv.goReservHis");
	}

	@Override
	public ArrayList<ReservHisList> searchReservHisDay(SqlSessionTemplate sqlSession, String day) {
		return (ArrayList) sqlSession.selectList("Reserv.searchReservHisDay", day);
	}

}
