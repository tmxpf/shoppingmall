package com.shopping.manclothes;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SmProductDAOImpl implements SmProductDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "boardMapper";
	
	@Override
	public List<ProductVO> selectProdutList(Map<String,Object> boardInfo) {
		return sqlSession.selectList(Namespace + ".selectProductList", boardInfo);
	}

	@Override
	public int selectProdutListCnt() {
		return sqlSession.selectOne(Namespace + ".selectProductListCnt");
	}

	@Override
	public ProductVO selectProduct(ProductVO vo) {
		return sqlSession.selectOne(Namespace + ".selectProduct", vo);
	}

}
