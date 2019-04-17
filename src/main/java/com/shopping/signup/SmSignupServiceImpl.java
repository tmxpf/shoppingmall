package com.shopping.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.login.SmUserVO;

@Service("SignupService")
public class SmSignupServiceImpl implements SmSignupService{

	@Autowired
	private SmSignupDAOImpl signupDAOImpl;
	
	@Override
	public void insertUser(SmUserVO userVO) {
		signupDAOImpl.insertUserInfo(userVO);
	}

	@Override
	public String selectIdCheck(SmUserVO userVO) {
		return signupDAOImpl.selectId(userVO);
	}
}
