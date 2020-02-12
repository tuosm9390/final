package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;

public interface AccountService {

	int getListCount();

	ArrayList<Conn> selectAccountList(PageInfo pi);

	ArrayList<Conn> selectDetailList(String cnCode);

	int insertAcc(Conn c);

	int insertDetailAcc(Conn c);

	int updateDetail(Conn c);

	int updateAcc(Conn c);

}
