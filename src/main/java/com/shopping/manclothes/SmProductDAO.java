package com.shopping.manclothes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface SmProductDAO {

	public List<ProductVO> selectProdutList(Map<String,Object> boardInfo);
	
	public int selectProdutListCnt();
	
	public ProductVO selectProduct(ProductVO vo);
}