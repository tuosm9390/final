package com.kh.hotels.mngApproval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.Report;

public interface ApprovalService {


	List<HashMap<String, Object>> selectReportList(PageInfo pi) throws ReportException;

	int getListCount() throws ReportException;

	int getListCountFilter(String cateCh);

	List<HashMap<String, Object>> selectFilterReportList(PageInfo pi, String cate) throws ReportException;


	List<HashMap<String, Object>> selectApprovePurDetail(int rptNo, String type) throws ReportException;

	
	
	
}
