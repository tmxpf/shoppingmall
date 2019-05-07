package com.shopping.calendar;

import java.io.Serializable;

public class CalendarVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5090156623453007149L;

	//현재 선택된 날짜
	private String currentDate;
	//uuid구분값
	private String schedule_uuid;
	
	
	
	public String getCurrentDate() {
		return currentDate;
	}
	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}
	public String getSchedule_uuid() {
		return schedule_uuid;
	}
	public void setSchedule_uuid(String schedule_uuid) {
		this.schedule_uuid = schedule_uuid;
	}
	
	
}
