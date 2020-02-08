package com.kh.hotels.common.model.service;


import java.util.ArrayList;

import com.kh.hotels.common.model.vo.Attach;
import com.kh.hotels.common.model.vo.Basic;
import com.kh.hotels.common.model.vo.Cal;
import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.common.model.vo.Law;
import com.kh.hotels.common.model.vo.NoShow;
import com.kh.hotels.common.model.vo.OffSeason;
import com.kh.hotels.common.model.vo.Rfd;
import com.kh.hotels.common.model.vo.Rule;
import com.kh.hotels.common.model.vo.Season;
import com.kh.hotels.common.model.vo.Svc;
import com.kh.hotels.mngRooms.model.voEtc.Room;
import com.kh.hotels.mngRooms.model.voEtc.RoomPrc;
import com.kh.hotels.mngRooms.model.voEtc.RoomType;

public interface CommonService {

	int selectHotelInfoCount();

	int insertHotelInfomation(Info info, Rule rule, Law law, Basic basic, NoShow noShow, Cal cal, Rfd rfd,
			OffSeason offSeason, Season season);

	int insertHotelRoomType(ArrayList<RoomType> roomTypeList);

	int selectRtNo(String string);

	int insertHotelRoom(ArrayList<Room> roomList);

	int selectRtNoFare(String string);

	int insertHotelRoomFare(ArrayList<RoomPrc> roomPrcList);

	int insertHotelService(ArrayList<Svc> svcList);

	int selectPhotoRtNo(String string);

	int insertHotelPhoto(ArrayList<Attach> attachList);

	int deleteInfomation();


}
