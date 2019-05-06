package com.shopping.calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	CalendarDAO calendarDAO;
	
	@Override
	public void insertSchedule(ScheduleVO scheduleVO) {
		calendarDAO.insertSchedule(scheduleVO);
	}

}
