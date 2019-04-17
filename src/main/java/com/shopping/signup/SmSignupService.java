package com.shopping.signup;

import com.shopping.login.SmUserVO;

public interface SmSignupService {

	public void insertUser(SmUserVO userVO);
	
	public String selectIdCheck(SmUserVO userVO);
}
