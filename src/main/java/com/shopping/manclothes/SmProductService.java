package com.shopping.manclothes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface SmProductService {

	public List<ProductVO> getProductList(Map<String,Object> boardInfo);
	
	public int getProducListCnt();
	
	public ProductVO getProduct(ProductVO vo);
}
