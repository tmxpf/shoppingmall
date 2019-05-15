package com.shopping.calendar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {

	@Autowired
	CalendarService calendarService;
	
	@RequestMapping(value="/calendar/schedule.do")
	public String schedule(@ModelAttribute("scheduleVO") CalendarVO calendarVO, Model model, HttpServletRequest request, HttpServletResponse response, 
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
	public String insertSchedule(@ModelAttribute("scheduleVO") ScheduleVO scheduleVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
//		UUID uuid = UUID.randomUUID();
//		
//		scheduleVO.setSchdul_id(uuid.toString());
		scheduleVO.setUsercode(Integer.parseInt((String) session.getAttribute("id")));
		calendarService.insertSchedule(scheduleVO);
		
		return "redirect:/calendar/schedule.do";
	}
	
	@RequestMapping(value="/calendar/showSchedule.do")
	public String showSchedule(@ModelAttribute("scheduleVO") ScheduleVO scheduleVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/calendar/getScheduleList.do")
	public List<ScheduleVO> getScheduleList(@ModelAttribute("scheduleVO") CalendarVO calendarVO, Model model, HttpServletRequest request, HttpServletResponse response, 
			HttpSession session) {
		
		List<ScheduleVO> resultList = calendarService.selectSchedule(calendarVO);
		
		return resultList;
	}

}
