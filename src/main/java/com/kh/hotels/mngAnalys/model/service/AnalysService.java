package com.kh.hotels.mngAnalys.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.hotels.common.model.vo.Payment;
import com.kh.hotels.mngAnalys.model.vo.SalesDetail;
import com.kh.hotels.mngStay.model.vo.Stay;

public interface AnalysService {

	ArrayList<SalesDetail> selectSalesDetailList(Map<String, String> map);

	ArrayList<SalesDetail> selectRsvList(Map<String, Object> map);

	ArrayList<Stay> selectStayList(Map<String, Object> map);

	ArrayList<SalesDetail> selectMonthlyRsvList(Map<String, Object> map);

	ArrayList<Stay> selectMonthlyStayList(Map<String, Object> map);

	ArrayList<Payment> selectDailyPaymentList(Map<String, Object> map);

}
