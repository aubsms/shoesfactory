package com.shoesfactory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoesfactory.DAOVO.member.MemberVO;
import com.shoesfactory.DAOVO.member.NonMemberVO;
import com.shoesfactory.service.MemberService;

@Controller

public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name="memberService")
	MemberService service;
	BCryptPasswordEncoder passEncoder;
	
	
//1. 로그인 파트
	
	
	@RequestMapping("/login.do") //로그인
	public String login() {
	return "member/signinform";
	}
	
	
	@RequestMapping("/loginCheck.do") //로그인 체크
	public String loginCheck(MemberVO vo1, HttpSession session, HttpServletResponse response,RedirectAttributes redirect) throws Exception{
	int status = service.loginCheck(vo1, session);
	if (status == 1) {
			System.out.println("로그인");
		return "redirect:loginProcess.do";}
	else {
			System.out.println("로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('입력 정보를 다시 확인해 주세요.'); history.go(-1);</script>");
            out.flush();

            return "member/signinform";
		}
	}
	
	@RequestMapping("/loginProcess.do")  //로그인 성공시 메인 화면으로
	public String login(HttpServletRequest req, HttpSession session,MemberVO vo1, Model model1){
	session = req.getSession();
	MemberVO vo = new MemberVO();
	vo.setMem_id((String)session.getAttribute("slogin"));
	model1.addAttribute("mlogin",service.login(vo));
	return "shoesfactory_home"; 
	}
	
	
	@RequestMapping("/logout.do") //로그아웃
	public String logout(HttpSession session) {
	session.invalidate(); 
	return "redirect:/";
	}
	
	@RequestMapping("/nmloginCheck.do") //비회원 로그인 체크
	public String nmloginCheck(NonMemberVO vo1, HttpSession session, HttpServletResponse response) throws Exception{
	int status = service.nmloginCheck(vo1, session);
	
	if (status == 1) {
			System.out.println("비회원 로그인체크 성공");
		return "nmloginProcess.do";}
	else {
			System.out.println("비회원 로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('입력한 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush();

            return "member/nmsigninform";
		}
	}
	
	
	@RequestMapping("/nmloginProcess.do")  //비회원 로그인 체크 성공시 회원 정보를 불러온다
	public String nmlogin(NonMemberVO vo1, Model model1){
	
	model1.addAttribute("nmlogin",service.nmlogin(vo1));
	return "shoesfactory_home"; 
	}

	

	
//2.회원가입 파트
	
	
	
	@RequestMapping(value = "/signupform.do", method = RequestMethod.GET) // 회원가입 화면
	public String postSignup(){ 
	logger.info("get signupform");
	return "member/signup_11";
		}
	
	
	@RequestMapping(value = "/nmsignupform.do", method = RequestMethod.GET) // 비회원가입 화면
	public String postnmSignup(){
	logger.info("get nmsignupform");
	return "member/nmsignup_11";
	}		
	
	@RequestMapping("IdCheck.do") //아이디 체크
	@ResponseBody
	public String IdCheck(String mem_id) {
	return service.IdCheck(mem_id);
	}

	@RequestMapping("EmailCheck.do") //이메일 체크
	@ResponseBody
	public String EmailCheck(String mem_email) {
	return service.EmailCheck(mem_email);
	}

	@RequestMapping("TelCheck.do") //전화번호 체크
	@ResponseBody
	public String TelCheck(String mem_tel) {
	return service.TelCheck(mem_tel);
	}
	
	@RequestMapping("NonmemTelCheck.do") //비회원 전화번호 체크
	@ResponseBody
	public String NonmemTelCheck(String nonmem_tel) {
	return service.NonmemTelCheck(nonmem_tel);
	}
	
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST) // 회원가입
	public String postSignup(MemberVO vo1) throws Exception {
	 logger.info("post signup");
	 logger.info(vo1.getMem_sex());
	  service.signup(vo1);
	 return "redirect:login.do";
	}
	
	
	@RequestMapping(value = "/nmsignup.do", method = RequestMethod.POST) // 비회원 정보입력
	public String nmpostSignup(NonMemberVO vo1) throws Exception {
	logger.info("post nmsignup");
	service.nmsignup(vo1);
	return "redirect:/";
	}

//3. 회원 정보 CRUD 파트
	
	
	@RequestMapping("/myPage.do") //마이페이지
	public String getMyInfo(MemberVO vo1, Model model1,@RequestParam(value="mem_id",required = false)String mem_id){ 
		String path="";
		try {
			if(!mem_id.equals("null")) {
				vo1.setMem_id(mem_id);
				model1.addAttribute("mMyInfo",service.getMyInfo(vo1));
				path= "member/myPage";
			}
		}	
		catch(Exception e) {
				path="member/error_member";
		}
		return path;
	}
		
		
	@RequestMapping("/deleteAccount.do") //회원탈퇴
	public String deleteAccount(MemberVO vo1) throws Exception { 
	service.deleteAccount(vo1);
	return "redirect:logout.do";
	}
		
		
	@RequestMapping(value="/updateinform.do", method=RequestMethod.GET) //회원정보 수정화면
	public String updateInform(MemberVO vo1, Model model1) throws Exception  { 
	model1.addAttribute("mMyInfo1", service.getMyInfo(vo1));
	return "member/informupdate";
	}
		
	
	@RequestMapping(value="/updateAccount.do") //회원정보 수정
	public String updateAccount(Model model, MemberVO vo1, @RequestParam("mem_id") String mem_id 
	) throws Exception {
		
	vo1.setMem_id(mem_id);
		
	service.updateAccount(vo1);
	model.addAttribute("mMyInfo", service.getMyInfo(vo1));
	return  "redirect:loginProcess.do";
	
	}
	
//4. 회원 아이디/비밀번호 찾기
	
	@RequestMapping(value = "/findinform.do", method={RequestMethod.GET,RequestMethod.POST}) // 아이디/비밀번호 찾기 화면
	public String findinform(){
	logger.info("post findinform");
	return "member/findinform";
	}		
			
			
			
			
			
	@RequestMapping("findID.do") //아이디 찾기
	public String findID(String mem_tel, Model model1, HttpServletResponse response) throws Exception {
	String status = service.findID(mem_tel);
	if (status != null) {
	model1.addAttribute("findid", service.findID(mem_tel));
	return "member/IDPWfind_result";
	}
	else {
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();
	out.println("<script>alert('입력하신 전화번호로 가입된 아이디가 없습니다.'); history.go(-1);</script>");
	out.flush();

	return "member/findinform";
		}
	}
			
	@RequestMapping("findPW.do") //비밀번호 찾기
	public String findPW(MemberVO vo1, @RequestParam("mem_id") String mem_id, @RequestParam("mem_tel2")String mem_tel , 
	Model model1, HttpServletResponse response) throws Exception {
	vo1.setMem_id(mem_id);
	vo1.setMem_tel(mem_tel);
	String status2 = service.findPW(vo1);
			
	if(status2 != null) {
	model1.addAttribute("findpw", service.findPW(vo1));
	return "member/IDPWfind_result";
	}
	
	else {
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();
	out.println("<script>alert('입력하신 정보로 조회된 비밀번호가 없습니다.'); history.go(-1);</script>");
	out.flush();

	return "member/findinform";
		}
			
		}

	}
