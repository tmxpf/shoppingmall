package com.shopping.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping(value="/calendar/schedule.do")
	public String schedule() {
		
		return "calendar/schedule";
	}
}
