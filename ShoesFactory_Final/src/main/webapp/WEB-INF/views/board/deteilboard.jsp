<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩과 J쿼리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script type="text/javascript" charset="utf-8" src="/se2/js/HuskyEZCreator.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<title>Insert title here</title>
<style>

	.button {
  		background-color: #f44336;
 	 	border: none;
  		color: white;
  		padding: 10px 20px;
  		text-align: center;
  		text-decoration: none;
  		display: inline-block;
  		font-size: 12px;
	}
	.button:hover {
  		background-color: #f44336;
  		color: white;
	}
	table {
  		border-collapse: collapse;
  		width: 80%;
  		margin-left: auto;
  		margin-right: auto;
	}
	th, td {
  		text-align: left;
  		padding: 8px;
	}

	tr:nth-child(even){background-color: #f2f2f2}

	th {
  		background-color: #4CAF50;
  		color: white;
	}
	
</style>
</head>
<body>

	<table>
	<c:forEach var="deteil" items="${deteilboard}">	
		<tr>
			<td>글 번호</td><td colspan="4">${deteil.BOARD_NO}</td>
			<td>조회수</td><td colspan="4">${deteil.BOARD_HIT}</td>
		</tr>
		<tr>
			<td colspan="2">글 제목</td><td colspan="6">${deteil.BOARD_TITLE}</td>
		</tr>
		<tr>
			<td colspan="6"><c:out value="${deteil.BOARD_CONTEXT}" escapeXml="false"/></td>
		</tr>	
		<tr>
			<td></td><td></td><td></td>
			<td><td align="right"><a href="GetBoardList.do" class="button" style="width: 200;height: 100;">목록</a></td>
			<td align="right"><a href="GetDeteilBoard1.do?BOARD_NO=${deteil.BOARD_NO}" class="button" style="width: 200;height: 100;">수정</a></td>
			<td align="right"><a href="GetDeleteBoard.do?BOARD_NO=${deteil.BOARD_NO}" class="button" style="width: 100;height: 100;">삭제</a></td>
		</tr>
	</c:forEach>
	</table>
	
	<br><br><br><br>
	
	
	<table border="2" class="ttable table-striped table-bordered">
	<c:forEach var="reple" items="${breple}">
		<tr>
			<td>글 번호</td><td colspan="2">${reple.BOARD_NO}</td>
			<td>리플 번호</td><td colspan="2">${reple.REPLE_NO}</td>
			<td>작성자</td><td colspan="2">${reple.REPLE_WRITER}</td>
		</tr>
			<td colspan="8">${reple.REPLE_CONTEXT}</td>
	</c:forEach>
	</table>
	 
	<form action="GetCreateBReple.do" method="get">
	
		<table class="ttable table-striped table-bordered">
		<c:forEach var="deteil2" items="${deteilboard}">
			<tr>
				<td colspan="2"><h4>댓글 입력 From</h4></td>
			</tr>
			<tr>
				<td><input type="text" name="BOARD_NO" id="BOARD_NO" value="${deteil2.BOARD_NO}" readonly></td>
				<td><input type="text" name="REPLE_WRITER" id="REPLE_WRITER" value="<%=session.getAttribute("slogin")%>" readonly></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="100" name="REPLE_CONTEXT" id="REPLE_CONTEXT" ></textarea></td>
				<td><input type="submit" value="작성"></td>
			</tr>
			</c:forEach>
		</table>
	</form>

</body>
<%@ include file="../footer.jsp"%>
</html>