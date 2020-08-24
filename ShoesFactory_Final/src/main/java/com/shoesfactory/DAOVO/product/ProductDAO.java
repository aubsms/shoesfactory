package com.shoesfactory.DAOVO.product;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ProductDAO {
	@Autowired
	private static SqlSessionFactory sqlsessionfactory;
	static {
		String myxml="Mybatis-config.xml";
		InputStream istream = null;
		
		try {
			istream = Resources.getResourceAsStream(myxml);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(istream);	
	}
	public static List<ProductVO> searchProducts(){
		return sqlsessionfactory.openSession().selectList("search_products");
	}
	public static ProductVO searchProduct(ProductVO vo) {
		return sqlsessionfactory.openSession().selectOne("search_product",vo);
	}
	
	public static List<productHisVO> searchHis(productHisVO vo){
		return sqlsessionfactory.openSession().selectList("search_his", vo);
		
	}
}
