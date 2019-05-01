package com.shopping.manclothes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface SmProductService {

	public List<ProductVO> getProductList(Map<String,Object> boardInfo);
	
	public int getProducListCnt(Map<String, Object> boardInfo);
	
	public ProductVO getProduct(ProductVO vo);
	
	public void setManBoard(ProductBoardVO productBoardVO);
	
	public List<ProductVO> getProductListAPI();
	
	public List<ProductBoardVO> getManBoardList();
	
	public ProductVO getProductOneAPI(String name);
	
	public void insertProduct(ProductVO vo);
	
	public void updateProduct(ProductVO vo);
	
	public void deleteProductOne(String uuid);
}
