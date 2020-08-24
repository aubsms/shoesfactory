package com.shoesfactory.DAOVO.search;

public class searchVO {
	private String prod_name;
	private String prod_cat_big;
	private String prod_cat_small;
	private String prod_size;
	private String prod_price;
	private String prod_main_imgpath;
	private String prod_sub_imgpath;

	public searchVO() {
	}

	public searchVO(String prod_cat_small) {
		this.prod_cat_small = prod_cat_small;
		this.prod_name = prod_cat_small;
	}
	
	public searchVO(String prod_name, int prod_price) {
		this.prod_name = prod_name;
		this.prod_price = String.valueOf(prod_price);
	}
	
	public searchVO(String prod_name, String prod_cat_big, String prod_cat_small, String prod_size, String prod_price, String prod_main_imgpath, String prod_sub_imgpath) {
		this.prod_name = prod_name;
		this.prod_cat_big = prod_cat_big;
		this.prod_cat_small = prod_cat_small;
		this.prod_price = prod_price;
		this.prod_size = prod_size;
		this.prod_main_imgpath = prod_main_imgpath;
		this.prod_sub_imgpath = prod_sub_imgpath;
	}

	public String getProd_size() {
		return prod_size;
	}

	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}

	public String getProd_price() {
		return prod_price;
	}

	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}

	public String getProd_name() {
		return prod_name;
	}
	
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	
	public String getProd_cat_big() {
		return prod_cat_big;
	}
	
	public void setProd_cat_big(String prod_cat_big) {
		this.prod_cat_big = prod_cat_big;
	}
	
	public String getProd_cat_small() {
		return prod_cat_small;
	}
	
	public void setProd_cat_small(String prod_cat_small) {
		this.prod_cat_small = prod_cat_small;
	}

	public String getProd_main_imgpath() {
		return prod_main_imgpath;
	}

	public void setProd_main_imgpath(String prod_main_imgpath) {
		this.prod_main_imgpath = prod_main_imgpath;
	}

	public String getProd_sub_imgpath() {
		return prod_sub_imgpath;
	}

	public void setProd_sub_imgpath(String prod_sub_imgpath) {
		this.prod_sub_imgpath = prod_sub_imgpath;
	}
}
