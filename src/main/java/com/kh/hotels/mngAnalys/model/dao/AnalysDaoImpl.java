package com.kh.hotels.mngAnalys.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.common.model.vo.Payment;
import com.kh.hotels.mngAnalys.model.vo.DailySpendStock;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngAnalys.model.vo.SpendDetail;
import com.kh.hotels.mngStay.model.vo.Stay;

@Repository
public class AnalysDaoImpl implements AnalysDao{

	@Override
	public ArrayList<SalesDetail> selectSalesDetailList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectSalesDetailList", map);
	}
	
	@Override
	public ArrayList<SpendDetail> selectSpendDetailList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectSpendDetailList", map);
	}

	@Override
	public ArrayList<SalesDetail> selectRsvList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectRsvList", map);
	}

	@Override
	public ArrayList<Stay> selectStayList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectStayList", map);
	}

	@Override
	public ArrayList<SalesDetail> selectMonthlyRsvList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectMonthlyRsvList", map);
	}

	@Override
	public ArrayList<Stay> selectMonthlyStayList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectMonthlyStayList", map);
	}

	@Override
	public ArrayList<Payment> selectDailyPaymentList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectDailyPaymentList", map);
	}

	@Override
	public ArrayList<DailySpendStock> selectDailySpendStrgList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("Analys.selectDailySpendStrgList", map);
	}
}
