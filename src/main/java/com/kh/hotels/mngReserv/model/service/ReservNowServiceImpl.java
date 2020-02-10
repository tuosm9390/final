package com.kh.hotels.mngReserv.model.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.hotel.model.service.HotelService;
import com.kh.hotels.mngReserv.model.dao.ReservNowDao;
import com.kh.hotels.mngReserv.model.vo.RoomInfo;
import com.kh.hotels.mngRooms.model.exception.BrokenRoomException;
import com.kh.hotels.mngRooms.model.vo.BrokenRoom;
import com.kh.hotels.mngRooms.model.vo.CheckIn;
import com.kh.hotels.mngRooms.model.vo.RoomList;

@Service
public class ReservNowServiceImpl implements ReservNowService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservNowDao nd;
	
	@Autowired
	private HotelService hs;

	@Override
	public ArrayList<RoomInfo> selectRoomInfo() {
		return nd.selectRoomInfo(sqlSession);
	}

	@Override
	public ArrayList<RoomList> selectRoomList() {
		return nd.selectRoomList(sqlSession);
	}

	@Override
	public BrokenRoom ajxFindBrokenHis(int rmNo) {
		return nd.ajxFindBrokenHis(sqlSession, rmNo);
	}

	@Override
	public ArrayList<RoomList> searchReservNowDay(String day) {
		return nd.searchReservNowDay(sqlSession, day);
	}

	@Override
	public void insertMember(CheckIn checkIn) {
		nd.insertMember(sqlSession, checkIn);
	}

	@Override
	public int selectMno(CheckIn checkIn) {
		return nd.selectMno(sqlSession, checkIn);
	}

	@Override
	public void insertReserv(CheckIn checkIn) {
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;
		int nDay = calendar.get(Calendar.DAY_OF_MONTH);
		String rsvNo = "";

		if (nMonth < 10) {	rsvNo += nYear + "0" + nMonth;	}
		else {	rsvNo += nYear + nMonth;	}
		if(nDay < 10) {	rsvNo += "0" + nDay;	}
		else {	rsvNo += nDay;	}

		int rsvNoCnt = hs.reservationCnt(rsvNo);

		if (rsvNoCnt < 9) {
			rsvNo += "00" + (int) (rsvNoCnt + 1);
		} else if (rsvNoCnt < 99) {
			rsvNo += "0" + (int) (rsvNoCnt + 1);
		} else {
			rsvNo += (int) (rsvNoCnt + 1);
		}
		
		checkIn.setRsvNo(rsvNo);
		
		
		
		nd.insertRsv(sqlSession, checkIn);
		nd.insertRsvHis(sqlSession, checkIn);
		
		if(checkIn.getCreditCard() != 0) {
			checkIn.setPayWay("CARD"); checkIn.setPayWayMoney(checkIn.getCreditCard());
			nd.insertPayment(sqlSession, checkIn);
		}
		if(checkIn.getCash() != 0) {
			checkIn.setPayWay("CASH"); checkIn.setPayWayMoney(checkIn.getCash());
			nd.insertPayment(sqlSession, checkIn);
		}
		if(checkIn.getAccount() != 0) {
			checkIn.setPayWay("ACCOUNT"); checkIn.setPayWayMoney(checkIn.getAccount());
			nd.insertPayment(sqlSession, checkIn);
		}
		
		String[] svcList = checkIn.getSelSvc().split(",");
		String[] svcCnt = checkIn.getSvcCnt().split(",");
		ArrayList<Integer> tempSvc = new ArrayList<Integer>();
		if(svcList.length > 1) {
			for(int i = 1; i < svcList.length; i++) {
				checkIn.setSvcCode(svcList[i]);
				checkIn.setSvcCount(Integer.parseInt(svcCnt[i]));
				tempSvc.add(nd.insertSvcUse(sqlSession, checkIn));
				tempSvc.add(nd.insertSvcUseHis(sqlSession, checkIn));
			}
		}
	}

}
