package com.shoesfactory.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoesfactory.DAOVO.cart.cartDAO;
import com.shoesfactory.DAOVO.cart.cartVO;
import com.shoesfactory.DAOVO.product.productHisVO;


@Service("cartService")
public class CartServiceImpl implements CartService{
	
	@Resource(name="cartDAO")
	private cartDAO cartDAO;
	
	@Override
	public List<cartVO> CartView(cartVO vo1) {
		List<cartVO> list1 = cartDAO.cartUserProduct(vo1);
		return list1;				
	}

	@Override
	public void AddCart(cartVO vo1) {
		cartDAO.addproduct(vo1);
	}
	
	@Override
	public void AddCartOverLap(cartVO vo1) {
		cartDAO.overlapProduct(vo1);
		
	}


	@Override
	public void DeleteCart(cartVO vo1) {
		cartDAO.deleteproduct(vo1);
		
	}

	@Override
	public void UpdateCart(cartVO vo1) {
		cartDAO.updateproduct(vo1);
		
	}

	@Override
	public List<cartVO> ParseCart(HashMap<String, List> map1, List<cartVO> list1) {
		List<cartVO> cartlist =  map1.get(list1.get(0).getCart_usernum());
		List<cartVO> updatelist = null;
		for(int i=0; i<list1.size(); i++) {
			if(cartlist.get(i).getCart_product_amount() != list1.get(i).getCart_product_amount()) {
				cartVO vo1= new cartVO(list1.get(i).getCart_usernum(),list1.get(i).getCart_product_name(),list1.get(i).getCart_product_amount(),
							list1.get(i).getCart_product_size(), list1.get(i).getCart_product_price(),list1.get(i).getCart_product_mainimg());
				updatelist.add(vo1);
			}
		}
		return updatelist;
		
	}

	@Override
	public String overlapCheck(cartVO vo1) {
		String checkStr="";

		int checkNum = cartDAO.overlapCheck(vo1);
		if(checkNum>0) {
			checkStr = "overlap";
		}
		else {
			checkStr = "nonoverlap";
		}
		return checkStr;
	}

	@Override
	public void payready(productHisVO vo) {
		// TODO Auto-generated method stub
		
	}

	
	/*@Override
	public HashMap PurchaseCart(List itemlist,String usernum) {
		HashMap resultmap = new HashMap();
		resultmap = cartdao.purchase(usernum,itemlist);
		return resultmap;
	}*/


}
