package com.shoesfactory.DAOVO.admin;

public class adminStockVO {
	
	private String prod_name;
	private int size_230;
	private int size_240;
	private int size_250;
	private int size_260;
	private int size_270;
	private int size_280;
	
	
	public adminStockVO() {
		super();
	}


	public adminStockVO(String prod_name, int size_230, int size_240, int size_250, int size_260, int size_270,
			int size_280) {
		super();
		this.prod_name = prod_name;
		this.size_230 = size_230;
		this.size_240 = size_240;
		this.size_250 = size_250;
		this.size_260 = size_260;
		this.size_270 = size_270;
		this.size_280 = size_280;
	}


	public adminStockVO(String prod_name) {
		this.prod_name = prod_name;
	}


	public String getProd_name() {
		return prod_name;
	}


	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}


	public int getSize_230() {
		return size_230;
	}


	public void setSize_230(int size_230) {
		this.size_230 = size_230;
	}


	public int getSize_240() {
		return size_240;
	}


	public void setSize_240(int size_240) {
		this.size_240 = size_240;
	}


	public int getSize_250() {
		return size_250;
	}


	public void setSize_250(int size_250) {
		this.size_250 = size_250;
	}


	public int getSize_260() {
		return size_260;
	}


	public void setSize_260(int size_260) {
		this.size_260 = size_260;
	}


	public int getSize_270() {
		return size_270;
	}


	public void setSize_270(int size_270) {
		this.size_270 = size_270;
	}


	public int getSize_280() {
		return size_280;
	}


	public void setSize_280(int size_280) {
		this.size_280 = size_280;
	}

}
