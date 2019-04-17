package com.shopping.signup;

import com.shopping.login.SmUserVO;

public interface SmSignupDAO {

	public void insertUserInfo(SmUserVO userVO);
	
	public String selectId(SmUserVO userVO);
}
