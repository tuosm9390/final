package com.kh.hotels.mngReserv.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngReserv.model.dao.ReservHisDao;
import com.kh.hotels.mngReserv.model.vo.ReservHisList;

@Service
public class ReservHisServiceImpl implements ReservHisService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservHisDao hd;

	@Override
	public ArrayList<ReservHisList> goReservHis() {
		return hd.goReservHis(sqlSession);
	}

	@Override
	public ArrayList<ReservHisList> searchReservHisDay(String day) {
		return hd.searchReservHisDay(sqlSession, day);
	}

}
