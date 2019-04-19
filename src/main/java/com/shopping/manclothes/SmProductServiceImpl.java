package com.shopping.manclothes;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SmProductServiceImpl implements SmProductService{

	@Autowired
	private SmProductDAO smProductDAO;

	@Override
	public List<ProductVO> getProductList() {
		return smProductDAO.selectProdutList();
	}
	
}
