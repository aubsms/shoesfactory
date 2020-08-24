<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩과 J쿼리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<title>Insert title here</title>
<style>

	table {
  		border-collapse: Separate;
 		width: 80%;
  		margin-left: auto;
  		margin-right: auto;
	}
	
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

<c:forEach var="deteil" items="${deteilboard}">
	<form action="GetUpdateBoard.do?BOARD_NO=${deteil.BOARD_NO}" method="GET">	
		<table>
			<tr>
				<td>글 번호</td><td colspan="2">
				<input type="text" name="BOARD_NO" value="${deteil.BOARD_NO}" readonly></td>
				<td>글 타입</td><td colspan="2">
				<input type="text" name="BOARD_TYPE" value="${deteil.BOARD_TYPE}"></td>
			</tr>
			<tr>
				<td colspan="2">글 제목</td><td colspan="4"><input type="text" name="BOARD_TITLE" value="${deteil.BOARD_TITLE}" style="width: 400px"></td>
			</tr>
			<tr>
				<td colspan="6">
				<textarea class="form-control" rows="5" name="BOARD_CONTEXT" id="BOARD_CONTEXT" placeholder="내용을 입력해 주세요" ></textarea>
					<script>
						$(document).ready(function() {
	     				$('#BOARD_CONTEXT').summernote({
	            			height: 300,                 // set editor height
	             			minHeight: null,             // set minimum height of editor
	             			maxHeight: null,             // set maximum height of editor
	             			focus: true,                 // set focus to editable area after initializing summernote
	             			lang: 'ko-KR'
	     						});
							});
					</script>
				</td>
			</tr>	
			<tr>
				<td></td><td></td><td></td><td></td>
				<td align="right"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</c:forEach>
</body>
</html>