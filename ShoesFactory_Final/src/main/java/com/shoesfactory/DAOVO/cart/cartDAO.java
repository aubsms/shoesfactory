package com.shoesfactory.DAOVO.cart;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.shoesfactory.DAOVO.product.productHisVO;


@Repository("cartDAO")
public class cartDAO {

	private static SqlSessionFactory sqlsessionfactory2;
	
	static {
		String myxml="Mybatis-config.xml";
		InputStream istream = null;
		try {
			istream = Resources.getResourceAsStream(myxml);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlsessionfactory2 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	public static List<cartVO> cartUserProduct(cartVO vo1){
		
		return sqlsessionfactory2.openSession().selectList("cartUserProduct",vo1);
		
	}
	
	public static int addproduct(cartVO vo1) {
		SqlSession session = sqlsessionfactory2.openSession();
		int r = session.insert("cartAddProduct",vo1);
		session.commit();		
		return r;
	}
	
	public static int deleteproduct(cartVO vo1) {
		SqlSession session = sqlsessionfactory2.openSession();
		int r = session.delete("cartDeleteProduct",vo1);
		session.commit();		
		return r;
	}
	
	public static int updateproduct(cartVO vo1) {
		SqlSession session = sqlsessionfactory2.openSession();
		ArrayList list1 = new ArrayList();
		list1.add(vo1);
		int r = session.update("cartUpdateProduct",vo1);
		session.commit();		
		return r;
	}
	
	public static int overlapCheck(cartVO vo1) {
		SqlSession session = sqlsessionfactory2.openSession();
		
		return session.selectOne("cartoverlapCheck",vo1);
		
	}
	
	public static int overlapProduct(cartVO vo1) {
		SqlSession session = sqlsessionfactory2.openSession();
		int r = session.update("overlapProduct", vo1);
		session.commit();
		return r;
	}
	
	public static int payready(productHisVO vo) {
		SqlSession session = sqlsessionfactory2.openSession();
		int r= session.insert("pay_ready", vo);
		return r;
	}
	
	/*public static HashMap purchase(String usernum, List itemlist) {
		
		SqlSession session = sqlsessionfactory1.openSession();
		HashMap returnmap = new HashMap();
		returnmap.put("usernum", usernum);
		returnmap.put("itemlist", itemlist);
		List list = session.selectList("cartPurchase",returnmap);
		returnmap.put(usernum, list);
		return returnmap;	
	}*/
	
	
	
}
