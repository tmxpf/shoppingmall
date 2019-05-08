package com.shopping.websocket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketContoller {

	
	@RequestMapping(value="/websocket/socketTest.do")
	public String socketTest() {
		
		return "websocket/socketTest";
	}
}
