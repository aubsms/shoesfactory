package com.shoesfactory.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoesfactory.DAOVO.search.searchVO;
import com.shoesfactory.service.searchService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {
	
	@Resource(name="searchService")
	private searchService SearchService;
	
	/*검색어만 받는것*/
	@RequestMapping(value = "/searchtext.do") /*post, get방식 모두 받음*/
	public String search_text(searchVO vo1, Model model, @RequestParam("findtext") String param) { /*model은 전달하는 틀*/
		System.out.println(param);
		searchVO vo2 = new searchVO(param);
		
		if(!param.isEmpty()) {
			model.addAttribute("searchinfo", SearchService.SearchView(vo2));
			model.addAttribute("searchtext", param);
		}
		
		return "product/prod_search";
	}
	
	/*검색어, 사이즈, 가격 받는것*/
	@RequestMapping(value = "/searchall.do") /*post, get방식 모두 받음*/
	public String search_text(Model model, @RequestParam("findtext") String param, @RequestParam(value="size", required=false, defaultValue="0") ArrayList sizeValue,
									@RequestParam(value="price", required=false, defaultValue="0") ArrayList priceValue) { /*model은 전달하는 틀*/
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("searchkey", param);
		
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
			model.addAttribute("searchinfo",SearchService.SearchAllView(map));
			model.addAttribute("searchtext", param);
		}
		
		return "product/prod_search";
	}
	
	/*상품 정렬*/
	@RequestMapping(value = "/search_sort.do")
	public String search_sort(Model model, @RequestParam("findtext") String text, @RequestParam("sort") String sort, @RequestParam("sort_list") String product_list) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("searchkey", text);
		map.put("sortkey", sort);
		map.put("productkey", product_list);
		
		System.out.println("ok");
		System.out.println(sort);
		System.out.println(product_list);
		
		model.addAttribute("searchinfo",SearchService.sortproduct(map));
		model.addAttribute("searchtext", text);
		
		return "product/prod_search";
	}
}
