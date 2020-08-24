package com.shoesfactory.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoesfactory.DAOVO.cart.cartVO;
import com.shoesfactory.DAOVO.product.productHisVO;

public interface CartService {

	public List<cartVO> CartView(cartVO vo1);
	
	public void AddCart(cartVO vo1);
	
	public void AddCartOverLap(cartVO vo1);
	
	public void DeleteCart(cartVO vo1);
	
	public void UpdateCart(cartVO vo1);
	
	public List<cartVO> ParseCart(HashMap<String, List> map1, List<cartVO> list1);
	
	public String overlapCheck(cartVO vo1);
	
	public void payready(productHisVO vo);
	
	/*public HashMap PurchaseCart(List itemlist, String usernum);*/

	
}
