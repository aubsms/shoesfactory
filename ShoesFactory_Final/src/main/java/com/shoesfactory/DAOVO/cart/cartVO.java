package com.shoesfactory.DAOVO.cart;

public class cartVO {
	
	private String cart_usernum;
	private String cart_product_name;
	private String cart_product_amount;
	private String cart_product_size;
	private String cart_product_price;
	private String cart_product_mainimg;
	
	public cartVO() {
	
	}
	
	public cartVO(String cart_usernum) {
		this.cart_usernum = cart_usernum;
	}
	public cartVO(String cart_usernum, String cart_product_name, String cart_product_amount,
			String cart_product_size, String cart_product_price,String cart_product_mainimg) {
		this.cart_usernum=cart_usernum;
		this.cart_product_name=cart_product_name;
		this.cart_product_amount=cart_product_amount;
		this.cart_product_size=cart_product_size;
		this.cart_product_price=cart_product_price;
		this.cart_product_mainimg = cart_product_mainimg;
	}

	public cartVO(String cart_product_name, String cart_product_amount, String cart_product_size,
			String cart_product_price, String cart_product_mainimg) {
		super();
		this.cart_product_name = cart_product_name;
		this.cart_product_amount = cart_product_amount;
		this.cart_product_size = cart_product_size;
		this.cart_product_price = cart_product_price;
		this.cart_product_mainimg = cart_product_mainimg;
	}

	public String getCart_usernum() {
		return cart_usernum;
	}

	public void setCart_usernum(String cart_usernum) {
		this.cart_usernum = cart_usernum;
	}

	public String getCart_product_name() {
		return cart_product_name;
	}

	public void setCart_product_name(String cart_product_name) {
		this.cart_product_name = cart_product_name;
	}

	public String getCart_product_amount() {
		return cart_product_amount;
	}

	public void setCart_product_amount(String cart_product_amount) {
		this.cart_product_amount = cart_product_amount;
	}

	public String getCart_product_size() {
		return cart_product_size;
	}

	public void setCart_product_size(String cart_product_size) {
		this.cart_product_size = cart_product_size;
	}

	public String getCart_product_price() {
		return cart_product_price;
	}

	public void setCart_product_price(String cart_product_price) {
		this.cart_product_price = cart_product_price;
	}

	public String getCart_product_mainimg() {
		return cart_product_mainimg;
	}

	public void setCart_product_mainimg(String cart_product_mainimg) {
		this.cart_product_mainimg = cart_product_mainimg;
	}
	
	

}
