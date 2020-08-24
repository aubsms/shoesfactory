package com.shoesfactory.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import com.shoesfactory.DAOVO.admin.adminStockVO;
import com.shoesfactory.DAOVO.member.MemberVO;
import com.shoesfactory.DAOVO.product.ProductVO;
import com.shoesfactory.service.adminService;


@Controller
/*@RequestMapping("/admin/*")*/
public class adminController {
	
	@Resource(name="adminService")
	private adminService adminService;
	
	@RequestMapping(value="/adminhome.do")
	public String adminhome() {
		return "admin/AdminPage";
	}
	
	@RequestMapping(value="/memall.do")
	public String memAllseach(Model model) {
		List<MemberVO> list = adminService.memAllseach();
		model.addAttribute("memAll",list);
		return "admin/admin_member";
	}
	
	@RequestMapping(value="/prodall.do")
	public String prodAllseach(Model model) {
		List list = adminService.prodAllseach();
		model.addAttribute("prodAll", list);
		return "admin/admin_product";	
	}
	
	@RequestMapping(value="/prodone.do")
	public String prodOneseach(Model model, @RequestParam("prod_name") String param) {
		System.out.println(param);
		ProductVO vo = new ProductVO(param);
		adminStockVO stock= new adminStockVO(param);
		ProductVO resultVO = adminService.prodOneseach(vo);
		adminStockVO resultStock = adminService.proStockOne(stock);
		
		model.addAttribute("prodOne", resultVO);
		model.addAttribute("prodstock", resultStock);
		return "admin/admin_productone";
	}
	
	@RequestMapping(value="/prodstandard.do")
	public String prodStandard(Model model,ProductVO vo) {
		List list = adminService.prodStandardseach(vo);
		model.addAttribute("prodAll", list);
		return "admin/admin_product";
	}
	
	@RequestMapping(value="/seachStock.do")
	public String prodStocksearch(Model model, adminStockVO vo) {
		List list = adminService.prodStockseach();
		model.addAttribute("prodStock", list);
		return null;
		
	}
	
	@RequestMapping(value="/insertview.do")
	public String insertview() {
		return "admin/admin_productinsert";
	}
	
	@RequestMapping(value="/prodinsert.do")
	public String prodInsert(Model model, ProductVO vo) {

		adminService.prodInsert(vo);
		List list = adminService.prodAllseach();
		model.addAttribute("prodAll", list);
		return "admin/admin_product";
	}
	
	@RequestMapping(value="/produpdate.do")
	public String prodUpdate(Model model,ProductVO vo) {
		
		adminService.prodUpdate(vo);

		return "redirect:prodall.do";
		
	}
	
	@RequestMapping(value="/proddelete.do")
	public String prodDelete(ProductVO vo) {
		adminStockVO stockvo = new adminStockVO(vo.getProd_name());
		adminService.stockDelete(stockvo);
		adminService.prodDelete(vo);
		return "redirect:prodall.do";
	}
	
	@RequestMapping(value="/stocklist.do")
	public String stocklist(Model model) {
		List list = adminService.prodStockseach();
		model.addAttribute("stockAll", list);
		return "admin/admin_stock";	
	}
	
	@RequestMapping(value="/stockinsertview.do")
	public String stockinsertview(Model model) {
		
		return "admin/admin_stockinsert";	
	}
	
	@RequestMapping(value="/stockinsert.do")
	public String stockInsert(adminStockVO vo) {
		String path="";
		try {
		
		adminService.stockInsert(vo);
		path="redirect:stocklist.do";
		}
		catch(Exception e) {
			path="admin/error_view";
		}
		return path;
		
	}
	
	@RequestMapping(value="/stockupdateview.do")
	public String stockupdateview(@RequestParam("prod_name")String prod_name,Model model) {
	
		adminStockVO stockvo = new adminStockVO();
		stockvo.setProd_name(prod_name);
		adminStockVO resultvo = new adminStockVO();
		resultvo = adminService.proStockOne(stockvo);
		model.addAttribute("stockList", resultvo);
		return "admin/admin_stockupdate";
		
	}
	
	@RequestMapping(value="/stockupdate.do")
	public String stockUpdate(adminStockVO vo) {
		adminService.stockUpdate(vo);
		return "redirect:stocklist.do";
	}

}
