package com.shopping.manclothes;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SmProductDAOImpl implements SmProductDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.shopping.loginMapper";
	
	@Override
	public ArrayList<ProductVO> selectProdutList() {
		/*return sqlSession.selectList(Namespace + "");*/
		ArrayList<ProductVO> test = new ArrayList<ProductVO>();
		return test;
	}

}
