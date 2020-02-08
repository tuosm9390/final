package com.kh.hotels.mngReserv.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngReserv.model.vo.ReservHisList;

public interface ReservHisDao {

	ArrayList<ReservHisList> goReservHis(SqlSessionTemplate sqlSession);

	ArrayList<ReservHisList> searchReservHisDay(SqlSessionTemplate sqlSession, String day);

}
