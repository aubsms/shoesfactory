package com.shoesfactory.DAOVO.board;

import java.util.Date;

public class BoardVO {
	private int BOARD_NO;
	private String BOARD_TYPE;
	private String BOARD_WRITER;
	private String BOARD_TITLE;
	private String BOARD_CONTEXT;
	private int BOARD_HIT;
	private int BOARD_GROUPNO;
	private Date BOARD_DATE;
	private String BOARD_PW;
	private String BOARD_IMGPATH;
	
	
	
	public BoardVO () {}
	
	public BoardVO (  int BOARD_NO, String BOARD_TYPE, String BOARD_WRITER, String BOARD_TITLE, 
			String BOARD_CONTEXT, int BOARD_HIT,  int BOARD_GROUPNO, Date BOARD_DATE, String BOARD_PW, String BOARD_IMGPATH) {
		this.BOARD_NO = BOARD_NO;
		this.BOARD_TYPE = BOARD_TYPE;
		this.BOARD_WRITER = BOARD_WRITER;
		this.BOARD_TITLE = BOARD_TITLE;
		this.BOARD_CONTEXT = BOARD_CONTEXT;
		this.BOARD_HIT = BOARD_HIT;
		this.BOARD_GROUPNO = BOARD_GROUPNO;
		this.BOARD_DATE = BOARD_DATE;
		this.BOARD_PW = BOARD_PW;
		this.BOARD_IMGPATH = BOARD_IMGPATH;
	}
	public int getBOARD_NO() {
		return BOARD_NO;
	}
	public void setBOARD_NO(int bOARD_NO) {
		BOARD_NO = bOARD_NO;
	}
	public String getBOARD_TYPE() {
		return BOARD_TYPE;
	}
	public void setBOARD_TYPE(String bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}
	public String getBOARD_WRITER() {
		return BOARD_WRITER;
	}
	public void setBOARD_WRITER(String bOARD_WRITER) {
		BOARD_WRITER = bOARD_WRITER;
	}
	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}
	public String getBOARD_CONTEXT() {
		return BOARD_CONTEXT;
	}
	public void setBOARD_CONTEXT(String bOARD_CONTEXT) {
		BOARD_CONTEXT = bOARD_CONTEXT;
	}
	public int getBOARD_HIT() {
		return BOARD_HIT;
	}
	public void setBOARD_HIT(int bOARD_HIT) {
		BOARD_HIT = bOARD_HIT;
	}
	public int getBOARD_GROUPNO() {
		return BOARD_GROUPNO;
	}
	public void setBOARD_GROUPNO(int bOARD_GROUPNO) {
		BOARD_GROUPNO = bOARD_GROUPNO;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	public String getBOARD_PW() {
		return BOARD_PW;
	}
	public void setBOARD_PW(String bOARD_PW) {
		BOARD_PW = bOARD_PW;
	}
	public String getBOARD_IMGPATH() {
		return BOARD_IMGPATH;
	}
	public void setBOARD_IMGPATH(String bOARD_IMGPATH) {
		BOARD_IMGPATH = bOARD_IMGPATH;
	}
}
