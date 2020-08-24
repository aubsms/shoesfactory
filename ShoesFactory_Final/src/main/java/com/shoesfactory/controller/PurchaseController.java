package com.shoesfactory.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoesfactory.DAOVO.cart.cartVO;
import com.shoesfactory.DAOVO.member.MemberVO;
import com.shoesfactory.DAOVO.product.productHisVO;
import com.shoesfactory.DAOVO.purchase.purchaseVO;
import com.shoesfactory.service.PurchaseService;


@Controller("purchaseController")
/*@RequestMapping(value="/purchase/*")*/
public class PurchaseController{
	
	/*@Resource(name="purchaseService")*/
	@Lazy
	@Autowired
	@Qualifier("purchaseService")
	private PurchaseService purchaseService;
	
	@RequestMapping(value="/Purchase.purchase")
	public String Purchase(HttpSession session, Model model) {
		
		System.out.println("purchase");
		
		ArrayList list = null;
		
		list = (ArrayList) session.getAttribute((String) session.getAttribute("sloginNum"));
		
		String usernum = (String)session.getAttribute("sloginNum");		
		
		List itemlist = (List)session.getAttribute((String) session.getAttribute("sloginNum"));
		
		HashMap<String,List<cartVO>> selectMap = purchaseService.PurchaseCart(itemlist, usernum);
		
		model.addAttribute("purchase_List", selectMap);
		
		String list_String = purchaseService.productParser(itemlist);
		
		cartVO vo1 = new cartVO(usernum);
		
		String totalprice = String.valueOf(purchaseService.totalPrice(selectMap,usernum));
		
		String payNum = purchaseService.payNum(usernum);
		
		String  payStatus = "0";
		
		List<cartVO> paylist = (List) selectMap.get(usernum);
		
		
		
		for(int i=0; i<paylist.size(); i++) {
			
			productHisVO vo = new productHisVO();
			vo.setHis_tel(paylist.get(i).getCart_usernum());
			vo.setHis_name((paylist.get(i)).getCart_product_name());
			vo.setHis_size((paylist.get(i)).getCart_product_size());
			vo.setHis_amount(paylist.get(i).getCart_product_amount());
			vo.setHis_price(Integer.parseInt((paylist.get(i)).getCart_product_price()));
			vo.setHis_imgpath((paylist.get(i)).getCart_product_mainimg());
			
			purchaseService.payListAdd(vo);
		}
		
		
		MemberVO vo = new MemberVO();
		vo.setMem_tel(paylist.get(0).getCart_usernum());
		
		model.addAttribute("userinfo",purchaseService.userinfo(vo));
		
		model.addAttribute("totalprice", totalprice);
		
		return "pay/pay_view";
		
	}
	
	@RequestMapping(value="/directpay.do")
	public String directpay(@RequestParam Map<String,String> map,Model model,HttpServletRequest req, HttpSession session) {
		session = req.getSession();
		productHisVO vo = new productHisVO();
		vo.setHis_tel((String)session.getAttribute("sloginNum"));
		vo.setHis_name(map.get("his_name"));
		vo.setHis_size( map.get("his_size"));
		vo.setHis_price(Integer.parseInt(map.get("his_price")));
		vo.setHis_amount(map.get("his_amount"));
		vo.setHis_imgpath(map.get("his_imgpath"));
		
		
		purchaseService.payListAdd(vo);
		
		/*ashMap<String,purchaseVO> directMap = new HashMap<String,purchaseVO>();
		directMap.put("direct_List",vo);
		model.addAttribute((String) session.getAttribute("sloginNum"), directMap);*/
	
		
		model.addAttribute("direct_List", vo);
		return "pay/pay_directview";	
	}
	
	@RequestMapping(value="/CartAllpurchase.do")
	public String cartAll(HttpSession session,HttpServletRequest req,Model model) {
		
		session = req.getSession();
		String usernum = (String)session.getAttribute("sloginNum");
		cartVO vo = new cartVO();
		vo.setCart_usernum(usernum);
		List<cartVO> list = purchaseService.cartall(vo);
		HashMap<String,List<cartVO>> selectMap = new HashMap<String,List<cartVO>>();
		selectMap.put(usernum, list);
		String totalprice = String.valueOf(purchaseService.totalPrice(selectMap,usernum));
		model.addAttribute("purchase_List",selectMap);
		model.addAttribute("totalprice", totalprice);
		return "pay/pay_view";
	}

	
	@RequestMapping(value="/payEnd.purchase")
	public String payEnd(Model model,HttpServletRequest req, HttpSession session) throws ParseException {
		session = req.getSession();
		session.getAttribute("sloginNum");
		productHisVO vo = new productHisVO();
		vo.setHis_tel((String)session.getAttribute("sloginNum"));
		List<productHisVO> resultList = purchaseService.paylist(vo);
		model.addAttribute("paylist", resultList);
		
		return "pay/order_finished";
		
	}

}
