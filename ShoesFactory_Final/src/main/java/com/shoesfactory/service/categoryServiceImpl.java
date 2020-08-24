package com.shoesfactory.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.category.categoryDAO;
import com.shoesfactory.DAOVO.category.categoryVO;

@Service("categoryService")
public class categoryServiceImpl implements categoryService {
	
	@Autowired
	private categoryDAO categorydao;
	
	/*대분류, 소분류*/
	@Override
	public List<categoryVO> Product(categoryVO vo1) {
		List<categoryVO> list1 = categorydao.Category(vo1);
		return list1;
	}
	
	@Override
	public List<categoryVO> BigSmall(categoryVO vo1) {
		List<categoryVO> list1 = categorydao.bigsmall(vo1);
		return list1;
	}

	/*소분류 사이즈,가격 검색*/
	@Override
	public List<categoryVO> SmallAllView(HashMap<String, String> map) {
		List<categoryVO> list1 = categorydao.smallAllProduct(map);
		return list1;
	}

	@Override
	public List<categoryVO> SmallSort(HashMap<String, String> map) {
		List<categoryVO> list1 = categorydao.smallSort(map);
		return list1;
	}

	@Override
	public List<categoryVO> BigAllView(HashMap<String, String> map) {
		List<categoryVO> list1 = categorydao.bigAllProduct(map);
		return list1;
	}

	@Override
	public List<categoryVO> BigSort(HashMap<String, String> map) {
		List<categoryVO> list1 = categorydao.bigSort(map);
		return list1;
	}

	
}
