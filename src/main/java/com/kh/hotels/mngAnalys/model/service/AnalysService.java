package com.kh.hotels.mngAnalys.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.hotels.mngAnalys.model.vo.SalesDetail;

public interface AnalysService {

	ArrayList<SalesDetail> selectSalesDetailList(Map<String, Object> map);

}
