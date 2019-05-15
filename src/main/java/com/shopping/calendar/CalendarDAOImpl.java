package com.shopping.calendar;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<ScheduleVO> selectSchedule(CalendarVO calendarVO) {
		return sqlSession.selectList("calendarMapper.selectSchedule", calendarVO);
	}

	@Override
	public ScheduleVO selectScheduleOne(Map<String, Object> paramTime) {
		return sqlSession.selectOne("calendarMapper.selectScheduleOne", paramTime);
	}

	@Override
	public void updateSchdulChk(ScheduleVO scheduleVO) {
		sqlSession.update("calendarMapper.updateSchdulChk", scheduleVO);
	}

}
