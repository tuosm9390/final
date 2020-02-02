package com.kh.hotels.mngApproval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.mngApproval.model.dao.ApprovalDao;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.RepRequest;

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
	public List<String> selectMadeComName(String value) throws ReportException {
		List<String> list = ad.selectMadeComName(sqlSession, value);
		
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
		//Report테이블에 정보 넣기
		int result = ad.insertPurchase(sqlSession,pRequestList);
		//rptNo가져오기
		int result2 = ad.selectRptNo(sqlSession, docNo);
		
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
	public int insertRepairRequestList(ArrayList<RepRequest> rRequestList) {
		int docNo = rRequestList.get(0).getDocno();
		int result = ad.insertRepReqInfo(sqlSession, rRequestList);
		int result2 = ad.insertRepReqList(sqlSession, docNo);
		
		for(int i = 0; i < rRequestList.size(); i++) {
			rRequestList.get(i).setRptNo(result2);
			System.out.println("service : " + rRequestList.get(i));
		}
		
		int result3 = ad.insertRepReqListAll(sqlSession, rRequestList);
		
		
		return 0;
	}



	

	


}
