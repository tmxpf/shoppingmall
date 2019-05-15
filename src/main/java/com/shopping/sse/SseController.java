package com.shopping.sse;

import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.context.event.EventListener;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;


@RestController
public class SseController {

	private final CopyOnWriteArrayList<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	public SseController() {}
	
	@Secured({"ROLE_USER"})
	@GetMapping
	public SseEmitter handle() {
		
		final SseEmitter emitter = new SseEmitter();
		
		this.emitters.add(emitter);
		
		emitter.onCompletion(new Runnable() {
			
			public void run() {
				emitters.remove(emitter);
			}
			
		});
		
		emitter.onTimeout(new Runnable() {
			
			public void run() {
				emitters.remove(emitter);
			}
			
		});

		return emitter;
	}
	

	
//	@EventListener
//	public void onIssueStateChangeEvent(IssueStateChangeEvent event) {
//		
//	}
	
}
