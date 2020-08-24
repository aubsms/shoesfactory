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
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
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
	
</style>
</head>
<body>
	<c:forEach var="reple" items="${reple}">
	<form action="GetUpdateBReple.do?REPLE_NO=${reple.REPLE_NO}" method="get">
	<table class="table table-striped table-sm" style="width: 80%;">
		<tr>
			<td colspan="6"><h4>댓글 입력 Form</h4></td>
		</tr>
		<tr>
			<td><input type="text" name="REPLE_NO" id="REPLE_NO" value="${reple.REPLE_NO}" style="width: 100px"></td>
			<td><input type="text" name="BOARD_NO" id="BOARD_NO" value="${reple.BOARD_NO}" style="width: 100px"></td>
			<td><input type="text" name="REPLE_WRITER" id="REPLE_WRITER" value="${reple.REPLE_WRITER}" style="width: 100px"></td>
			<td></td><td></td><td></td>
		</tr>
		<tr>
			<td colspan="6">
			<textarea rows="5" cols="30" name="REPLE_CONTEXT" id="REPLE_CONTEXT" ></textarea>
				<script>					
					$(document).ready(function() {
	    				$('#REPLE_CONTEXT').summernote({
	           			height: 200,                
	            			minHeight: null,             
	            			maxHeight: null,             
	            			focus: true,                
	            			lang: 'ko-KR',
	    					});
					});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan="5"></td>
			<td><input type="submit" value="작성" class="button"></td>
		</tr>
	</table>
	</form>
	</c:forEach>
</body>
</html>