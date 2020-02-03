package com.kh.hotels.mngApproval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PartiReport;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.RepRequest;
import com.kh.hotels.mngApproval.model.vo.Report;
import com.kh.hotels.mngMember.model.vo.Member;

public interface ApprovalService {


	List<HashMap<String, Object>> selectReportList(PageInfo pi) throws ReportException;

	int getListCount() throws ReportException;

	int getListCountFilter(String cateCh);

	List<HashMap<String, Object>> selectFilterReportList(PageInfo pi, String cate) throws ReportException;


	List<HashMap<String, Object>> selectApprovePurDetail(int rptNo, String type) throws ReportException;

	List<HashMap<String, Object>> selectApproveRepairDetail(int rptNo, String type) throws ReportException;

	List<HashMap<String, Object>> selectApproveOrderDetail(int rptNo, String type) throws ReportException;

	List<HashMap<String, Object>> selectInfo() throws ReportException;

	int selectVos(String iName);

	List<String> selectConnName(String value) throws ReportException;


	List<String> selectMadeComName(String value) throws ReportException;


	List<Integer> selectVosEquip(PurVos pv);

	List<String> selectItemName(PurRequest pRequest) throws ReportException;

	int insertList(ArrayList<PurRequest> pRequestList) throws ReportException;

	String selectIname(int ino) throws ReportException;

	List<HashMap<String, Object>> selectRepairInfo() throws ReportException;

	int insertRepairRequestList(ArrayList<RepRequest> rRequestList) throws ReportException;


	int getPartiApproveListCount(int mno);

	ArrayList<HashMap<String, Object>> selectPartiApproveList(PartiReport member, PageInfo pi) throws ReportException;

	ArrayList<HashMap<String, Object>> selectPartiApproveList(int mno, PageInfo pi);

	int getListCountPartiFilter(String category, String mno);

	ArrayList<HashMap<String, Object>> selectPartiApproveFilter(PageInfo pi, String category, String mno);

	
	
	
}
