package com.shoesfactory.DAOVO.purchase;

public class purchaseVO {

	private String payList_client;
	private String payList_product;
	private String payList_amount;
	private String payList_size;
	private String payList_price;
	private String payList_mainimg;
	private String payList_Date;
	
	public purchaseVO(String payList_client, String payList_product, String payList_amount, String payList_size,
			String payList_price, String payList_mainimg, String payList_Date) {
		super();
		this.payList_client = payList_client;
		this.payList_product = payList_product;
		this.payList_amount = payList_amount;
		this.payList_size = payList_size;
		this.payList_price = payList_price;
		this.payList_mainimg = payList_mainimg;
		this.payList_Date = payList_Date;
	}


	public purchaseVO() {
		
	}
	
	public purchaseVO(String payList_client) {
		this.payList_client = payList_client;
	}

	public purchaseVO(String cart_usernum, String cart_product_name, String cart_product_amount,
			String cart_product_size, String cart_product_price, String cart_product_mainimg) {
		this.payList_client = cart_usernum;
		this.payList_product = cart_product_name;
		this.payList_amount = cart_product_amount;
		this.payList_size = cart_product_size;
		this.payList_price = cart_product_price;
		this.payList_mainimg = cart_product_mainimg;
	}


	public String getPayList_client() {
		return payList_client;
	}

	public void setPayList_client(String payList_client) {
		this.payList_client = payList_client;
	}

	public String getPayList_product() {
		return payList_product;
	}

	public void setPayList_product(String payList_product) {
		this.payList_product = payList_product;
	}

	public String getPayList_amount() {
		return payList_amount;
	}

	public void setPayList_amount(String payList_amount) {
		this.payList_amount = payList_amount;
	}


	public String getPayList_size() {
		return payList_size;
	}

	public void setPayList_size(String payList_size) {
		this.payList_size = payList_size;
	}

	public String getPayList_price() {
		return payList_price;
	}

	public void setPayList_price(String payList_price) {
		this.payList_price = payList_price;
	}

	public String getPayList_Date() {
		return payList_Date;
	}

	public void setPayList_Date(String payList_Date) {
		this.payList_Date = payList_Date;
	}


	public String getPayList_mainimg() {
		return payList_mainimg;
	}


	public void setPayList_mainimg(String payList_mainimg) {
		this.payList_mainimg = payList_mainimg;
	}
	
	

}
