package com.shoesfactory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.product.ProductDAO;
import com.shoesfactory.DAOVO.product.ProductVO;
import com.shoesfactory.DAOVO.product.productHisVO;

@Service("productService")
public class productServiceImpl implements productService {
	@Autowired
	private ProductDAO productdao;

	@Override
	public List<ProductVO> searchProducts() {
		// TODO Auto-generated method stub
		List<ProductVO> list = productdao.searchProducts();
		return list;
	}

	@Override
	public ProductVO searchProduct(ProductVO vo) {
		// TODO Auto-generated method stub.

		return productdao.searchProduct(vo);
	}

	@Override
	public List<productHisVO> searchHis(productHisVO vo) {
		// TODO Auto-generated method stub
		return productdao.searchHis(vo);
	}
}
