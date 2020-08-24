package com.shoesfactory.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.search.searchDAO;
import com.shoesfactory.DAOVO.search.searchVO;

@Service("searchService")
public class searchServiceImpl implements searchService { /*���񽺸� ���� �����ϴ°�*/

	@Autowired	/*autowired�� dao�� �˾Ƽ� new����*/
	private searchDAO searchdao;
	
	/*소분류, 상품명 검색*/
	@Override
	public List<searchVO> SearchView(searchVO vo1) {
		List<searchVO> list1 = searchdao.searchProduct(vo1);
		return list1;
	}

	/*소분류, 상품명, 사이즈, 가격 검색*/
	@Override
	public List<searchVO> SearchAllView(HashMap<String, String> map) {
		List<searchVO> list1 = searchdao.searchAllProduct(map);
		return list1;
	}

	@Override
	public List ListParser(String list) {
		String[] list1 = list.split("/");
		List paseList = null;
		for(int i=0; i<list.length(); i++) {
			paseList.add(list1[i]);
		}
		return paseList;
	}

	
	/*상품정렬*/
	@Override
	public List<searchVO> sortproduct(HashMap<String, String> map) {
		List<searchVO> list1 = searchdao.sortproduct(map);
		return list1;
	} 
	
}
