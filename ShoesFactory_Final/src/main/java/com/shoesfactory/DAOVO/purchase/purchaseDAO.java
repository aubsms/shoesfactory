package com.shoesfactory.DAOVO.purchase;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.shoesfactory.DAOVO.cart.cartVO;
import com.shoesfactory.DAOVO.member.MemberVO;
import com.shoesfactory.DAOVO.product.productHisVO;

@Repository("purchaseDAO")
public class purchaseDAO {
	
	private static SqlSessionFactory sqlsessionfactory2;
	
	static {
		String myxml1="Mybatis-config.xml";
		InputStream istream1 = null;
		try {
			istream1 = Resources.getResourceAsStream(myxml1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlsessionfactory2 = new SqlSessionFactoryBuilder().build(istream1);
	}

	public static HashMap purchase(String usernum, List itemlist) {
	
	SqlSession session = sqlsessionfactory2.openSession();
	HashMap returnmap = new HashMap();
	returnmap.put("usernum", usernum);
	returnmap.put("itemlist", itemlist);
	List<cartVO> list = session.selectList("cartPurchase",returnmap);
	returnmap.put(usernum, list);
	return returnmap;	
	}
	
	public static List<cartVO> cartall(cartVO vo){
		return sqlsessionfactory2.openSession().selectList("cartall",vo);
		
	}
	
	public static List<productHisVO> paylist(productHisVO vo){
		
		return sqlsessionfactory2.openSession().selectList("paylist", vo);
		
	}
	
	
	
	public static List totalPay(HashMap selectMap1) {
		SqlSession session = sqlsessionfactory2.openSession();
		List<String> totallist =session.selectList("amountTotal",selectMap1);
		return totallist;
	}
	
	public static int payAdd(productHisVO vo) {
		SqlSession session = sqlsessionfactory2.openSession();
		int r = session.insert("payListAdd",vo);
		session.commit();
		return r;
	}
	
	public static List<MemberVO> userinfo(MemberVO vo) {
		return sqlsessionfactory2.openSession().selectList("userinfo", vo);
	}
}
