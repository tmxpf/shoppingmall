package com.shopping.calendar;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@Autowired
	CalendarService calendarService;
	
	@RequestMapping(value="/calendar/schedule.do")
	public String schedule(@ModelAttribute("scheduleVO") ScheduleVO scheduleVO, Model model, HttpServletRequest request, HttpServletResponse response, 
			HttpSession session) {
		
		return "calendar/schedule";
	}
	
	@RequestMapping(value="/calendar/registerSchedule.do")
	public String registerSchedule(@ModelAttribute("scheduleVO") ScheduleVO scheduleVO, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String choiceDate = scheduleVO.getSchdul_date();
		
		model.addAttribute("schdul_date", choiceDate);
		
		return "calendar/registerSchedule";
	}
	
	@RequestMapping(value="/calendar/insertSchedule.do")
	public String insertSchedule(@ModelAttribute("scheduleVO") ScheduleVO scheduleVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		UUID uuid = UUID.randomUUID();
		
		scheduleVO.setSchdul_id(uuid.toString());
		calendarService.insertSchedule(scheduleVO);
		
		return "redirect:/calendar/schedule.do";
	}
}
