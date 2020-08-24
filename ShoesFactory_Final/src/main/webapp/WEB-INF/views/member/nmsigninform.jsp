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
	
	<title>로그인</title>
	
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src ="https://ajax.googleapis.com.ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

$(function () {
	
	$("#nonmem_tel").keyup(function (){
		var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		var tel = $("#nonmem_tel").val().replace(/-/gi,'');
		
		
		if(tel.length==11 || tel.length==10) {
			if(regExp_ctn.test(tel)){
				 tel = tel.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	             $(this).val(tel);
			}
		}
	});
	
	
});



</script>




<body>
	<h1>비회원 로그인 페이지</h1>
	
		
				<form id="nmloginFrm" name="nmloginFrm" action="nmloginCheck.do">
					<table>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="nonmem_tel" id="nonmem_tel" ></td>
						</tr>
						
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="nonmem_pw" id="nonmem_pw" maxlength="20"></td>
						</tr>
						
							
						<tr>
							<td colspan=2>
								<input type="submit" onclick="nmsignin_submit" id="login" value="비회원 로그인"/>
							</td>
						</tr>
						<tr><td id="nmlogin_check"></td></tr>
					</table>
				</form>
			<form action = "nmsignupform.do" method="post">
			<input type="submit" value="비회원 정보입력"/>
			</form>	
				
			<form action = "signupform.do" method="post">
			<input type="submit" value="회원가입"/>
			</form>


			
			
			
		
</body>
<%@ include file="../footer.jsp"%>		
</html>