package com.shopping.sse;

import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;

public interface SseService {

	public void add(ResponseBodyEmitter emitter);
	
}
