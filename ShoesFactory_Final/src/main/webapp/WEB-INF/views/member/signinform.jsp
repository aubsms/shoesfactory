<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>	
<title>슈즈팩토리</title>
</head>
<style>
	section {
		width: 1050px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	h1 {
		margin: 70px auto;
		text-decoration: underline;
		text-underline-position: under;
	}
	a {text-decoration: none;}
	a:visited {text-decoration: none;}
	a:hover, a:active {text-decoration: none;}
	a {
		color: black;
	}
	.left-login {
		float: left;
		margin: 0px 50px;
	}
	.right-login {
		float: left;
		margin-left: 50px;
	}
	.tablinks {
		margin: 15px -4.2px;
		width: 230px;
		height: 50px;
		background-color: rgba(255,255,255,0);
		border: none;
		font-size: 11pt;
		color : gray;
		border-bottom: 3px solid black;
	}
	.tablinks.active {
		background-color: rgba(255,255,255,0);
		border: none;
		color : black;
		border-left: 3px solid black;
		border-top: 3px solid black;
		border-right: 3px solid black;
		font-weight: bold;
	}
	tr {
		height: 45px;
	}
	.login_btn {
		width: 100px;
		height: 70px;
		border: none;
		background-color: black;
		color : white;
	}
	.signup_btn {
		width: 460px;
		height: 40px;
		border: none;
		background-color: black;
		color : white;
		margin-top: 10px;
	}
	.snslog {
		font-size: 13pt;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src ="https://ajax.googleapis.com.ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"></script>
<script>
	/* 회원로그인, 비회원주문조회 탭 */
	function openTab(evt, tabName) {
		var i, tabcontent, tablinks;
		
		tabcontent = document.getElementsByClassName("tabcontent"); //컨텐츠 불러옴
		for(i=0; i<tabcontent.length; i++) {
			tabcontent[i].style.display = "none"; //컨텐츠 모두 숨김
		}
		tablinks = document.getElementsByClassName("tablinks"); //탭 불러옴
		for(i=0; i<tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active",""); //탭 초기화
		}
		document.getElementById(tabName).style.display = "block"; //해당되는 컨텐츠만 보여줌
		evt.currentTarget.className += " active"; //클릭한 탭 활성화
	}
</script>
<body>
	<h1 align="center">로그인</h1>
	<section>
		<div class="left-login">
			<div class="tab">
				<button class="tablinks active" onclick="openTab(event, 'tab1')">회원 로그인</button>
				<button class="tablinks" onclick="openTab(event, 'tab2')">비회원 주문조회</button>
			</div>
			<div id="tab1" class="tabcontent" style="display:block;">
				<form id="loginFrm" name="loginFrm" action="loginCheck.do">
					<table>
						<tr>
							<td width=100px; style="font-weight:bold;">아이디</td>
							<td width=250px;><input type="text" name="mem_id" id="mem_id" style="width:230px; height:25px;"></td>
							<td rowspan=2><input type="submit" class="login_btn" onclick="signin_submit" id="login" value="로그인"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">비밀번호</td>
							<td><input type="password" name="mem_pw" id="mem_pw" maxlength="20" style="width:230px; height:25px;"></td>
						</tr>
						<tr>
								<td colspan=3><a href="signupform.do"><input type="button" class="signup_btn" value="회원가입"></a></td>
						</tr>
						<tr>
							<td colspan=3><a href="findinform.do">아이디/비밀번호 찾기</a>
						</tr>
					</table>
				</form>
			</div>
			<div id="tab2" class="tabcontent" style="display:none;">
				<form id="nmloginFrm" name="nmloginFrm" action="nmloginCheck.do">
					<table>
						<tr>
							<td width=100px; style="font-weight:bold;">전화번호</td>
							<td width=250px;><input type="text" id="nonmem_tel" name="nonmem_tel" style="width:230px; height:25px;"></td>
							<td rowspan=2><input type="submit" class="login_btn" value="로그인"></td>
						</tr>
						<tr>
							<td style="font-weight:bold;">비밀번호</td>
							<td><input type="password" id="nonmem_pw" name="nonmem_pw" style="width:230px; height:25px;"></td>
						</tr>
						
						<tr>
								<td colspan=3><a href="nmsignupform.do"><input type="button" class="signup_btn" value="비회원 정보입력"></a></td>
						</tr>
						<tr>
							<td colspan=3><a href="findinform.do">아이디/비밀번호 찾기</a>
						</tr>
						
					</table>
				</form>
				<!--  <form action = "nmsignupform.do" method="post">
				<input type="submit" value="비회원 회원가입"/>
			</form> -->
			
			</div>
		</div>
		<div class="right-login">
			<table>
				<tr>
					<td height=60px; class="snslog">SNS 로그인</td>
				</tr>
				<tr>
					<td><a id="kakao-login-btn"></a>
						<a href="http://developers.kakao.com/logout"></a>
					</td>
				</tr>
			</table>
		</div>
		
	<script type='text/javascript'>
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('9dfab909fc4c72791781c048e0b9e04a');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	        alert(JSON.stringify(authObj));
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
	  //]]>
	  
	    $(function () {
	    
	    	$('#reg_submit').click(function(){
	    	
	    		$.ajax({
	
	    			type: 'POST',  
	
	    			url: './loginCheck.do', 
	
	    			data: {mem_email: email},  
	
	    			success: function(result){  
	
	    				if(result == '1'){ 
	    					$("#email_check").css("color","red").css("font-size","12px");
	    				    $("#email_check").html("이미 사용중인 이메일 주소입니다.");
	    				    emailj=0;
	    				} else {
	    						$("#email_check").css("color","green").css("font-size","12px");
	    						 $("#email_check").html("사용가능한 이메일 주소입니다.");
	    						 emailj=1;
	    				}
	    			} 
	    		})
	    	});
	    });
	</script>
</section>
</body>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.jsp"%>			
</html>