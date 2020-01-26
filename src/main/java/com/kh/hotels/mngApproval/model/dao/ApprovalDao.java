package com.kh.hotels.mngApproval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.Report;

public interface ApprovalDao {

	List<HashMap<String, Object>> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession) throws ReportException;

	int getListCountFilter(SqlSessionTemplate sqlSession, String cateCh);

	List<HashMap<String, Object>> selectFilterApproveList(SqlSessionTemplate sqlSession, PageInfo pi, String cate);

	List<HashMap<String, Object>> selectApprovePurDetail(SqlSessionTemplate sqlSession, int rptNo, String type);

}
