package com.shopping.websocket;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.shopping.calendar.CalendarService;
import com.shopping.calendar.ScheduleVO;


public class SocketHandler extends TextWebSocketHandler implements InitializingBean{

	private final Logger logger = LogManager.getLogger(getClass());
	private Set<WebSocketSession> sessionSet = new HashSet<>();
	
	@Autowired
	CalendarService calendarService;
	
	public SocketHandler() {
		super();
		this.logger.info("create SocketHandler instance!");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);
		this.logger.info("remove session!");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		
		sessionSet.add(session);
		this.logger.info("add session!");
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		super.handleMessage(session, message);
		
		this.logger.info("receive message!" + message.toString());
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
		
		this.logger.error("web socket error!", exception);
	}
	
	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		this.logger.info("call method!");
		
		return super.supportsPartialMessages();
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
		Thread thread = new Thread() {
			int i = 0;
			
			@Override
			public void run() {
				
				while(true) {
					try {
						sendMessage("send message index =>" + i++);
						Thread.sleep(3000);
					} catch(InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		
		thread.start();
	}

	
	public void sendMessage(String message) {
		for(WebSocketSession session : this.sessionSet) {
			
			Map<String,Object> map = session.getAttributes();
			String userId = (String)map.get("id");
			
			if(session.isOpen() && !"".equals(userId) && userId != null) {
				try {
					Date today = new Date();
					Map<String, Object> paramTime = new HashMap<>();
					
					SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat timeHH = new SimpleDateFormat("HH");
					SimpleDateFormat timeMM = new SimpleDateFormat("mm");
					
					paramTime.put("userId", userId);
					paramTime.put("date", date.format(today));
					paramTime.put("timeHH", timeHH.format(today));
					paramTime.put("timeMM", timeMM.format(today));
					
					ScheduleVO vo =  calendarService.selectScheduleOne(paramTime);
					
					if(vo != null && !"Y".equals(vo.getSchdul_chk()))
							calendarService.updateSchdulChk(vo);
					
					String resultMessage = (vo != null ? vo.getSchdul_date() : message);
					session.sendMessage(new TextMessage(resultMessage));
				}catch(Exception e) {
					this.logger.error("fail to send message!", e);
				}
			}
		}
	}
}
