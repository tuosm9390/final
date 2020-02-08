package com.kh.hotels.mngReserv.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngReserv.model.vo.ReservHisList;

public interface ReservHisService {

	ArrayList<ReservHisList> goReservHis();

	ArrayList<ReservHisList> searchReservHisDay(String day);

}
