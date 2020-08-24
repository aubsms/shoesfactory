package com.shoesfactory.service;

import java.util.List;

import com.shoesfactory.DAOVO.board.BRepleVO;
import com.shoesfactory.DAOVO.board.BoardVO;



public interface BoardService {

	public List<BoardVO> GetBoardListView(BoardVO vo1);
	
	public List<BoardVO> GetDeteilBoard(BoardVO vo1);
	
	public void GetCreateBoard(BoardVO vo1);
	
	public void GetUpdateBoard(BoardVO vo1);
	
	public void GetDeleteBoard(BoardVO vo1);
	
	public void GetUpdateViewCnt(BoardVO vo1);
	
	public List<BRepleVO> GetBRepleList(BRepleVO vo1);
	
	public List<BRepleVO> GetSelectBRepleList(BRepleVO vo1);
	
	public void GetCreateBReple(BRepleVO vo1);
	
	public void GetUpdateBReple(BRepleVO vo1);
	
	public void GetDeleteBReple(BRepleVO vo1);
	
	public void GetDeleteBReple1(BRepleVO vo1);
	
	public String BoardpwCheck(BoardVO vo1);
}
