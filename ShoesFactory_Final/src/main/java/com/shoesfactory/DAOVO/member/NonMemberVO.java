package com.shoesfactory.DAOVO.member;

public class NonMemberVO {

	private String nonmem_tel; //비회원 전화번호
	private String nonmem_pw; //비회원 비밀번호
	
	public String getNonmem_tel() {
		return nonmem_tel;
	}
	public void setNonmem_tel(String nonmem_tel) {
		this.nonmem_tel = nonmem_tel;
	}
	public String getNonmem_pw() {
		return nonmem_pw;
	}
	public void setNonmem_pw(String nonmem_pw) {
		this.nonmem_pw = nonmem_pw;
	}
	
	public NonMemberVO(String nonmem_tel, String nonmem_pw) {
		super();
		this.nonmem_tel = nonmem_tel;
		this.nonmem_pw = nonmem_pw;
	}
	
	public NonMemberVO() {}
	
	
	
	
}
