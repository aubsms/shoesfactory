package com.shoesfactory.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.admin.adminDAO;
import com.shoesfactory.DAOVO.admin.adminStockVO;
import com.shoesfactory.DAOVO.admin.adminVO;
import com.shoesfactory.DAOVO.product.ProductVO;

@Service("adminService")
public class adminServiceImpl implements adminService{
	
	@Resource(name="adminDAO")
	private adminDAO adminDAO;

	@Override
	public List memAllseach() {
		
		return adminDAO.seachMemAll();
	}

	@Override
	public List prodAllseach() {
		// TODO Auto-generated method stub
		return adminDAO.seachProdAll();
	}
	
	@Override
	public ProductVO prodOneseach(ProductVO vo) {
		// TODO Auto-generated method stub
		return adminDAO.seachProdOne(vo);
	}

	@Override
	public List prodStandardseach(ProductVO vo) {
		// TODO Auto-generated method stub
		return adminDAO.seachProdStandard(vo);
	}

	@Override
	public List prodStockseach() {
		// TODO Auto-generated method stub
		return adminDAO.seachProdStock();
	}
	
	@Override
	public adminStockVO proStockOne(adminStockVO vo) {
		
		return adminDAO.seachStockOne(vo);
	}

	@Override
	public void prodInsert(ProductVO vo) {
		adminDAO.prodInsert(vo);
	}

	@Override
	public void prodUpdate(ProductVO vo) {
		// TODO Auto-generated method stub
		adminDAO.prodUpdate(vo);
	}

	@Override
	public void prodDelete(ProductVO vo) {
		// TODO Auto-generated method stub
		adminDAO.prodDelete(vo);
	}

	@Override
	public void stockInsert(adminStockVO vo) {
		// TODO Auto-generated method stub
		adminDAO.stockInsert(vo);
	}

	@Override
	public void stockUpdate(adminStockVO vo) {
		// TODO Auto-generated method stub
		adminDAO.stockUpdate(vo);
	}

	@Override
	public void stockDelete(adminStockVO vo) {
		// TODO Auto-generated method stub
		adminDAO.stockDelete(vo);
	}

	

	

}
