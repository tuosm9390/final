package com.kh.hotels.mngStock.model.vo;




public class Stock implements java.io.Serializable{
	
	private int ino;
	private String iName;
	private String lCategory;
	private String mCategory;
	private String sCategory;
	private int amount; //수량
	private int up;//단가
	private int vat;//부가세
	private int vos; //공급가액
	private String mfg; //제조사
	private String cnName;//매입처
	private String type;//비품,소모품
	private int cnt;
	private String areaName;//위치
	private String strgName;//창고
	private int rmNo;//객실
	private int unit;
	
	public Stock() {}

	public Stock(int ino, String iName, String lCategory, String mCategory, String sCategory, int amount, int up,
			int vat, int vos, String mfg, String cnName, String type, int cnt, String areaName, String strgName,
			int rmNo, int unit) {
		super();
		this.ino = ino;
		this.iName = iName;
		this.lCategory = lCategory;
		this.mCategory = mCategory;
		this.sCategory = sCategory;
		this.amount = amount;
		this.up = up;
		this.vat = vat;
		this.vos = vos;
		this.mfg = mfg;
		this.cnName = cnName;
		this.type = type;
		this.cnt = cnt;
		this.areaName = areaName;
		this.strgName = strgName;
		this.rmNo = rmNo;
		this.unit = unit;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getiName() {
		return iName;
	}

	public void setiName(String iName) {
		this.iName = iName;
	}

	public String getlCategory() {
		return lCategory;
	}

	public void setlCategory(String lCategory) {
		this.lCategory = lCategory;
	}

	public String getmCategory() {
		return mCategory;
	}

	public void setmCategory(String mCategory) {
		this.mCategory = mCategory;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public int getVat() {
		return vat;
	}

	public void setVat(int vat) {
		this.vat = vat;
	}

	public int getVos() {
		return vos;
	}

	public void setVos(int vos) {
		this.vos = vos;
	}

	public String getMfg() {
		return mfg;
	}

	public void setMfg(String mfg) {
		this.mfg = mfg;
	}

	public String getCnName() {
		return cnName;
	}

	public void setCnName(String cnName) {
		this.cnName = cnName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getStrgName() {
		return strgName;
	}

	public void setStrgName(String strgName) {
		this.strgName = strgName;
	}

	public int getRmNo() {
		return rmNo;
	}

	public void setRmNo(int rmNo) {
		this.rmNo = rmNo;
	}

	public int getUnit() {
		return unit;
	}

	public void setUnit(int unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "Stock [ino=" + ino + ", iName=" + iName + ", lCategory=" + lCategory + ", mCategory=" + mCategory
				+ ", sCategory=" + sCategory + ", amount=" + amount + ", up=" + up + ", vat=" + vat + ", vos=" + vos
				+ ", mfg=" + mfg + ", cnName=" + cnName + ", type=" + type + ", cnt=" + cnt + ", areaName=" + areaName
				+ ", strgName=" + strgName + ", rmNo=" + rmNo + ", unit=" + unit + "]";
	}

	
	
	
	
	
}
