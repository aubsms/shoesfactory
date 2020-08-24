package com.shoesfactory.DAOVO.category;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoesfactory.DAOVO.search.searchVO;

@Repository
public class categoryDAO {
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
	
	/*대분류, 소분류*/
	public static List<categoryVO> Category(categoryVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		List<categoryVO> s = session.selectList("bigcategory_product", vo1);
		if(s.size() > 0) {
			return s;
		}
		else
			return session.selectList("smallcategory_product", vo1);
	}
	
	public static List<categoryVO> bigsmall(categoryVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		List<categoryVO> s = session.selectList("big_small", vo1);
		return s;
	}
	
	/*대분류 사이즈,가격 검색*/
	public static List<categoryVO> bigAllProduct(HashMap<String,String> map) {
		SqlSession session = sqlsessionfactory1.openSession();
		
		return session.selectList("big_all_product", map);
	}
	
	/*대분류 정렬*/
	public static List<categoryVO> bigSort(HashMap<String,String> map) {
		SqlSession session = sqlsessionfactory1.openSession();
		
		return session.selectList("big_sort", map);
	}
	
	/*소분류 사이즈,가격 검색*/
	public static List<categoryVO> smallAllProduct(HashMap<String,String> map) {
		SqlSession session = sqlsessionfactory1.openSession();
		
		return session.selectList("small_all_product", map);
	}
	
	/*소분류 정렬*/
	public static List<categoryVO> smallSort(HashMap<String,String> map) {
		SqlSession session = sqlsessionfactory1.openSession();
		
		return session.selectList("small_sort", map);
	}
}
