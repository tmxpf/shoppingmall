package com.shopping.manclothes;

import java.io.Serializable;

public class ProductBoardVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4622495557586828748L;

	/*남성의류 or 여성의류 구분*/
	private int board_manager_seq;
	
	/*상품 고유번호*/
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
	private String obj_uuid;
	
	/*게시물 작성자 고유번호*/
	private String user_id;

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

	public String getObj_uuid() {
		return obj_uuid;
	}

	public void setObj_uuid(String obj_uuid) {
		this.obj_uuid = obj_uuid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
