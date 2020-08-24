package com.shoesfactory.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;

import com.shoesfactory.DAOVO.member.MemberVO;
import com.shoesfactory.DAOVO.member.NonMemberVO;



public interface MemberService {
	
//로그인 part
public int loginCheck(MemberVO vo1, HttpSession session); // 로그인 체크
	
public List<MemberVO> login(MemberVO vo1); //로그인 정보 불러오기

public void logout(HttpSession session); //로그아웃

public int nmloginCheck(NonMemberVO vo1, HttpSession session); //비회원 로그인 체크

public List<NonMemberVO> nmlogin(NonMemberVO vo1); //비회원 로그인 회원정보 불러오기



//회원가입 part
	
public String IdCheck(String mem_id); //회원가입시 ID 체크
	
public String EmailCheck(String mem_email); //회원가입시 이메일 체크
	
public String TelCheck(String mem_tel); //회원가입시 전화번호 체크
			
public void signup(MemberVO vo1) throws Exception; //회원가입
	
public void nmsignup(NonMemberVO vo1) throws Exception; //비회원 정보입력

public String NonmemTelCheck(String nonmem_tel); //비회원 전화번호 체크

public List<MemberVO> getMyInfo(MemberVO vo1); // 회원정보 불러오기

public List<NonMemberVO> nmgetMyInfo(NonMemberVO vo1); // 비회원 정보 불러오기

public void deleteAccount(MemberVO vo1); //회원탈퇴

public void updateAccount(MemberVO vo1); //회원정보 수정

//4. 아이디/비밀번호 찾기 part
public String findID(String mem_tel); //아이디 찾기

public String findPW(MemberVO vo1); //비밀번호 찾기
	

}
