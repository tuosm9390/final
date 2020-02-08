package com.kh.hotels.mngApproval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngApproval.model.dao.ApprovalDao;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.OrderRequest;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PartiReport;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.RepRequest;
import com.kh.hotels.mngApproval.model.vo.Report;

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

		}else {
			throw new ReportException("조회중 에러");
		}
		return list;
	}


	@Override
	public int getListCountFilter(String cateCh) {
		
		int getListCountFilter = ad.getListCountFilter(sqlSession, cateCh);
		
		return getListCountFilter;
	}


	@Override
	public List<HashMap<String, Object>> selectFilterReportList(PageInfo pi, String cate) throws ReportException {
		List<HashMap<String, Object>> list = ad.selectFilterApproveList(sqlSession, pi, cate);
		
		if(list == null) {
			throw new ReportException("필터 에러");
		}
		
		return list;
	}


	@Override
	public List<HashMap<String, Object>> selectApprovePurDetail(int rptNo, String type) throws ReportException {
		List<HashMap<String, Object>> list = ad.selectApprovePurDetail(sqlSession, rptNo, type);
		
		if(list == null) {
			throw new ReportException("디테일 에러");
		}
		
		
		return list;
	}


	@Override
	public List<HashMap<String, Object>> selectApproveRepairDetail(int rptNo, String type) throws ReportException {
		List<HashMap<String, Object>> list = ad.selectApproveRepairDetail(sqlSession, rptNo, type);
		
		if(list == null) {
			throw new ReportException("디테일 에러");
		}
		
		
		return list;
	}


	@Override
	public List<HashMap<String, Object>> selectApproveOrderDetail(int rptNo, String type) throws ReportException {
		List<HashMap<String, Object>> list = ad.selectApproveOrderDetail(sqlSession, rptNo, type);
		
		if(list == null) {
			throw new ReportException("디테일 에러");
		}
		
		
		return list;
	}


	@Override
	public List<HashMap<String, Object>> selectInfo() throws ReportException {
		List<HashMap<String, Object>> list = ad.selectApproveInfo(sqlSession);
		
		if(list == null) {
			throw new ReportException("에러났어요~");
		}
		
		return list;
	}


	@Override
	public int selectVos(String iName) {
		
		int vos = ad.selectVos(sqlSession, iName);
		
		
		
		return vos;
	}


	@Override
	public List<String> selectConnName(String value) throws ReportException {
		List<String> connName = ad.selectConnName(sqlSession, value);
		
		if(connName == null) {
			throw new ReportException("에러발생~~");
		}
		
		
		return connName;
	}


	


	@Override
	public List<String> selectMadeComName(String value, String type) throws ReportException {
		List<String> list = ad.selectMadeComName(sqlSession, value, type);
		
		if(list == null) {
			throw new ReportException("에러");
		}
		
		return list;
	}


	@Override
	public List<Integer> selectVosEquip(PurVos pv) {
		
		List<Integer> list = ad.selectVosPrice(sqlSession, pv);
		return list;
	}


	@Override
	public List<String> selectItemName(PurRequest pRequest) throws ReportException {
	
		
		List<String> list = ad.selectItemName(sqlSession, pRequest);
		
		if(list == null) {
			throw new ReportException("에러발생~~");
		}
		
		
		return list;
	}




	@Override
	public int insertList(ArrayList<PurRequest> pRequestList) throws ReportException {
		System.out.println("service전 : " + pRequestList);
		int docNo = pRequestList.get(0).getDocno();
		System.out.println("docNo : " + docNo);
		//Report테이블에 정보 넣기
		int result = ad.insertPurchase(sqlSession,pRequestList);
		System.out.println("report에 넣기 : ");
		//rptNo가져오기
		int result2 = ad.selectRptNo(sqlSession, docNo);
		System.out.println("result2 :" + result2);
		for(int i = 0; i < pRequestList.size(); i++) {
			pRequestList.get(i).setRptNo(result2);
			System.out.println("service : " + pRequestList.get(i));
		}
		//pur_request에 값 넣기
		int result3 = ad.insertPurRequest(sqlSession, pRequestList);
		
		
		int finalResult = 0;
		if(result > 0 && result2 > 0 && result3 > 0) {
			finalResult = 1;
		}else {
			throw new ReportException("에러났어요~");
		}
		
		
		return finalResult;
	}


	@Override
	public String selectIname(int ino) throws ReportException {
		
		String iname = ad.selectIname(sqlSession, ino);
		System.out.println("iname : " + iname);
		
		if(iname == null) {
			throw new ReportException("에러~~");
		}
		
		return iname;
	}


	@Override
	public List<HashMap<String, Object>> selectRepairInfo() throws ReportException {
		ArrayList<HashMap<String, Object>> list = ad.selectRepairInfo(sqlSession);
		
		if (list == null) {
			throw new ReportException("에러~");
		}
		
		return list;
	}


	@Override
	public int insertRepairRequestList(ArrayList<RepRequest> rRequestList) throws ReportException {
		int docNo = rRequestList.get(0).getDocno();
		String Code = "";
		int result = ad.insertRepReqInfo(sqlSession, rRequestList);
		int result2 = ad.insertRepReqList(sqlSession, docNo);
		
		for(int i = 0; i < rRequestList.size(); i++) {
			rRequestList.get(i).setRptNo(result2);
			System.out.println("service : " + rRequestList.get(i));
			Code = ad.selectRepairCncode(sqlSession, rRequestList.get(i).getCnName());	
			rRequestList.get(i).setCnCode(Code);
			
		}
		
		int finalResult = 0;
		int result3 = ad.insertRepReqListAll(sqlSession, rRequestList);
		if(result > 0 && result2 > 0 && result3 > 00) {
			finalResult = 1;
		}else {
			throw new ReportException("에러~~");
		}
		
		
		return finalResult;
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApproveList(PartiReport member, PageInfo pi) throws ReportException {

		ArrayList<HashMap<String, Object>> list = ad.selectPartiApproveList(sqlSession, member, pi);
		
		if(list == null) {
			throw new ReportException("에러~~");
		}else {
			
		}
		
		
		
		return list;
	}


	@Override
	public int getPartiApproveListCount(int mno) {
		
		int listCount = ad.getPartiApproveListCount(sqlSession, mno);
		
		

		return listCount;
		
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApproveList(int mno, PageInfo pi) {
		
		ArrayList<HashMap<String, Object>> list = ad.selectPartiApprovePagingList(sqlSession, mno, pi);
		
		return list;
	}


	@Override
	public int getListCountPartiFilter(String category, String mno) {
		
		int getListCountFilter = ad.getListCountPartiFilter(sqlSession, category, mno);
		
		
		
		return getListCountFilter;
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApproveFilter(PageInfo pi, String category, String mno) {
		
		ArrayList<HashMap<String, Object>> list = ad.selectPartiApproveFilter(sqlSession, category, mno, pi);
		
		
		return list;
	}


	@Override
	public int updateApproveStatus(Report report) {
		
		int result = ad.updateApproveStatus(sqlSession, report);
		
		//int result2 = ad.updateApprovePurRequest(sqlSession, report);
		
		
		return result;
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApproveAll(PartiReport member, PageInfo pi) {
		
		ArrayList<HashMap<String, Object>> list = ad.selectPartiApproveAll(sqlSession, member, pi);

		return list;
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectOrderInfo() {
		
		ArrayList<HashMap<String, Object>> list = ad.selectOrderInfo(sqlSession);
		
		
		return list;
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectOrderDocu() {
		
		ArrayList<HashMap<String, Object>> list = ad.selectOrderDocu(sqlSession);
		
		
		return list;
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectOrderList(int dnum) {
		
		ArrayList<HashMap<String, Object>> list = ad.selectOrderList(sqlSession, dnum);
		
		
		return list;
	}


	

	@Override
	public int insertOrderList(ArrayList<OrderRequest> oRequestList) {
		
		System.out.println("oRequestList.length : " + oRequestList.size());
		//발주요청 수신자 mno 받아오기
		int smno = ad.selectOrderSmno(sqlSession, oRequestList);
		oRequestList.get(0).setSmno(smno);
		//발주요청 수신자 MNO넣기 끝
		
		//REPORT에 정보 넣기
		int result = ad.insertOrderList(sqlSession, oRequestList);
		//Report에 정보넣기 끝
		
		
		
		//Report에 넣었던 rptNo가져오기
		int rptno = ad.selectOrderRptNo(sqlSession, oRequestList);
		System.out.println("맨처음oRequestList : " + oRequestList);
		
		
		for(int i = 0; i < oRequestList.size(); i++) {
			
			oRequestList.get(i).setRptNo(rptno);
		}
		
		//선택한 docuNo로 purRequest의 rptNo, ino 가져오기
		int docno = oRequestList.get(0).getPurDocuno();
		
		ArrayList<OrderRequest>list = ad.selectPurRequestInfo(sqlSession, docno);
		System.out.println("여기씨발 : " + list.size());
		System.out.println("씨발list : " + list);
		
		for(int i = 0; i < list.size(); i++) {
			//cnName=  new ArrayList<OrderRequest>();
			oRequestList.get(i).setPurRptNo(list.get(i).getRptNo());
			oRequestList.get(i).setPurIno(list.get(i).getIno());
			
			
		}
		System.out.println("마지막 : " + oRequestList);
		
		ArrayList<String> cnList = ad.selectCnCode(sqlSession, oRequestList);
		
		
		for(int i = 0 ; i < oRequestList.size(); i++) {
			oRequestList.get(i).setCnCode(cnList.get(i));
		}
		
		
		 System.out.println("final oRequestList : " + oRequestList);
		 
		 
		 int orderResult = ad.insertFinalOrderRequest(sqlSession, oRequestList);
		 
		
		
		
		return orderResult;
	}


	@Override
	public List<HashMap<String, Object>> selectRepairConList() {
		
		ArrayList<HashMap<String, Object>> list = ad.selectRepairCon(sqlSession);
		
		
		return list;
	}


	@Override
	public int getListCount(int myMno) {
		
		int count = ad.selectCountMyApprove(sqlSession, myMno);
		
		
		return count;
	}


	@Override
	public List<HashMap<String, Object>> selectReportList(PageInfo pi, int myMno) {
		
		ArrayList<HashMap<String, Object>> list = ad.selectMyApproveList(sqlSession, pi, myMno);
		
		
		return list;
	}


	
}


