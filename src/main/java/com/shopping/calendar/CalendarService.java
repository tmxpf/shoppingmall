package com.shopping.calendar;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	public void insertSchedule(ScheduleVO scheduleVO);
	
	public List<ScheduleVO> selectSchedule(CalendarVO calendarVO);
	
	public ScheduleVO selectScheduleOne(Map<String, Object> paramTime);
	
	public void updateSchdulChk(ScheduleVO scheduleVO);
}
