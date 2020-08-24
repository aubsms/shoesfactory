package com.shoesfactory.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoesfactory.DAOVO.cart.cartVO;
import com.shoesfactory.DAOVO.product.productHisVO;
import com.shoesfactory.service.CartService;



/**
 * Handles requests for the application home page.
 */
@Controller("cartController")
/*@RequestMapping(value="/cart/*")*/
public class CartController{
	
	private HashMap<String, List> map = null;
	HttpSession session=null;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/CartView.do")
	public String CartView(ModelAndView modelandview, RedirectAttributes rediect,
			HttpServletRequest req, HttpSession session) {
		session = req.getSession();
		System.out.println(session.getAttribute("sloginNum"));
		
		cartVO vo1 = new cartVO((String) session.getAttribute("sloginNum"));
		modelandview.setViewName("redirect:/result.jsp");
		session.setAttribute("cartinfo",cartService.CartView(vo1));
		return "cart/cart_view";
	}
	
	
	
	@RequestMapping(value="/AddCart.do")
	public String AddCart(@RequestParam Map<String,String> map,
						  HttpSession session, HttpServletRequest req) {
		System.out.println("addcart");
		session = req.getSession();
		
		System.out.println(map.get("cart_product_name"));
		System.out.println(map.get("cart_product_amount"));
		System.out.println(map.get("cart_product_size"));
		System.out.println(map.get("cart_product_price"));
		System.out.println(map.get("cart_product_mainimg"));
		cartVO vo = new cartVO((String)session.getAttribute("sloginNum"),map.get("cart_product_name"),
				map.get("cart_product_amount"),map.get("cart_product_size"),map.get("cart_product_price"),map.get("cart_product_mainimg"));
	
		String checkStr = overlapCheck(vo);
		if(checkStr.equals("nonoverlap")) {
			cartService.AddCart(vo);
		}
		else {
			int updateAmount = Integer.parseInt(vo.getCart_product_amount());
			vo.setCart_product_amount(String.valueOf(updateAmount+1));
			cartService.AddCartOverLap(vo);
		}
		/*modelandview.setViewName("cart/cart_view");*/
		
		return "redirect:CartView.do";	
	}
	
	@RequestMapping(value="/DeleteProduct.do",method=RequestMethod.GET)
	public String DeleteCart(cartVO vo1, ModelAndView modelandview) {
		System.out.println("delete");
		System.out.println(vo1.getCart_usernum());
		System.out.println(vo1.getCart_product_name());
		System.out.println(vo1.getCart_product_amount());
		System.out.println(vo1.getCart_product_size());
		System.out.println(vo1.getCart_product_price());
		cartService.DeleteCart(vo1);
		modelandview.setViewName("cart/cart_view");
		return "redirect:CartView.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/UpdateProduct.do")
	public cartVO UpdateCart(@RequestParam Map<String, Object> param, HttpServletRequest request) throws ParseException {
		String jsonstr = (String)param.get("json");
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject)parser.parse(jsonstr);
		//JSONArray personArray = (JSONArray)jsonObject.get("test");
		System.out.println(jsonObject);
		System.out.println(jsonObject.get("usernum"));
		System.out.println(jsonObject.get("pname"));
		System.out.println(jsonObject.get("amount"));
		System.out.println(jsonObject.get("psize"));
		System.out.println(jsonObject.get("price"));
		String cart_usernum = (String) jsonObject.get("usernum");
		String cart_product_name = (String)jsonObject.get("pname");
		String cart_product_amount = (String)jsonObject.get("amount");
		String cart_product_size = (String)jsonObject.get("psize");
		String cart_product_price = (String)jsonObject.get("price");
		String cart_product_mainimg = (String)jsonObject.get("img");
		cartVO updatevo = new cartVO(cart_usernum,cart_product_name,cart_product_amount,cart_product_size,cart_product_price,cart_product_mainimg);
		JSONObject cartObject = new JSONObject();
	
		cartService.UpdateCart(updatevo);
		/*session.invalidate();*/
		return updatevo;
	}
	@ResponseBody
	@RequestMapping(value="/ListParser.do", method=RequestMethod.GET)
	public String SelectPurchase(@RequestParam Map<String,Object> param, ModelAndView modelandview,
			HttpSession session) throws ParseException {
		ArrayList list = null;
		String cartstr = (String)param.get("cart");
		System.out.println(cartstr);
		JSONParser parser = new JSONParser();
		JSONObject cartObject = (JSONObject)parser.parse(cartstr);
		list = (ArrayList) cartObject.get("plist");
		session.setAttribute((String) session.getAttribute("sloginNum"), list);
		return "success";
		
	}


	/*@RequestMapping(value="/Purchase.do")
	public String Purchase(HttpSession session, Model model) {
		ArrayList list = null;
		list = (ArrayList) session.getAttribute((String) session.getAttribute("usernum"));
		String usernum = (String) session.getAttribute("usernum");
		List itemlist = (List) session.getAttribute((String) session.getAttribute("usernum"));
		for(int i=0; i<itemlist.size(); i++) {
			System.out.println(itemlist.get(i));
		}
		model.addAttribute("purchase_List", cartservice.PurchaseCart(itemlist, usernum));
		
		HashMap map = new HashMap();
		map.put("usernum", session.getAttribute("usernum"));
		map.put("cart_product_name",session.getAttribute((String) session.getAttribute("usernum")));
		
		return "Purchase.jsp";
		
	}*/
	
	public String overlapCheck(cartVO vo) {
		String checkStr = cartService.overlapCheck(vo);
		return checkStr;
	}
	
	
	
}

