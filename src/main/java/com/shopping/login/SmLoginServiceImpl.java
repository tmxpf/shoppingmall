package com.shopping.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("LoginService")
public class SmLoginServiceImpl implements SmLoginService{

	@Autowired
	public SmLoginDAOImpl loginDAOImpl; 
	
	@Override
	public SmUserVO selectUser(SmUserVO userVO) {
		return loginDAOImpl.getUserInfo(userVO);
	}

}
