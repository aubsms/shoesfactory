package com.shoesfactory.service;

import java.util.List;

import com.shoesfactory.DAOVO.admin.adminStockVO;
import com.shoesfactory.DAOVO.admin.adminVO;
import com.shoesfactory.DAOVO.product.ProductVO;

public interface adminService {
	
	public List memAllseach();
	
	public List prodAllseach();
	
	public ProductVO prodOneseach(ProductVO vo);
	
	public List prodStandardseach(ProductVO vo);
	
	public List prodStockseach();
	
	public adminStockVO proStockOne(adminStockVO vo);
	
	public void prodInsert(ProductVO vo);
	
	public void prodUpdate(ProductVO vo);
	
	public void prodDelete(ProductVO vo);
	
	public void stockInsert(adminStockVO vo);
	
	public void stockUpdate(adminStockVO vo);
	
	public void stockDelete(adminStockVO vo);
	
	
}
