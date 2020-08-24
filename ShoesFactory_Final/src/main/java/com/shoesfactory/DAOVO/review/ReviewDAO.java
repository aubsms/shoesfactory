package com.shoesfactory.DAOVO.review;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

@Repository
public class ReviewDAO {
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
	
	// 후기 리스트 목록을 가져오는 DAO
			public static List<ReviewVO> getSelectReview(ReviewVO vo1){
				return sqlsessionfactory1.openSession().selectList("getSelectReview", vo1);
			}
			
			public static List<ReviewVO> getSelectUpdate(ReviewVO vo1){
				return sqlsessionfactory1.openSession().selectList("getSelectUpdate", vo1);
			}
			
			// 후기를 추가하는 DAO
			public static int getInsertReview(ReviewVO vo1) {
				SqlSession session = sqlsessionfactory1.openSession();
				int r = session.insert("getInsertReview", vo1);
				session.commit();
				return r;
			}
			
			public static int getUpdateReview(ReviewVO vo1) {
				SqlSession session = sqlsessionfactory1.openSession();
				int r = session.update("getUpdateReview", vo1);
				session.commit();
				return r;
			}
			
			public static int getDeleteReview(ReviewVO vo1) {
				SqlSession session = sqlsessionfactory1.openSession();
				int r = session.delete("getDeleteReview", vo1);
				session.commit();
				return r;
			}
}
