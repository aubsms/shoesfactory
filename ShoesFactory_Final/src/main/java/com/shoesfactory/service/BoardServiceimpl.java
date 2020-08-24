package com.shoesfactory.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.board.BRepleVO;
import com.shoesfactory.DAOVO.board.BoardDAO;
import com.shoesfactory.DAOVO.board.BoardVO;


@Service("boardService")
public class BoardServiceimpl implements BoardService{

	@Autowired
	private BoardDAO boarddao;
	
	@Override
	public List<BoardVO> GetBoardListView(BoardVO vo1){
		List<BoardVO> list1 = boarddao.getBoardList(vo1);
		return list1;
	}
	
	@Override
	public List<BoardVO> GetDeteilBoard(BoardVO vo1){
		List<BoardVO> list1 = boarddao.getDeteilBoard(vo1);
		return list1;
	}
	
	@Override
	public void GetCreateBoard(BoardVO vo1) {
		boarddao.getCreateBoard(vo1);
	}
	
	@Override
	public void GetUpdateBoard(BoardVO vo1) {
		System.out.println(vo1.getBOARD_NO());
		boarddao.getUpdateBoard(vo1);
	}
	
	@Override
	public void GetDeleteBoard(BoardVO vo1) {
		boarddao.getDeleteBoard(vo1);
	}
	
	@Override
	public void GetUpdateViewCnt(BoardVO vo1) {
		boarddao.getUpdateViewCnt(vo1);
	}
	
	@Override
	public List<BRepleVO>  GetBRepleList(BRepleVO vo1){
		List<BRepleVO> list2 = boarddao. getBRepleList(vo1);
		return list2;
	}
	
	@Override
	public List<BRepleVO>  GetSelectBRepleList(BRepleVO vo1){
		List<BRepleVO> list1 = boarddao. getSelectBRepleList(vo1);
		return list1;
	}
	
	@Override
	public void GetCreateBReple(BRepleVO vo1) {
		boarddao.getCreateBReple(vo1);
	}
	
	@Override
	public void GetUpdateBReple(BRepleVO vo1) {
		boarddao.getUpdateBReple(vo1);
	}
	
	@Override
	public void GetDeleteBReple(BRepleVO vo1) {
		boarddao.getDeleteBReple(vo1);
	}
	
	@Override
	public void GetDeleteBReple1(BRepleVO vo1) {
		boarddao.getDeleteBReple1(vo1);
	}
	
	@Override
	public String BoardpwCheck(BoardVO vo1) {
		return boarddao.BoardpwCheck(vo1);
	}
	
}
