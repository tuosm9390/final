package com.kh.hotels.mngApproval.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngApproval.model.dao.ApprovalDao;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ApprovalDao ad;










	@Override
	public int getListCount() throws ReportException {

		int listCount = ad.getListCount(sqlSession);


		return listCount;
	}


	@Override
	public List<HashMap<String, Object>> selectReportList(PageInfo pi) throws ReportException {
		List<HashMap<String, Object>> list = ad.selectApprovalList(sqlSession, pi);

		System.out.println("service");
		if(list != null) {

			System.out.println("list : " + list);
		}else {
			throw new ReportException("조회중 에러");
		}
		return list;
	}


	@Override
	public int getListCountFilter() {
		
		
		return 0;
	}


}
