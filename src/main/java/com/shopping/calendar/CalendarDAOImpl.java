package com.shopping.calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAOImpl implements CalendarDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertSchedule(ScheduleVO scheduleVO) {
		sqlSession.insert("calendarMapper.insertSchedule", scheduleVO);
	}

}
