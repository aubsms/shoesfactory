package com.shoesfactory.DAOVO.admin;

public class adminVO {
	
	private String prod_name;
	private String prod_price;
	private String prod_amount;
	private String prod_cat_big;
	private String prod_cat_small;
	private String prod_main_imgpath;
	private String prod_thumb_imgpath;
	private String prod_sub_imgpath;
	
	
	
	public adminVO() {
		super();
	}
	
	public adminVO(String prod_cat_big, String prod_cat_small) {
		this.prod_cat_big = prod_cat_big;
		this.prod_cat_small = prod_cat_small;
	}
	public adminVO(String prod_name, String prod_price, String prod_amount, String prod_cat_big, String prod_cat_small,
			String prod_main_imgpath, String prod_thumb_imgpath,String prod_sub_imgpath) {
		super();
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_amount = prod_amount;
		this.prod_cat_big = prod_cat_big;
		this.prod_cat_small = prod_cat_small;
		this.prod_main_imgpath = prod_main_imgpath;
		this.prod_thumb_imgpath = prod_thumb_imgpath;
		this.prod_sub_imgpath = prod_sub_imgpath;
	}
	public adminVO(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_amount() {
		return prod_amount;
	}
	public void setProd_amount(String prod_amount) {
		this.prod_amount = prod_amount;
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

	public String getProd_thumb_imgpath() {
		return prod_thumb_imgpath;
	}

	public void setProd_thumb_imgpath(String prod_thumb_imgpath) {
		this.prod_thumb_imgpath = prod_thumb_imgpath;
	}
}
