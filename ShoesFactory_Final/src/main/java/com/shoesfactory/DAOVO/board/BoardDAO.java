package com.shoesfactory.DAOVO.board;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;



@Repository
public class BoardDAO {
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
	
	public static List<BoardVO> getBoardList(BoardVO vo1){
		return sqlsessionfactory1.openSession().selectList("getBoardList", vo1);
	}
	
	
	
	public static List<BoardVO> getDeteilBoard(BoardVO vo1){
		return sqlsessionfactory1.openSession().selectList("getDeteilBoard", vo1);
	}
	

	public static int getCreateBoard(BoardVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.insert("getCreateBoard", vo1);
		session.commit();
		return r;
	}
	
	public static int getUpdateBoard(BoardVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.update("getUpdateBoard", vo1);
		System.out.println(vo1.getBOARD_TITLE());
		System.out.println(vo1.getBOARD_NO());
		session.commit();
		return r;
	}
	
	public static int getDeleteBoard(BoardVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.delete("getDeleteBoard", vo1);
		session.commit();
		return r;
	}
	
	public static int getUpdateViewCnt(BoardVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.update("getUpdateViewCnt", vo1);
		session.commit();
		return r;
	}
	
	public static List<BRepleVO> getBRepleList(BRepleVO vo1){
		return sqlsessionfactory1.openSession().selectList("getBRepleList", vo1);
	}
	
	public static List<BRepleVO> getSelectBRepleList(BRepleVO vo1){
		return sqlsessionfactory1.openSession().selectList("getSelectBRepleList", vo1);
	}
	
	public static int getCreateBReple(BRepleVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.insert("getCreateBReple", vo1);
		session.commit();
		return r;
	}
	
	public static int getUpdateBReple(BRepleVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.update("getUpdateBReple", vo1);
		session.commit();
		return r;
	}
	
	public static int getDeleteBReple(BRepleVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.delete("getDeleteBReple", vo1);
		session.commit();
		return r;
	}
	
	public static int getDeleteBReple1(BRepleVO vo1) {
		SqlSession session = sqlsessionfactory1.openSession();
		int r = session.delete("getDeleteBReple1", vo1);
		session.commit();
		return r;
	}
	
	public String BoardpwCheck(BoardVO vo1){ //게시글 수정시 비밀번호 체크
		
		SqlSession session1 = sqlsessionfactory1.openSession();
		String pw = session1.selectOne("BoardpwCheck",vo1);
		return pw;
		
		}
	
}
