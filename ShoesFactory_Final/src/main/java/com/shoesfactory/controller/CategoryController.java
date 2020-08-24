package com.shoesfactory.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoesfactory.DAOVO.category.categoryVO;
import com.shoesfactory.service.searchCatService;


@Controller
public class CategoryController {
	
	@Resource(name="searchcatService")
	private searchCatService searchcatService;
	
	@RequestMapping(value="/test.do")
	public String test() {
		return "header";
	}
	
	
	
	/*카테고리 대분류*/
	@RequestMapping(value = "/bigcategory.do")
	public String bigcate(categoryVO vo1, Model model, @RequestParam("bigtype") String param) {
		System.out.println(param);
		
		String big_name = "";
		
		if(param.equals("casual")) {
			big_name = "캐주얼화";
		}
		else if(param.equals("man")) {
			big_name = "남성화";
		}
		else if(param.equals("woman")) {
			big_name = "여성화";
		}
		else if(param.equals("kids")) {
			big_name = "아동화";
		}
		
		System.out.println(big_name);
		categoryVO catevo = new categoryVO(big_name);
		
		model.addAttribute("biginfo", searchcatService.Product(catevo));
		model.addAttribute("bigname", big_name);
		model.addAttribute("bigsmall", searchcatService.BigSmall(catevo));
		
		return "product/detail_big";
	}
	
	/*카테고리 소분류*/
	@RequestMapping(value = "/smallcategory.do")
	public String smallcate(categoryVO vo1, Model model, @RequestParam("smalltype") String param) {
		System.out.println(param);
		
		String small_name = "";
		
		if(param.equals("converse")) {
			small_name = "캔버스";
		}
		else if(param.equals("sneakers")) {
			small_name = "스니커즈";
		}
		else if(param.equals("sport")) {
			small_name = "운동화";
		}
		else if(param.equals("sandal")) {
			small_name = "샌들";
		}
		else if(param.equals("slipper")) {
			small_name = "슬리퍼";
		}
		else if(param.equals("man_shoes")) {
			small_name = "남성구두";
		}
		else if(param.equals("man_boots")) {
			small_name = "남성부츠";
		}
		else if(param.equals("man_walker")) {
			small_name = "남성워커";
		}
		else if(param.equals("man_loafers")) {
			small_name = "남성로퍼";
		}
		else if(param.equals("woman_shoes")) {
			small_name = "여성구두";
		}
		else if(param.equals("woman_boots")) {
			small_name = "여성부츠";
		}
		else if(param.equals("woman_walker")) {
			small_name = "여성워커";
		}
		else if(param.equals("woman_loafers")) {
			small_name = "여성로퍼";
		}
		else if(param.equals("woman_danhwa")) {
			small_name = "여성단화";
		}
		else if(param.equals("woman_heel")) {
			small_name = "여성힐";
		}
		else if(param.equals("kids_flat")) {
			small_name = "아동플랫슈즈";
		}
		else if(param.equals("kids_shoes")) {
			small_name = "아동구두";
		}
		else if(param.equals("kids_boots")) {
			small_name = "아동부츠";
		}
		else if(param.equals("kids_indoor")) {
			small_name = "아동실내화";
		}
		else {
			small_name = param;
		}
		
		System.out.println(small_name);
		categoryVO catevo = new categoryVO(small_name);
		
		model.addAttribute("smallinfo", searchcatService.Product(catevo));
		model.addAttribute("smallname", small_name);
		
		return "product/detail_small";
	}
	
	/*�냼遺꾨쪟 �궗�씠利�, 媛�寃� 諛쏅뒗寃�*/
	@RequestMapping(value = "/smallall.do")
	public String small_all(Model model, @RequestParam("smalltype") String param, @RequestParam(value="size", required=false, defaultValue="0") ArrayList sizeValue,
								@RequestParam(value="price", required=false, defaultValue="0") ArrayList priceValue) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		System.out.println(param);
		map.put("smallkey", param);
		
		StringBuffer sizestr = new StringBuffer();
		StringBuffer pricestr = new StringBuffer();
		if(!sizeValue.get(0).equals("0")) {
			for(int i=0; i<sizeValue.size(); i++) {
				if(i != sizeValue.size()-1) {
					sizestr.append("size_"+sizeValue.get(i)+">0 or ");
					map.put("sizekey", sizestr.toString());
				}
				else {
					sizestr.append("size_"+sizeValue.get(i)+">0");
					map.put("sizekey", sizestr.toString());
				}
			}
		}
		if(!priceValue.get(0).equals("0")) {
			for(int i=0; i<priceValue.size(); i++) {
				if(priceValue.get(i).equals("1")) {
					pricestr.append("prod_price<=30000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("2")) {
					pricestr.append("prod_price>=30000 and prod_price<=50000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("3")) {
					pricestr.append("prod_price>=50000 and prod_price<=70000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("4")) {
					pricestr.append("prod_price>=70000 and prod_price<=100000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("5")){
					pricestr.append("prod_price>=100000");
					map.put("pricekey", pricestr.toString());
				}
				
				if(i != priceValue.size()-1) {
					pricestr.append(" or ");
					map.put("pricekey", pricestr.toString());
				}
			}
		}
		
		if(!param.isEmpty()) {
			model.addAttribute("smallinfo", searchcatService.SmallAllView(map));
			model.addAttribute("smallname", param);
		}
		
		return "product/detail_small";
	}
	
	/*�냼遺꾨쪟 �젙�젹*/
	@RequestMapping(value = "/small_sort.do")
	public String small_sort(Model model, @RequestParam("smalltype") String title, @RequestParam("sort") String sort, @RequestParam("sort_list") String product_list) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("smallkey", title);
		map.put("sortkey", sort);
		map.put("productkey", product_list);
		
		System.out.println("ok");
		System.out.println(title);
		System.out.println(sort);
		System.out.println(product_list);
		
		model.addAttribute("smallinfo", searchcatService.SmallSort(map));
		model.addAttribute("smallname", title);
		
		return "product/detail_small";
	}
	
	/*��遺꾨쪟 �궗�씠利�, 媛�寃� 諛쏅뒗寃�*/
	@RequestMapping(value = "/bigall.do")
	public String big_all(Model model, @RequestParam("bigtype") String param, @RequestParam(value="size", required=false, defaultValue="0") ArrayList sizeValue,
								@RequestParam(value="price", required=false, defaultValue="0") ArrayList priceValue) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		System.out.println(param);
		map.put("bigkey", param);
		
		StringBuffer sizestr = new StringBuffer();
		StringBuffer pricestr = new StringBuffer();
		if(!sizeValue.get(0).equals("0")) {
			for(int i=0; i<sizeValue.size(); i++) {
				if(i != sizeValue.size()-1) {
					sizestr.append("size_"+sizeValue.get(i)+">0 or ");
					map.put("sizekey", sizestr.toString());
				}
				else {
					sizestr.append("size_"+sizeValue.get(i)+">0");
					map.put("sizekey", sizestr.toString());
				}
			}
		}
		if(!priceValue.get(0).equals("0")) {
			for(int i=0; i<priceValue.size(); i++) {
				if(priceValue.get(i).equals("1")) {
					pricestr.append("prod_price<=30000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("2")) {
					pricestr.append("prod_price>=30000 and prod_price<=50000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("3")) {
					pricestr.append("prod_price>=50000 and prod_price<=70000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("4")) {
					pricestr.append("prod_price>=70000 and prod_price<=100000");
					map.put("pricekey", pricestr.toString());
				}
				else if(priceValue.get(i).equals("5")){
					pricestr.append("prod_price>=100000");
					map.put("pricekey", pricestr.toString());
				}
				
				if(i != priceValue.size()-1) {
					pricestr.append(" or ");
					map.put("pricekey", pricestr.toString());
				}
			}
		}
		
		if(!param.isEmpty()) {
			model.addAttribute("biginfo", searchcatService.BigAllView(map));
			model.addAttribute("bigname", param);
		}
		
		return "product/detail_big";
	}
	
	/*��遺꾨쪟 �젙�젹*/
	@RequestMapping(value = "/big_sort.do")
	public String big_sort(Model model, @RequestParam("bigtype") String title, @RequestParam("sort") String sort, @RequestParam("sort_list") String product_list) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("bigkey", title);
		map.put("sortkey", sort);
		map.put("productkey", product_list);
		
		System.out.println("ok");
		System.out.println(title);
		System.out.println(sort);
		System.out.println(product_list);
		
		model.addAttribute("biginfo", searchcatService.BigSort(map));
		model.addAttribute("bigname", title);
		
		return "product/detail_big";
	}
}
