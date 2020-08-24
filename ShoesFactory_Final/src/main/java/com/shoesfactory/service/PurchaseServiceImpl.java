package com.shoesfactory.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.cart.cartVO;
import com.shoesfactory.DAOVO.member.MemberVO;
import com.shoesfactory.DAOVO.product.productHisVO;
import com.shoesfactory.DAOVO.purchase.purchaseDAO;
import com.shoesfactory.DAOVO.purchase.purchaseVO;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService{
	
	@Resource(name="purchaseDAO")
	private purchaseDAO purchaseDAO;
	
	@Override
	public HashMap PurchaseCart(List itemlist,String usernum) {
		HashMap resultmap = new HashMap();
		resultmap = purchaseDAO.purchase(usernum,itemlist);
		return resultmap;
	}
	
	

	@Override
	public void payListAdd(productHisVO vo) {
		purchaseDAO.payAdd(vo);	
	}

	@Override
	public String productParser(List list) {
		String str = "";
		for(int i=0; i<list.size(); i++) {
			if(i != list.size()-1) {
				str += list.get(i)+"/";
			}
			else {
				str += list.get(i);
			}
		}
		System.out.println(str);
		return str;
	}

	@Override
	public int totalPrice(HashMap selectMap1,String usernum) {
		int totalPrice=0;
		cartVO vo = new cartVO();
		/*List list = (List) selectMap1.get(usernum);*/
		List list = (List) selectMap1.get(usernum);
		for(int i=0; i<list.size(); i++) {
			vo = (cartVO) list.get(i);
			totalPrice = totalPrice + Integer.parseInt(vo.getCart_product_price());
		}
		return totalPrice;
	}

	@Override
	public String payNum(String usernum) {
		Date date = new Date(0);
		String pay_num = usernum + date.getDate();
		return pay_num;
	}

	@Override
	public List<productHisVO> paylist(productHisVO vo) {
		
		return purchaseDAO.paylist(vo);
	}



	@Override
	public List<cartVO> cartall(cartVO vo) {
		
		return purchaseDAO.cartall(vo);
	}



	@Override
	public List<MemberVO> userinfo(MemberVO vo) {
		// TODO Auto-generated method stub
		return purchaseDAO.userinfo(vo);
	}
	


	
	
	
	
	
	
}
