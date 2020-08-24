package com.shoesfactory.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.cart.cartVO;
import com.shoesfactory.DAOVO.member.MemberVO;
import com.shoesfactory.DAOVO.product.productHisVO;
import com.shoesfactory.DAOVO.purchase.purchaseVO;

public interface PurchaseService {
	
	public HashMap PurchaseCart(List itemlist, String usernum);
	
	public List<cartVO> cartall(cartVO vo);
	
	public void payListAdd(productHisVO pvo);
	
	public String productParser(List list);
	
	public int totalPrice(HashMap selectMap, String usernum);
	
	public String payNum(String usernum);
	
	public List<productHisVO> paylist(productHisVO vo);
	
	public List<MemberVO> userinfo(MemberVO vo);

}
