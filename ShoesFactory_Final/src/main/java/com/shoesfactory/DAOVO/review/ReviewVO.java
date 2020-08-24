package com.shoesfactory.DAOVO.review;

public class ReviewVO {
	private String REV_NAME;
	private String PROD_NO;
	private String REV_WRITER;
	private String REV_CONTEXT;
	private String REV_IMGPATH;
	
	public ReviewVO() {}
	
	public ReviewVO(String REV_NAME, String PROD_NO, String REV_WRITER, String REV_CONTEXT, String REV_IMGPATH) {
		this.REV_NAME = REV_NAME;
		this.PROD_NO = PROD_NO;
		this.REV_WRITER = REV_WRITER;
		this.REV_CONTEXT = REV_CONTEXT;
		this.REV_IMGPATH = REV_IMGPATH;
	}
	
	
	public String getREV_NAME() {
		return REV_NAME;
	}
	public void setREV_NAME(String rEV_NAME) {
		REV_NAME = rEV_NAME;
	}
	public String getPROD_NO() {
		return PROD_NO;
	}
	public void setPROD_NO(String pROD_NO) {
		PROD_NO = pROD_NO;
	}
	public String getREV_WRITER() {
		return REV_WRITER;
	}
	public void setREV_WRITER(String rEV_WRITER) {
		REV_WRITER = rEV_WRITER;
	}
	public String getREV_CONTEXT() {
		return REV_CONTEXT;
	}
	public void setREV_CONTEXT(String rEV_CONTEXT) {
		REV_CONTEXT = rEV_CONTEXT;
	}
	public String getREV_IMGPATH() {
		return REV_IMGPATH;
	}
	public void setREV_IMGPATH(String rEV_IMGPATH) {
		REV_IMGPATH = rEV_IMGPATH;
	}
	
}
