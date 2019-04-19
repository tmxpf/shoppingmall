package com.shopping.manclothes;

import java.io.Serializable;

public class ProductVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4622495557586828748L;

	
	/*상품 고유번호*/
	private String objUuid;
	
	/*상품 이름*/
	private String objName;
	
	/*상품 사이즈*/
	private String objSize;
	
	/*상품 컬러*/
	private String objColor;
	
	/*상품 양*/
	private int objAmount;
	
	/*상품 가격*/
	private String objPrice;
	
	/*사용자 고유번호*/
	private int userCode;

	
	public String getObjUuid() {
		return objUuid;
	}

	public void setObjUuid(String objUuid) {
		this.objUuid = objUuid;
	}

	public String getObjName() {
		return objName;
	}

	public void setObjName(String objName) {
		this.objName = objName;
	}

	public String getObjSize() {
		return objSize;
	}

	public void setObjSize(String objSize) {
		this.objSize = objSize;
	}

	public String getObjColor() {
		return objColor;
	}

	public void setObjColor(String objColor) {
		this.objColor = objColor;
	}

	public int getObjAmount() {
		return objAmount;
	}

	public void setObjAmount(int objAmount) {
		this.objAmount = objAmount;
	}

	public String getObjPrice() {
		return objPrice;
	}

	public void setObjPrice(String objPrice) {
		this.objPrice = objPrice;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	
}
