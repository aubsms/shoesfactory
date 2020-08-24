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
	
	<title>아이디/비밀번호 찾기 결과</title>
	
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src ="https://ajax.googleapis.com.ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
</script>




<body>
<c:forEach var="myfindid" items="${findid}">
	<h1>아이디 /비밀번호 찾기 결과</h1>
				<form id="findIDform" name="findIDform">
					<table>
						<tr><td>회원님의 아이디는 ${myfindid} 입니다.</td></tr>
					</table>
				</form>
</c:forEach>

<c:forEach var="myfindpw" items="${findpw}">
	<h1>아이디 /비밀번호 찾기 결과</h1>
			<form id="findPWform" name="findPWform">
					<table>
						<tr><td>회원님의 비밀번호는 ${myfindpw} 입니다.</td></tr>
					</table>
				</form>

</c:forEach>
<form action="login.do" method="post">
<input type="submit"  value="로그인 페이지로">
</form>		
</body>
<%@ include file="../footer.jsp"%>			
</html>