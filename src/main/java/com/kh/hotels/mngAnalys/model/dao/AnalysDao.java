package com.kh.hotels.mngAnalys.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.common.model.vo.Payment;
import com.kh.hotels.mngAnalys.model.vo.DailySpendStock;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngAnalys.model.vo.SpendDetail;
import com.kh.hotels.mngStay.model.vo.Stay;

public interface AnalysDao {

	ArrayList<SalesDetail> selectSalesDetailList(SqlSessionTemplate sqlSession, Map<String, String> map);

	ArrayList<SalesDetail> selectRsvList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	ArrayList<Stay> selectStayList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	ArrayList<SalesDetail> selectMonthlyRsvList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	ArrayList<Stay> selectMonthlyStayList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	ArrayList<Payment> selectDailyPaymentList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	ArrayList<DailySpendStock> selectDailySpendStrgList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	ArrayList<SpendDetail> selectSpendDetailList(SqlSessionTemplate sqlSession, Map<String, String> map);

}
