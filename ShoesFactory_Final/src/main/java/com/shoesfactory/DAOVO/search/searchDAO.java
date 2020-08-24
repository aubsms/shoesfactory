package com.shoesfactory.DAOVO.search;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class searchDAO {
	@Autowired
	private static SqlSessionFactory sqlsessionfactory1;
	static {
		String myxml="Mybatis-config.xml";
		InputStream istream = null;
		try {
			istream = Resources.getResourceAsStream(myxml);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlsessionfactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	/*소분류,상품 검색*/
	public static List<searchVO> searchProduct(searchVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		List<searchVO> s = session.selectList("search_catsmall_product", vo1);
		if(s.size() > 0) {
			return s;
		}
		else
			return session.selectList("search_item_product", vo1);
	}
	
	/*소분류,상품,사이즈,가격 검색*/
	public static List<searchVO> searchAllProduct(HashMap<String,String> map) {
		SqlSession session = sqlsessionfactory1.openSession();
		
		return session.selectList("search_all_product", map);
	}
	
	/*상품 정렬*/
	public static List<searchVO> sortproduct(HashMap<String,String> map) {
		SqlSession session = sqlsessionfactory1.openSession();
		return session.selectList("product_sort", map);
	}
}
