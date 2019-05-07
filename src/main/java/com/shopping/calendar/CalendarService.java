package com.shopping.calendar;

import java.util.List;

public interface CalendarService {

	public void insertSchedule(ScheduleVO scheduleVO);
	
	public List<ScheduleVO> selectSchedule(CalendarVO calendarVO);
}
