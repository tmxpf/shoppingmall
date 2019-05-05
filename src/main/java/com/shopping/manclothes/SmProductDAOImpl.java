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
	public int selectProdutListCnt(Map<String, Object> boardInfo) {
		return sqlSession.selectOne(Namespace + ".selectProductListCnt", boardInfo);
	}

	@Override
	public ProductVO selectProduct(ProductVO vo) {
		return sqlSession.selectOne(Namespace + ".selectProduct", vo);
	}

	@Override
	public void insertManBoard(ProductBoardVO productBoardVO) {
		sqlSession.insert(Namespace + ".insertManBoard", productBoardVO);
	}

	@Override
	public List<ProductVO> selectManProductListAPI() {
		return sqlSession.selectList(Namespace + ".getProductListAPI");
	}

	@Override
	public List<ProductBoardVO> selectManProductList() {
		return sqlSession.selectList(Namespace + ".getManProductList");
	}

	@Override
	public ProductVO selectManProductOne(String name) {
		return sqlSession.selectOne(Namespace + ".getManProductOne", name);
	}

	@Override
	public void insertProductOne(ProductVO vo) {
		sqlSession.insert(Namespace + ".insertProductOne", vo);
	}

	@Override
	public void updateProductOne(ProductVO vo) {
		sqlSession.update(Namespace + ".updateProductOne", vo);
	}

	@Override
	public void deleteProductOne(String uuid) {
		sqlSession.update(Namespace + ".deleteProductOne", uuid);
	}

	@Override
	public ProductBoardVO getManBoardOne(ProductBoardVO productBoardVO) {
		return sqlSession.selectOne(Namespace + ".selectManBoardOne", productBoardVO);
	}

}
