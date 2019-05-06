package com.shopping.calendar;

import java.io.Serializable;

public class ScheduleVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6650006149186767532L;
	
//	일정ID
	private String schdul_id;
//	일정 제목
	private String	schdul_title;
//	일정 내용
	private String	schdul_content;
//	일정 장소
	private String schdul_place;
//	등록자 이름
	private String schdul_registant_name;
//	알람 설정
	private String schdul_alarm;
//	일정내용 구분
	private String schdul_sel;
	
//	일정 날짜
	private String schdul_date;
//	일정 시작 일자
	private String schdul_bgnDe;
//	일정 종료 일자
	private String schdul_endDe;
	
//	일정 시작 일자(시간)
	private String schdul_bgnDeHH;
//	일정 시작 일자(분)
	private String schdul_bgnDeMM;
//	일정 종료 일자(시간)
	private String schdul_endDeHH;
//	일정 종료 일자(분)
	private String schdul_endDeMM;
	
	
	public String getSchdul_id() {
		return schdul_id;
	}
	public void setSchdul_id(String schdul_id) {
		this.schdul_id = schdul_id;
	}
	public String getSchdul_title() {
		return schdul_title;
	}
	public void setSchdul_title(String schdul_title) {
		this.schdul_title = schdul_title;
	}
	public String getSchdul_content() {
		return schdul_content;
	}
	public void setSchdul_content(String schdul_content) {
		this.schdul_content = schdul_content;
	}
	public String getSchdul_place() {
		return schdul_place;
	}
	public void setSchdul_place(String schdul_place) {
		this.schdul_place = schdul_place;
	}
	public String getSchdul_registant_name() {
		return schdul_registant_name;
	}
	public void setSchdul_registant_name(String schdul_registant_name) {
		this.schdul_registant_name = schdul_registant_name;
	}
	public String getSchdul_alarm() {
		return schdul_alarm;
	}
	public void setSchdul_alarm(String schdul_alarm) {
		this.schdul_alarm = schdul_alarm;
	}
	public String getSchdul_sel() {
		return schdul_sel;
	}
	public void setSchdul_sel(String schdul_sel) {
		this.schdul_sel = schdul_sel;
	}
	public String getSchdul_date() {
		return schdul_date;
	}
	public void setSchdul_date(String schdul_date) {
		this.schdul_date = schdul_date;
	}
	public String getSchdul_bgnDe() {
		return schdul_bgnDe;
	}
	public void setSchdul_bgnDe(String schdul_bgnDe) {
		this.schdul_bgnDe = schdul_bgnDe;
	}
	public String getSchdul_endDe() {
		return schdul_endDe;
	}
	public void setSchdul_endDe(String schdul_endDe) {
		this.schdul_endDe = schdul_endDe;
	}
	public String getSchdul_bgnDeHH() {
		return schdul_bgnDeHH;
	}
	public void setSchdul_bgnDeHH(String schdul_bgnDeHH) {
		this.schdul_bgnDeHH = schdul_bgnDeHH;
	}
	public String getSchdul_bgnDeMM() {
		return schdul_bgnDeMM;
	}
	public void setSchdul_bgnDeMM(String schdul_bgnDeMM) {
		this.schdul_bgnDeMM = schdul_bgnDeMM;
	}
	public String getSchdul_endDeHH() {
		return schdul_endDeHH;
	}
	public void setSchdul_endDeHH(String schdul_endDeHH) {
		this.schdul_endDeHH = schdul_endDeHH;
	}
	public String getSchdul_endDeMM() {
		return schdul_endDeMM;
	}
	public void setSchdul_endDeMM(String schdul_endDeMM) {
		this.schdul_endDeMM = schdul_endDeMM;
	}
	
}
