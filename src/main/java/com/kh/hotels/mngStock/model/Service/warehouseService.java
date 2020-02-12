package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kh.hotels.mngStock.model.vo.SearchCondition;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.StrgArea;

public interface warehouseService {

	int insertWarehouse(Model m, Strg st);

	ArrayList<Strg> selectList();

	ArrayList<Strg> searchList(SearchCondition sc);

	ArrayList<StrgArea> detailList(String strgNo);

	int updateWarehouse(Model m, Strg st);

	ArrayList<StrgArea> selectAreaList(String strgNo); 

}
