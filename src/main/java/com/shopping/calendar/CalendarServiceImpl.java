package com.shopping.calendar;

import java.util.List;

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

	@Override
	public List<ScheduleVO> selectSchedule(CalendarVO calendarVO) {
		return calendarDAO.selectSchedule(calendarVO);
	}

}
