package com.kh.hotels.mngStock.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hotels.mngStock.model.dao.warehouseDao;
import com.kh.hotels.mngStock.model.vo.SearchCondition;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.StrgArea;

@Service
public class warehouseServiceImpl implements warehouseService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private warehouseDao wd;
	 
	@Override
	public int insertWarehouse(Model m, Strg st) {
		// TODO Auto-generated method stub
		return wd.insertWarehouse(sqlSession, m, st);
	}

	@Override
	public ArrayList<Strg> selectList() {
		// TODO Auto-generated method stub
		return wd.selectList(sqlSession);
	}
  
	@Override
	public ArrayList<Strg> searchList(SearchCondition sc) {
		// TODO Auto-generated method stub
		return wd.searchList(sqlSession,sc); 
	}

	@Override
	public ArrayList<StrgArea> detailList(String strgNo) {
		// TODO Auto-generated method stub
		return wd.detailList(sqlSession,strgNo);
	}

	@Override
	public int updateWarehouse(Model m, Strg st) {
		// TODO Auto-generated method stub
		return wd.updateWarehouse(sqlSession,m,st);
	}

	@Override
	public ArrayList<StrgArea> selectAreaList(String strgNo) {
		// TODO Auto-generated method stub
		return wd.selectAreaList(sqlSession,strgNo);
	}
	
}
