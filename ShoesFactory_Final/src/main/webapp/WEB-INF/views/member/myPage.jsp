<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
/* select {
  width: 80px;
  padding: .8em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}

select::-ms-expand {
  display: none;
} */
h1{
 text-align:center;
 margin:30px;
}
.btn {
width:80px;
height:40px;
margin: 30px 10px;
background-color:#D8D8D8;
}
.btn1 {
width:120px;
height:40px;
background-color:#D8D8D8;
}
.join_form {
height:25px;
width: 200px;
}
.join_ctr{
height:50px;
}
.table1{
	margin: 50px auto 10px auto;
 	border:0;
}
.table3{
	text-align: center;
	 margin-left:auto;
 	margin-right:auto;
 	border:0;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(function () {
	
	$("#deleteAccount_submit").click(function(){	
	sub();
	alert('회원 탈퇴가 완료되었습니다.')
	
});
	
function sub() {

var form = document.getElementById('deleteAccountform');

form.submit();


	}
	

});
</script>
</head>
<body>
<h1>마이 페이지</h1>
<c:forEach var="myinfo" items="${mMyInfo}">
	<form action="updateinform.do?mem_id=${myinfo.mem_id}" method="get">
	<table class="table1">
		<tr class="join_ctr"><td width=120px>ID</td>
			<td><input class="join_form"  type = "text" id="mem_id" name="mem_id" value="${myinfo.mem_id}" readonly></td></tr>
		<tr class="join_ctr"><td>비밀번호</td>
			<td><input class="join_form" type = "password" id="mem_pw" name=" mem_pw" value="${myinfo.mem_pw}" readonly></td></tr>
		<tr class="join_ctr"><td>이름</td>
			<td><input class="join_form" type = "text" id="mem_name" name="mem_name" value="${myinfo.mem_name}" readonly></td></tr>
		<tr class="join_ctr"><td>이메일주소</td>
			<td><input class="join_form" type = "text" id="mem_email" name="mem_email" value="${myinfo.mem_email}" readonly></td></tr>
		<tr class="join_ctr"><td>우편번호</td>
			<td><input class="join_form" type = "text" id="mem_postnm" name="mem_postnm" value="${myinfo.mem_postnm}" readonly></td></tr>
		<tr class="join_ctr"><td>주소</td>
			<td><input class="join_form" type = "text" id="mem_addr" name="mem_addr" value="${myinfo.mem_addr}" readonly></td></tr>
		<tr class="join_ctr"><td>상세주소</td>
			<td><input class="join_form" type = "text" id="mem_dtaddr" name="mem_dtaddr" value="${myinfo.mem_dtaddr}" readonly></td></tr>
		<tr class="join_ctr"><td>기타</td>
			<td><input class="join_form" type = "text" id="mem_exaddr" name="mem_exaddr" value="${myinfo.mem_exaddr}" readonly></td></tr>
		<tr class="join_ctr"><td>생년월일</td>
			<td><input class="join_form" type = "text" id="mem_dob" name="mem_dob" value="${myinfo.mem_yy} 년 ${myinfo.mem_mm} 월 ${myinfo.mem_dd} 일" readonly></td></tr>
		<tr class="join_ctr"><td>관심분야</td>
			<td><input class="join_form" type = "text" id="mem_interest" name="mem_interest" value="${myinfo.mem_interest}" readonly></td></tr>
		<tr class="join_ctr"><td>포인트</td>
			<td><input class="join_form" type = "text" id="mem_point" name="mem_point" value="${myinfo.mem_point}" readonly></td></tr>
		<tr class="join_ctr"><td>회원등급</td>
			<td><input class="join_form" type = "text" id="mem_grade" name="mem_grade" value="${myinfo.mem_grade}" readonly></td></tr>
		</table>
		<table class="table3">
			<tr>
				<td>
					<input class="btn1" type="submit" value="회원정보 수정">
				</td>
				<td>
					<a href="deleteAccount.do?mem_id=${myinfo.mem_id}"><input class="btn" type="button" id="deleteAccount_submit" name="deleteAccountbtn" value="회원 탈퇴"></a>
				</td>
				<td>
					<a href="loginProcess.do?mem_id=${myinfo.mem_id}"><input class="btn" type="button" value="홈으로"></a>
				</td>
		 	</tr>
		 </table>
		
	</form>
<%-- 	<div class="table3">
	<form action ="deleteAccount.do?mem_id=${myinfo.mem_id}" id="deleteAccountform" method="post">
	<input type ="button" id="deleteAccount_submit" name="deleteAccountbtn" value="회원 탈퇴">
	</form>
	<form action ="loginProcess.do?mem_id=${myinfo.mem_id}" method="post">
	<input type ="submit" value="홈으로">
	</form>
	</div> --%>
	<!-- <a href = "javascript:history.back()">[홈으로]</a> -->
</c:forEach>
</body>
<%@ include file="../footer.jsp"%>
</html>