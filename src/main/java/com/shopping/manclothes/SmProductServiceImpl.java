package com.shopping.manclothes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SmProductServiceImpl implements SmProductService{

	@Autowired
	private SmProductDAO smProductDAO;

	@Override
	public List<ProductVO> getProductList(Map<String,Object> boardInfo) {
		return smProductDAO.selectProdutList(boardInfo);
	}

	@Override
	public int getProducListCnt(Map<String, Object> boardInfo) {
		return smProductDAO.selectProdutListCnt(boardInfo);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return smProductDAO.selectProduct(vo);
	}

	@Override
	public void setManBoard(ProductBoardVO productBoardVO) {
		smProductDAO.insertManBoard(productBoardVO);
	}

	@Override
	public List<ProductVO> getProductListAPI() {
		return smProductDAO.selectManProductListAPI();
	}

	@Override
	public List<ProductBoardVO> getManBoardList() {
		return smProductDAO.selectManProductList();
	}

	@Override
	public ProductVO getProductOneAPI(String name) {
		return smProductDAO.selectManProductOne(name);
	}

	@Override
	public void insertProduct(ProductVO vo) {
		smProductDAO.insertProductOne(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		smProductDAO.updateProductOne(vo);
	}

	@Override
	public void deleteProductOne(String uuid) {
		smProductDAO.deleteProductOne(uuid);
	}

	@Override
	public ProductBoardVO getManBoardOne(ProductBoardVO productBoardVO) {
		return smProductDAO.getManBoardOne(productBoardVO);
	}
	
}
