package com.shopping.api;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Restapi {
	
	@RequestMapping(value="/api/greeting.do")
	public Greeting greeting() {
		return new Greeting(13, "Hello World");
	}
}
