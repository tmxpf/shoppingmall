package com.shopping.login;

import java.io.Serializable;

public class SmUserVO implements Serializable{

	private static final long serialVersionUID = -2914067010762543779L;

	/*이름*/
	private String name;
	
	/*아이디*/
	private String id;
	
	/*비밀번호*/
	private String pw;
	
	/*이메일*/
	private String email;
	
	/*생년월일*/
	private String rrn;
	
	/*고유번호*/
	private int usercode;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	
}
