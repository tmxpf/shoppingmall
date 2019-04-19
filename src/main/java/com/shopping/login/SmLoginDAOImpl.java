package com.shopping.login;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("LoginDAO")
public class SmLoginDAOImpl implements SmLoginDAO{

	
	@Autowired
	private SqlSessionFactory sqlsessionFactory;
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "loginMapper";
	/*private static final String Namespace = "mapper.login.loginMapper";*/
	
	@Override
	public SmUserVO getUserInfo(SmUserVO userVO) {
		//return sqlsessionFactory.openSession().selectOne( Namespace + ".selectUserInfo", userVO);
		return sqlSession.selectOne( Namespace + ".selectUserInfo", userVO);
	}
	
}
