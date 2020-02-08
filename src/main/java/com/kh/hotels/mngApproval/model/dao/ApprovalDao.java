package com.kh.hotels.mngApproval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.OrderRequest;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PartiReport;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.RepRequest;
import com.kh.hotels.mngApproval.model.vo.Report;
import com.kh.hotels.mngMember.model.vo.Member;

public interface ApprovalDao {

	List<HashMap<String, Object>> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession) throws ReportException;

	int getListCountFilter(SqlSessionTemplate sqlSession, String cateCh);

	List<HashMap<String, Object>> selectFilterApproveList(SqlSessionTemplate sqlSession, PageInfo pi, String cate);

	List<HashMap<String, Object>> selectApprovePurDetail(SqlSessionTemplate sqlSession, int rptNo, String type);

	List<HashMap<String, Object>> selectApproveRepairDetail(SqlSessionTemplate sqlSession, int rptNo, String type);

	List<HashMap<String, Object>> selectApproveOrderDetail(SqlSessionTemplate sqlSession, int rptNo, String type);

	List<HashMap<String, Object>> selectApproveInfo(SqlSessionTemplate sqlSession);

	int selectVos(SqlSessionTemplate sqlSession, String iName);

	List<String> selectConnName(SqlSessionTemplate sqlSession, String value);



	List<String> selectMadeComName(SqlSessionTemplate sqlSession, String value, String type);

	List<Integer> selectVosPrice(SqlSessionTemplate sqlSession, PurVos pv);

	List<String> selectItemName(SqlSessionTemplate sqlSession, PurRequest pRequest);

	int insertPurchase(SqlSessionTemplate sqlSession, ArrayList<PurRequest> pRequestList);

	int selectRptNo(SqlSessionTemplate sqlSession, int docNo);

	int insertPurRequest(SqlSessionTemplate sqlSession, ArrayList<PurRequest> pRequestList);

	String selectIname(SqlSessionTemplate sqlSession, int ino);

	ArrayList<HashMap<String, Object>> selectRepairInfo(SqlSessionTemplate sqlSession);

	int insertRepReqInfo(SqlSessionTemplate sqlSession, ArrayList<RepRequest> rRequestList);

	int insertRepReqList(SqlSessionTemplate sqlSession, int docNo);

	int insertRepReqListAll(SqlSessionTemplate sqlSession, ArrayList<RepRequest> rRequestList);

	String selectRepairCncode(SqlSessionTemplate sqlSession, String cnName);

	ArrayList<HashMap<String, Object>> selectPartiApproveList(SqlSessionTemplate sqlSession, PartiReport member, PageInfo pi);

	int getPartiApproveListCount(SqlSessionTemplate sqlSession, int mno) ;

	ArrayList<HashMap<String, Object>> selectPartiApprovePagingList(SqlSessionTemplate sqlSession, int mno,
			PageInfo pi);

	int getListCountPartiFilter(SqlSessionTemplate sqlSession, String category, String mno);

	ArrayList<HashMap<String, Object>> selectPartiApproveFilter(SqlSessionTemplate sqlSession, String category,
			String mno, PageInfo pi);

	int updateApproveStatus(SqlSessionTemplate sqlSession, Report report);

	int updateApprovePurRequest(SqlSessionTemplate sqlSession, Report report);

	ArrayList<HashMap<String, Object>> selectPartiApproveAll(SqlSessionTemplate sqlSession, PartiReport member,
			PageInfo pi);

	ArrayList<HashMap<String, Object>> selectOrderInfo(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> selectOrderDocu(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, int dnum);

	int insertOrderList(SqlSessionTemplate sqlSession, ArrayList<OrderRequest> oRequestList);


	ArrayList<OrderRequest> selectPurRequestInfo(SqlSessionTemplate sqlSession, int docno);

	int selectOrderRptNo(SqlSessionTemplate sqlSession, ArrayList<OrderRequest> oRequestList);

	int selectOrderSmno(SqlSessionTemplate sqlSession, ArrayList<OrderRequest> oRequestList);

	int insertFinalOrderRequest(SqlSessionTemplate sqlSession,
			ArrayList<OrderRequest> oRequestList);

	ArrayList<String> selectCnCode(SqlSessionTemplate sqlSession,
			ArrayList<OrderRequest> oRequestList);

	ArrayList<HashMap<String, Object>> selectRepairCon(SqlSessionTemplate sqlSession);

	int selectCountMyApprove(SqlSessionTemplate sqlSession, int myMno);

	ArrayList<HashMap<String, Object>> selectMyApproveList(SqlSessionTemplate sqlSession, PageInfo pi, int myMno);


}
