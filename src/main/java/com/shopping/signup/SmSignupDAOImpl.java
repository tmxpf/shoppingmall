package com.shopping.signup;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.login.SmUserVO;

@Repository("SignupDAO")
public class SmSignupDAOImpl implements SmSignupDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.shopping.loginMapper";
	
	@Override
	public void insertUserInfo(SmUserVO userVO) {
		sqlSession.insert(Namespace + ".insertUserInfo", userVO);
	}

	@Override
	public String selectId(SmUserVO userVO) {
		return sqlSession.selectOne(Namespace + ".selectId", userVO);
	}
}
