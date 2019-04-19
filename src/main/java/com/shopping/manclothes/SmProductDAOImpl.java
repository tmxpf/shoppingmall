package com.shopping.manclothes;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SmProductDAOImpl implements SmProductDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "boardMapper";
	
	@Override
	public List<ProductVO> selectProdutList() {
		return sqlSession.selectList(Namespace + ".selectProductList");
	}

}
