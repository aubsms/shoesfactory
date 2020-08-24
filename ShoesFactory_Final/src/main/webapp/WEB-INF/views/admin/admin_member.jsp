<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
	section {
		width: 1050px;
		margin-left: auto;
		margin-right: auto;
	}
	.member_search {
		width: 1050px;
		border: 1px solid gray;
		border-collapse: collapse;
	}
	.member_search th {
		background-color: lightgray;
	}
	.member_search th .member_search td {
		border: 1px solid gray;
	}
	.member_show {
		width: 1050px;
		text-align: center;
		border-collapse: collapse;
	}
	.member_show th {
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		background-color: lightgray;
	}
	.member_show td {
		border-bottom: 1px solid gray;
	}
	.button {
		float: right;
		margin-bottom: 30px;
	}
</style>
<title>슈즈팩토리</title>
</head>
<body>
	<h1 align=center>회원관리</h1>
	<section>
		<form action="" method="">
			<table class="member_search">
				<tr>
					<th>이름</th>
					<td><input type="text"></td>
					<th>아이디</th>
					<td><input type="text"></td>
					<th>전화번호</th>
					<td><input type="text"></td>
					<th>성별</th>
					<td>
						<select name="sex">
							<option value="">::전체::</option>
							<option value="">남자</option>
							<option value="">여자</option>
						</select>
					</td>
				</tr>
			</table>
			<input type="submit" value="검색하기" class="button">
		</form>
		<table class="member_show">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>생년월일</th>
				
			</tr>
			<c:forEach var="memlist" items="${memAll }"> 
				<tr>
					<td>${memlist.mem_name}</td>
					<td>${memlist.mem_id}</td>
					<td>${memlist.mem_sex}</td>
					<td>${memlist.mem_tel }</td>
					<td>${memlist.mem_email}</td>
					<td>${memlist.mem_yy}년${memlist.mem_mm}월${memlist.mem_dd}일</td>
					
				</tr>
			</c:forEach>
			<tr><td><a href="adminhome.do"><input type="button" value="관리자홈"></a></td></tr>
		</table>
	</section>
</body>
</html>