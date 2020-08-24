package com.shoesfactory.service;

import java.util.HashMap;
import java.util.List;

import com.shoesfactory.DAOVO.search.searchVO;

public interface searchService { /*������ �����ؾߵ� ����� �˷���*/
	
	public List<searchVO> SearchView(searchVO vo1);
	
	public List<searchVO> SearchAllView(HashMap<String,String> map);
	
	public List ListParser(String list);
	
	public List<searchVO> sortproduct(HashMap<String,String> map);
}
