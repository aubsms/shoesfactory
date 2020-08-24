package com.shoesfactory.service;

import java.util.HashMap;
import java.util.List;

import com.shoesfactory.DAOVO.category.categoryVO;

public interface searchCatService {
	
	public List<categoryVO> Product(categoryVO vo1);
	
	public List<categoryVO> BigSmall(categoryVO vo1);
	
	public List<categoryVO> SmallAllView(HashMap<String,String> map);
	
	public List<categoryVO> SmallSort(HashMap<String,String> map);
	
	public List<categoryVO> BigAllView(HashMap<String,String> map);
	
	public List<categoryVO> BigSort(HashMap<String,String> map);
}
