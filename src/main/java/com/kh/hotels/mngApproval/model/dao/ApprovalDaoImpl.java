package com.kh.hotels.mngApproval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.OrderHistory;
import com.kh.hotels.mngApproval.model.vo.OrderRequest;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PartiReport;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.RepRequest;
import com.kh.hotels.mngApproval.model.vo.Report;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{



	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws ReportException {
		int result = 0;
		result = sqlSession.selectOne("Report.selectListCount");
		
		if(result <= 0) {
			throw new ReportException("게시글 수 조회 실패!");
		}
		
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		List<HashMap<String, Object>> list = null;
		//offset은 건너뛴 갯수이다.
		//몇 개의 게시글을 건너뛰고 조회할 것인지 대한 계산
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (List)sqlSession.selectList("Report.selectApproveList", null, rowBounds);
		
		System.out.println("daoList : " + list);
		
		return list;
	}

	@Override
	public int getListCountFilter(SqlSessionTemplate sqlSession, String cateCh) {
		
		
		return sqlSession.selectOne("Report.selectFilterListCount", cateCh);
	}

	@Override
	public List<HashMap<String, Object>> selectFilterApproveList(SqlSessionTemplate sqlSession, PageInfo pi,
			String cateCh) {
		List<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (List) sqlSession.selectList("Report.selectFilterApproveList", cateCh, rowBounds);
		
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApprovePurDetail(SqlSessionTemplate sqlSession, int rptNo,
			String type) {
		List<HashMap<String, Object>> list = null;
		
		
		list = (List) sqlSession.selectList("Report.selectApproveDetail", rptNo);
		
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApproveRepairDetail(SqlSessionTemplate sqlSession, int rptNo,
			String type) {
		List<HashMap<String, Object>> list = null;
		
		
		list = (List) sqlSession.selectList("Report.selectApproveRepairDetail", rptNo);
		
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApproveOrderDetail(SqlSessionTemplate sqlSession, int rptNo,
			String type) {
		List<HashMap<String, Object>> list = null;
		System.out.println("송기주");
		
		list = (List) sqlSession.selectList("Report.selectApproveOrderDetail", rptNo);
		System.out.println("여긴 들어와?");
		
		String chDate = String.valueOf(list.get(0).get("REQDATE"));
		String chDate2 = chDate.substring(0,11);
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).put("REQDATE2", chDate2);
		}
		
		
		
		System.out.println("list : " + list);
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApproveInfo(SqlSessionTemplate sqlSession) {
		List<HashMap<String, Object>> list = null;
		list = (List)sqlSession.selectList("Report.selectApproveInfo");
		
		return list;
	}

	@Override
	public int selectVos(SqlSessionTemplate sqlSession, String iName) {
		
		
		
		return sqlSession.selectOne("Report.selectVos", iName);
	}

	@Override
	public List<String> selectConnName(SqlSessionTemplate sqlSession, String value) {
		System.out.println("dao : value" + value);
		
		return (List)sqlSession.selectList("Report.selectConnName", value);
	}

	


	@Override
	public List<String> selectMadeComName(SqlSessionTemplate sqlSession, String value, String type) {
		
		PurRequest pRequest = new PurRequest();
		pRequest.setType(type);
		pRequest.setCname(value);
		System.out.println("type : " + type );
		System.out.println("value : " + value);
		
		return (List)sqlSession.selectList("Report.selectMadeComName", pRequest);
	}

	@Override
	public List<Integer> selectVosPrice(SqlSessionTemplate sqlSession, PurVos pv) {
		
		System.out.println("pv : " + pv);
		
		return (List)sqlSession.selectList("Report.selectVosPrice", pv);
	}

	@Override
	public List<String> selectItemName(SqlSessionTemplate sqlSession, PurRequest pRequest) {

		
		return (ArrayList)sqlSession.selectList("Report.selectItemName", pRequest);
	}


	@Override
	public int insertPurchase(SqlSessionTemplate sqlSession, ArrayList<PurRequest> pRequestList) {
		
		int result = 0;
		int result2 = 0;
		String stfId = pRequestList.get(0).getStfId();
		
		result2 = sqlSession.selectOne("Report.selectsmno", stfId);
		pRequestList.get(0).setSmno(result2);
		
		System.out.println("pRequestList : " + pRequestList);
		
		System.out.println("result2 : " + result2);
		
		if(result2 > 0) {
		
		 result = sqlSession.insert("Report.insertPurchaseApproveList",pRequestList.get(0)); 
		}
		System.out.println("result : " + result);
		
		 return result;
	}

	@Override
	public int selectRptNo(SqlSessionTemplate sqlSession, Long docNo) {
		int result = 0;
		
			result = sqlSession.selectOne("Report.selectRptNo", docNo);
			
			System.out.println("daoResult : " + result);
			
		return result;
	}

	@Override
	public int insertPurRequest(SqlSessionTemplate sqlSession, ArrayList<PurRequest> pRequestList) {
		int result = 0;
		
		System.out.println("DaopRequestList : " + pRequestList);
		
		for(int i = 0; i < pRequestList.size(); i++) {
			result = sqlSession.insert("Report.insertPurRequest", pRequestList.get(i));
		}
		
		
		
		return result;
	}

	@Override
	public String selectIname(SqlSessionTemplate sqlSession, int ino) {
		
		
		
		return sqlSession.selectOne("Report.selectRepairIname", ino);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectRepairInfo(SqlSessionTemplate sqlSession) {
		ArrayList<HashMap<String, Object>> list = null;
		list = (ArrayList)sqlSession.selectList("Report.selectRepairInfo");
		System.out.println("datList : " + list);
		return list;
	}

	@Override
	public int insertRepReqInfo(SqlSessionTemplate sqlSession, ArrayList<RepRequest> rRequestList) {
		
		int result = sqlSession.insert("Report.insertReqReqInfo", rRequestList.get(0));
		
		
		return result;
	}

	@Override
	public int insertRepReqList(SqlSessionTemplate sqlSession, Long docNo) {
		int result = sqlSession.selectOne("Report.selectRepReqRptNo", docNo);
		return result;
	}
	
	//수리요청서 인설트하기
	@Override
	public int insertRepReqListAll(SqlSessionTemplate sqlSession, ArrayList<RepRequest> rRequestList) {
		int result = 0;
		
		System.out.println("DaopRequestList : " + rRequestList);
		
		for(int i = 0; i < rRequestList.size(); i++) {
			result = sqlSession.insert("Report.insertRepReqList", rRequestList.get(i));
		}
		
		return result;
		
	}

	@Override
	public String selectRepairCncode(SqlSessionTemplate sqlSession, String cnName) {
		String code = sqlSession.selectOne("Report.selectCncode", cnName);
		
		
		return code;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApproveList(SqlSessionTemplate sqlSession, PartiReport member, PageInfo pi) {
		
		ArrayList<HashMap<String, Object>> list = null;
		int mno = member.getMno();
		
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList)sqlSession.selectList("Report.selectPariApproveList", mno, rowBounds);
		
		System.out.println("daoList : " + list);
		
		return list;
	}

	@Override
	public int getPartiApproveListCount(SqlSessionTemplate sqlSession, int mno){
		int result = 0;
		
		result = sqlSession.selectOne("Report.selectPartiApproveListCount", mno);
		
		
		
		
		return result;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApprovePagingList(SqlSessionTemplate sqlSession, int mno,
			PageInfo pi) {

		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList)sqlSession.selectList("Report.selectPariApproveList", mno, rowBounds);
		
		System.out.println("daoList : " + list);
		
		return list;
	}

	@Override
	public int getListCountPartiFilter(SqlSessionTemplate sqlSession, String category, String mno) {
		
		int result = 0;
		
		int chMno = Integer.parseInt(mno);
		PartiReport pr = new PartiReport();
		pr.setMno(chMno);
		pr.setCategory(category);
		
		result = sqlSession.selectOne("Report.selectPartiFilterCount", pr);
		
		return result;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApproveFilter(SqlSessionTemplate sqlSession, String category,
			String mno, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		PartiReport pr = new PartiReport();
		int chMno = Integer.parseInt(mno);
		pr.setMno(chMno);
		pr.setCategory(category);
		
		
		ArrayList<HashMap<String, Object>> list = (ArrayList)sqlSession.selectList("Report.selectPartiFilterList", pr, rowBounds);
		
		return list;
	}

	@Override
	public int updateApproveStatus(SqlSessionTemplate sqlSession, Report report) {
		
		int result = sqlSession.update("Report.updateApproveStatus", report);
		
		
		
		
		return result;
	}

	@Override
	public int updateApprovePurRequest(SqlSessionTemplate sqlSession, Report report) {
		
		
		
		
		int result = sqlSession.update("Report.updateApprovePurchase", report);
		
		
		return result;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectPartiApproveAll(SqlSessionTemplate sqlSession, PartiReport member,
			PageInfo pi) {
		
	ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList)sqlSession.selectList("Report.selectPariApproveAllList", member, rowBounds);
		
		System.out.println("daoList : " + list);
		
		return list;
		
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectOrderInfo(SqlSessionTemplate sqlSession) {
		
		ArrayList<HashMap<String, Object>> list = (ArrayList)sqlSession.selectList("Report.selectOrderInfo");
		
		System.out.println("list : " + list);
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectOrderDocu(SqlSessionTemplate sqlSession) {
		
		ArrayList<HashMap<String, Object>> list = (ArrayList)sqlSession.selectList("Report.selectOrderDocu");
		
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectOrderList(SqlSessionTemplate sqlSession, Long dnum) {
		
		ArrayList<HashMap<String, Object>> list = (ArrayList)sqlSession.selectList("Report.selectOrderList", dnum);
		
		System.out.println("daolist : " + list);
		return list;
	}

	


	@Override
	public int insertOrderList(SqlSessionTemplate sqlSession, ArrayList<OrderRequest> oRequestList) {
		
		System.out.println("발주요청 들어가기전");
		
		int result = sqlSession.insert("Report.insertOrderList", oRequestList.get(0));
		
		System.out.println("Report에 insert하기 result : " + result);
		
		return result;
	}

	@Override
	public ArrayList<OrderRequest> selectPurRequestInfo(SqlSessionTemplate sqlSession,
			Long docno) {
		
		ArrayList<OrderRequest> list = (ArrayList)sqlSession.selectList("Report.selectPurRequestInfo", docno);
		
		System.out.println("구매요청서 정보 : " + list);
		
		return list;
	}

	@Override
	public int selectOrderRptNo(SqlSessionTemplate sqlSession, ArrayList<OrderRequest> oRequestList) {
		
		int doc = sqlSession.selectOne("Report.selectOrderRptNo", oRequestList.get(0));
		System.out.println("docRptNo : " + doc);
		
		return doc;
	}
	
	//발주 요청서 수신자 mno가져오기
	@Override
	public int selectOrderSmno(SqlSessionTemplate sqlSession, ArrayList<OrderRequest> oRequestList) {
		
		int smno = sqlSession.selectOne("Report.selectOrderSmno", oRequestList.get(0));
		
		
		
		return smno;
	}

	@Override
	public int insertFinalOrderRequest(SqlSessionTemplate sqlSession,
			ArrayList<OrderRequest> oRequestList) {
			
		int OrderResult = 0;
		
		System.out.println("찐막 : " + oRequestList);
		
		for(int i = 0; i < oRequestList.size(); i++) {
			System.out.println("i : " + i+1);
			OrderResult = sqlSession.insert("Report.insertOrderResult", oRequestList.get(i));
		}
		
		System.out.println("orderResult : " + OrderResult);
		
		return OrderResult;
	}
	
	//cncode 가져오기
	/*
	 * @Override public ArrayList<String> selectCnCode(SqlSessionTemplate
	 * sqlSession, String[] cnName) {
	 * 
	 * ArrayList<String> list = null; for(int i = 0; i < cnName.length; i++) {
	 * System.out.println("들어가기전 : " + cnName[i]);
	 * 
	 * //list = (ArrayList)sqlSession.selectList("Report.selectCnCode", cnName[i]);
	 * }
	 * 
	 * //System.out.println("회사코드가져오기 :" + list); return list; }
	 */

	@Override
	public ArrayList<String> selectCnCode(SqlSessionTemplate sqlSession,
			ArrayList<OrderRequest> oRequestList) {
		
		System.out.println("oRequestList : " + oRequestList);
		String str = "";
		ArrayList<String> list  = new ArrayList<String>();
		
		for(int i = 0; i < oRequestList.size(); i++) {
			
			str = (String)sqlSession.selectOne("Report.selectCnCode", oRequestList.get(i));
			System.out.println("str : " + str);
			list.add(str);
			System.out.println("str씨발!!!!!!!!!!!!!!!!!!!!!! : " + list);
			//System.out.println("list : " + list );
		}
		System.out.println("마지막 list : " + list);
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectRepairCon(SqlSessionTemplate sqlSession) {
		
		ArrayList<HashMap<String, Object>> list = (ArrayList)sqlSession.selectList("Report.selectRepairList");
		
		System.out.println("수리업체명 : " + list);
		
		return list;
	}

	@Override
	public int selectCountMyApprove(SqlSessionTemplate sqlSession, int myMno) {
		
		int count = sqlSession.selectOne("Report.selectMyApproveCount", myMno);
		
		
		return count;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectMyApproveList(SqlSessionTemplate sqlSession, PageInfo pi,
			int myMno) {
		
		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList)sqlSession.selectList("Report.selectMyApproveList", myMno, rowBounds);
		
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectOrderRequestList(SqlSessionTemplate sqlSession, int rptNo) {
		
		ArrayList<HashMap<String, Object>> list = (ArrayList)sqlSession.selectList("Report.selectRepList", rptNo);
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectOrderListInfo(SqlSessionTemplate sqlSession, int rptNo) {
		System.out.println("RPTNO : " + rptNo);
		ArrayList<HashMap<String, Object>> list = (ArrayList)sqlSession.selectList("Report.selectOrderReqList", rptNo);
		
		System.out.println("list : " + list);
		
		return list;
	}

	@Override
	public int insertOrderHis(SqlSessionTemplate sqlSession, ArrayList<HashMap<String, Object>> finalList) {
		
		int result = 0;
		System.out.println("송기준 디에이오");
		System.out.println("finalList : " + finalList);
		OrderHistory oHis = new OrderHistory();
		oHis.setOrderDate((String)finalList.get(0).get("orderDate"));
		oHis.setRcvReqDate((String)finalList.get(0).get("reqDate"));
		oHis.setRptNo((int)finalList.get(0).get("rpt"));
		
		System.out.println("ohis : " + oHis);
		
		 result = sqlSession.insert("Report.insertOrderHis", oHis);
		
		System.out.println("result : " + result);
		
		return result;
	}

	@Override
	public int selectRepairListInfo(SqlSessionTemplate sqlSession, Report report) {
		
		System.out.println("수리 report : " + report );
		
		int result = sqlSession.insert("Report.insertRepairHis", report);
		
		
		return result;
	}

	

}
