package com.kh.hotels.mngStock.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.His;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemHistory;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.RepHistory;
import com.kh.hotels.mngStock.model.vo.OrderHis;
import com.kh.hotels.mngStock.model.vo.OrderHisDetail;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.SearchItem;
import com.kh.hotels.mngStock.model.vo.Stock;


@Repository
public class StockDaoImpl implements StockDao{

	@Override
	public ArrayList<Stock> selectStockList(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Stock.selectStockList", null, rowBounds);
	}

	@Override
	public int insertStock(SqlSessionTemplate sqlSession, Model m, Stock st) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Stock.insertStock",st);
	}

	@Override
	public ArrayList<Repair> selectRepairList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectRepairList");
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Stock.selectListCount");
	}

	@Override
	public ArrayList<Stock> selectStockDetailList(SqlSessionTemplate sqlSession, String iName) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectStockDetailList", iName);
	}

	@Override
	public ArrayList<ItemType> selectCategoryList(SqlSessionTemplate sqlSession, ItemType it) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectCategoryList",it);
	}
 
	@Override
	public int insertCategory(SqlSessionTemplate sqlSession, ItemType it) {
		System.out.println(it);
		return sqlSession.insert("Stock.insertCategory",it);
	}

	@Override
	public ArrayList<ItemType> selectScategory(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectScategory");
	}


	@Override
	public ArrayList<Conn> selectCnName(SqlSessionTemplate sqlSession,int typeNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectCnName",typeNo);
	}

	@Override
	public int deleteStock(SqlSessionTemplate sqlSession, int check) {
		// TODO Auto-generated method stub
		return sqlSession.update("Stock.deleteStock",check);
	}

	@Override
	public ArrayList<Item> selectRmNoList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.selectRmNoList");
	}

	@Override
	public int insertStockHis(SqlSessionTemplate sqlSession, Model m, Stock st) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Stock.insertStockHis",st);
	}

	@Override
	public int updateStockOk(SqlSessionTemplate sqlSession, Stock st) {
		// TODO Auto-generated method stub
		return sqlSession.update("Stock.updateStockOk",st);
	}

	@Override
	public int updateStockHis(SqlSessionTemplate sqlSession, His h) {
		System.out.println("hius : " + h);
		return sqlSession.insert("Stock.updateStockHis",h);
	}

	@Override
	public int deleteStockHis(SqlSessionTemplate sqlSession, His h) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Stock.deleteStockHis",h);
	}

	@Override
	public ArrayList<Stock> searchList(SqlSessionTemplate sqlSession, SearchItem s) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Stock.searchList",s);
	}

	@Override
	public int getRepairListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Stock.getRepairListCount");
	}

	

	@Override
	public int getPurchaseHisListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Stock.getPurchaseHisListCount");
	}

	@Override
	public ArrayList<OrderHis> selectOrderHisList(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		ArrayList<OrderHis> orderHisList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		orderHisList = (ArrayList)sqlSession.selectList("Stock.selectOrderHisList", null, rowBounds);
		
		return orderHisList;
	}

	@Override
	public ArrayList<OrderHis> selectOrderHisInfoList(SqlSessionTemplate sqlSession) {
		
		ArrayList<OrderHis> orderHisInfoList = null;
		
		orderHisInfoList = (ArrayList)sqlSession.selectList("Stock.selectOrderHisInfoList");
		
		return orderHisInfoList;
	}

	@Override
	public ArrayList<OrderHisDetail> selectOrderHisDetail(int reportNo, SqlSessionTemplate sqlSession) {
		
		ArrayList<OrderHisDetail> orderHisDetailList = null;
		
		orderHisDetailList = (ArrayList)sqlSession.selectList("Stock.selectOrderHisDetail", reportNo);
		
		return orderHisDetailList;
	}

	@Override
	public ArrayList<Item> selectItemList(SqlSessionTemplate sqlSession, ArrayList<OrderHisDetail> orderHisDetailList) {

		ArrayList<Item> itemList = new ArrayList<>();
		
		Item item = null;
		
		for(int i = 0; i < orderHisDetailList.size(); i++) {
			item = new Item();
			item = sqlSession.selectOne("Stock.selectItemList", orderHisDetailList.get(i));
			itemList.add(item);
		}
		
		
		return itemList;
	}

	@Override
	public int insertItemList(SqlSessionTemplate sqlSession, ArrayList<Item> itemList) {
		
		int result = 0;
		
		for(int i = 0; i < itemList.size(); i++) {
			for(int j = 0; j < itemList.get(i).getAmount(); j++) {
				result = sqlSession.insert("Stock.insertItemList", itemList.get(i));
			}
		}
		
		return result;
	}

	@Override
	public int updateOrderHisStatus(SqlSessionTemplate sqlSession, int reportNo) {
		
		return sqlSession.update("Stock.updateOrderHisStatus", reportNo);
	}
	@Override
	public ArrayList<RepHistory> getRepairList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Stock.getRepairList", null, rowBounds);
	}

	@Override
	public ArrayList<String> selectRepairInfo(SqlSessionTemplate sqlSession, ArrayList<RepHistory> repList) {
		
		ArrayList<String> list = new ArrayList<>();
		System.out.println("DAOreportList : " + repList);
		String str ="";
		for(int i = 0; i < repList.size(); i++) {
			str = (String)sqlSession.selectOne("Stock.selectRepairInfo", repList.get(i).getRptNo());
		
			list.add(str);
		}
		System.out.println("daoList : " + list);
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectRepairDetail(SqlSessionTemplate sqlSession, RepHistory rHistory) {
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		int rptno = rHistory.getRptNo();
		
		list = (ArrayList)sqlSession.selectList("Stock.selectRepairDetail", rptno);
		
		System.out.println("daolist : " + list);
		
		return list;
	}

	@Override
	public String selectReceiverName(SqlSessionTemplate sqlSession, int receiver) {
		
		String name = (String)sqlSession.selectOne("Stock.selectReceiverName", receiver);
		
		System.out.println("daoName : " + name);
		
		return name;
	}

	@Override
	public int getSearchStockListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getStockHisCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Stock.getStockHisCount");
	}

	@Override
	public ArrayList<ItemHistory> getstockHisList(SqlSessionTemplate sqlSession) {

		
		return (ArrayList)sqlSession.selectList("Stock.getStockHisList");
	}

	@Override
	public ItemHistory getItemHis(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Stock.getStockHisList");
	}



}
