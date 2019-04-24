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
	
}
