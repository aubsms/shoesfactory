package com.shoesfactory.DAOVO.product;

public class productHisVO {
	
	private String his_tel;
	private String his_name;
	private String his_size;
	private int his_price;
	private String his_amount;
	private String his_status;
	private String his_imgpath;
	
	public productHisVO(String his_tel, String his_name, String his_size, int his_price, String his_amount,
			String his_status, String his_imgpath) {
		super();
		this.his_tel = his_tel;
		this.his_name = his_name;
		this.his_size = his_size;
		this.his_price = his_price;
		this.his_amount = his_amount;
		this.his_status = his_status;
		this.his_imgpath = his_imgpath;
	}
	public productHisVO() {
		super();
	}
	public productHisVO(String his_tel) {
		super();
		this.his_tel = his_tel;
	}

	public String getHis_tel() {
		return his_tel;
	}
	public void setHis_tel(String his_tel) {
		this.his_tel = his_tel;
	}
	public String getHis_name() {
		return his_name;
	}
	public void setHis_name(String his_name) {
		this.his_name = his_name;
	}
	public String getHis_size() {
		return his_size;
	}
	public void setHis_size(String his_size) {
		this.his_size = his_size;
	}
	public int getHis_price() {
		return his_price;
	}
	public void setHis_price(int his_price) {
		this.his_price = his_price;
	}
	public String getHis_imgpath() {
		return his_imgpath;
	}
	public void setHis_imgpath(String his_imgpath) {
		this.his_imgpath = his_imgpath;
	}
	public String getHis_status() {
		return his_status;
	}
	public void setHis_status(String his_status) {
		this.his_status = his_status;
	}
	public String getHis_amount() {
		return his_amount;
	}
	public void setHis_amount(String his_amount) {
		this.his_amount = his_amount;
	}
	
	
}
