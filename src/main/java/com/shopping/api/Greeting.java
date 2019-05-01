package com.shopping.api;

import java.io.Serializable;

public class Greeting implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -364054071120594589L;
	
	private  long id;
	private  String content;
	
	Greeting(long id, String content) {
		this.id = id;
		this.content = content;
	}
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
