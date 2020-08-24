package com.shoesfactory.DAOVO.board;

public class BRepleVO {
	private int REPLE_NO;
	private int BOARD_NO;
	private String REPLE_WRITER;
	private String REPLE_CONTEXT;
	
	public BRepleVO() {}
	
	public BRepleVO (int REPLE_NO, int BOARD_NO, String REPLE_WRITER, String REPLE_CONTEXT) {
		this.REPLE_NO = REPLE_NO;
		this.BOARD_NO = BOARD_NO;
		this.REPLE_WRITER = REPLE_WRITER;
		this.REPLE_CONTEXT = REPLE_CONTEXT;
	}
	
	public int getREPLE_NO() {
		return REPLE_NO;
	}
	public void setREPLE_NO(int rEPLE_NO) {
		REPLE_NO = rEPLE_NO;
	}
	public int getBOARD_NO() {
		return BOARD_NO;
	}
	public void setBOARD_NO(int bOARD_NO) {
		BOARD_NO = bOARD_NO;
	}
	public String getREPLE_WRITER() {
		return REPLE_WRITER;
	}
	public void setREPLE_WRITER(String rEPLE_WRITER) {
		REPLE_WRITER = rEPLE_WRITER;
	}
	public String getREPLE_CONTEXT() {
		return REPLE_CONTEXT;
	}
	public void setREPLE_CONTEXT(String rEPLE_CONTEXT) {
		REPLE_CONTEXT = rEPLE_CONTEXT;
	}
}
