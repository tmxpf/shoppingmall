package com.shopping.manclothes;

import java.io.Serializable;

public class ProductBoardVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4622495557586828748L;

	/*남성의류 or 여성의류 구분*/
	private int board_manager_seq;
	
	/*게시물 고유번호*/
	private int board_seq;
	
	/*게시물 제목*/
	private String board_title;
	
	/*게시물 내용*/
	private String board_content;
	
	/*이미지 경로*/
	private String img_path;
	
	/*이미지 제목*/
	private String img_name;
	
	/*이미지 사이즈*/
	private int img_size;
	
	/*이미지 타입*/
	private String img_type;

	
	
	
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
	
	
	
	
	public int getBoard_manager_seq() {
		return board_manager_seq;
	}

	public void setBoard_manager_seq(int board_manager_seq) {
		this.board_manager_seq = board_manager_seq;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public int getImg_size() {
		return img_size;
	}

	public void setImg_size(int img_size) {
		this.img_size = img_size;
	}

	public String getImg_type() {
		return img_type;
	}

	public void setImg_type(String img_type) {
		this.img_type = img_type;
	}

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
