package com.shoesfactory.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoesfactory.DAOVO.product.ProductVO;
import com.shoesfactory.DAOVO.product.productHisVO;
import com.shoesfactory.service.productService;


@Controller
public class productController {
	
	@Resource(name="productService")
	private productService productService;
	
	@RequestMapping(value = "/prod_list.do")
	public String searchProducts(Model model) {
		model.addAttribute("products",productService.searchProducts());
		System.out.println("here");
		return "product/prod_list";
	}
	
	@RequestMapping(value="/prod_detail.do")
	public String searchProduct(Model model,@RequestParam(value="prod_name") String prod_name) {
		System.out.println(prod_name);
		ProductVO vo1 = new ProductVO(prod_name);
		
		ProductVO vo2 = (ProductVO) productService.searchProduct(vo1);
		model.addAttribute("product",productService.searchProduct(vo1));
	
		return "product/prod_detail";
	}
	
	@RequestMapping(value="/prod_his.do")
	public String oderhistory(Model model,HttpSession session, HttpServletRequest req) {
		String path="";
		try {
			session = req.getSession();
			productHisVO vo = new productHisVO();
			vo.setHis_name((String)session.getAttribute("sloginNum"));
			List<productHisVO> list = productService.searchHis(vo);
			int total = totalprice(list);
			model.addAttribute("hisinfo",list);
			model.addAttribute("totalprice", total);
			path="product/OrderList";
		}
		catch(Exception e) {
			path="product/error_his";
		}
		return path;
		
	}
	
	public int totalprice(List<productHisVO> list) {
		int sum=0;
		for(int i=0; i<list.size(); i++) {
			sum+=list.get(i).getHis_price();
		}
		return sum;
		
	}
}
