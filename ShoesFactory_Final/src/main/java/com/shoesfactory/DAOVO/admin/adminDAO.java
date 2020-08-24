package com.shoesfactory.DAOVO.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.shoesfactory.DAOVO.product.ProductVO;

@Repository("adminDAO")
public class adminDAO {
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
	
	public List seachMemAll() {

		return sqlsessionfactory1.openSession().selectList("mem_Allsearch_List");
		
	}
	
	public List seachProdAll() {
		
		return sqlsessionfactory1.openSession().selectList("prod_Allsearch_list");	
	
	}
	
	public ProductVO seachProdOne(ProductVO vo) {
		return sqlsessionfactory1.openSession().selectOne("prod_oneSeach", vo);
	}
	
	/*public List seachProdBIg(adminVO vo) {
		
		return sqlsessionfactory1.openSession().selectList("prod_cat_big",vo);
		
	}*/
	
	public List seachProdStandard(ProductVO vo) {
		
		return sqlsessionfactory1.openSession().selectList("prod_standard",vo);
		
	}
	
	public List seachProdStock() {
		
		return sqlsessionfactory1.openSession().selectList("prod_allstock");
	}
	
	public adminStockVO seachStockOne(adminStockVO vo) {
		
		return sqlsessionfactory1.openSession().selectOne("prod_stockone",vo);
	}
	
	public int prodInsert(ProductVO vo) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.insert("prod_insert",vo);
		session.commit();
		return r;		
	}
	
	public int prodUpdate(ProductVO vo) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.update("prod_update",vo);
		session.commit();
		return r;
	}
	
	public int prodDelete(ProductVO vo) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.delete("prod_delete",vo);
		session.commit();
		return r;
	}
	
	public int stockInsert(adminStockVO vo) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.insert("prod_stock",vo);
		session.commit();
		return r;
	}
	
	public int stockUpdate(adminStockVO vo) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.update("stock_update",vo);
		session.commit();
		return r;
	}
	
	public int stockDelete(adminStockVO vo) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.delete("stock_delete",vo);
		session.commit();
		return r;
	}
}
