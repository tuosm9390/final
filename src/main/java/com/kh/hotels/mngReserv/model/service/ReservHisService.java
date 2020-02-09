package com.kh.hotels.mngReserv.model.service;

import java.util.ArrayList;

import com.kh.hotels.mngReserv.model.vo.ReservHisList;
import com.kh.hotels.mngReserv.model.vo.RoomInfo;

public interface ReservHisService {

	ArrayList<ReservHisList> goReservHis();

	ArrayList<ReservHisList> searchReservHisDay(String day);

}
