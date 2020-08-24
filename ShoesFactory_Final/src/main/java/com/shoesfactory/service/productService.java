package com.shoesfactory.service;

import java.util.List;

import com.shoesfactory.DAOVO.product.ProductVO;
import com.shoesfactory.DAOVO.product.productHisVO;

public interface productService {
	public List<ProductVO> searchProducts();
	
	public ProductVO searchProduct(ProductVO vo); 
	
	public List<productHisVO> searchHis(productHisVO vo);
}
