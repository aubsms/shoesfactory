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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">

$(function () {
	var inval_Arr = new Array(1).fill(false);
	var pwj = 0;
	
$("#BOARD_PW").keyup(function(){
	var pw = $("#BOARD_PW").val();
	var no = $("#BOARD_NO").val();
	$.ajax({

		type: 'POST',  

		url: './BoardpwCheck.do', 

		data: {BOARD_NO:no},  

		success: function(result){  

			if(result.equals(pw)){ 
			$("#boardpw_check").html("글 비밀번호가 일치합니다.");
			pwj=1;    
				 
				
			   
			} else {
					
					 $("#boardpw_check").html("글 비밀번호가 일치하지 않습니다.");
				pwj=0;
			}


		} 
  
	})	
	

});

$("#updateboard_submit").click(function(){
	
	if (pwj == 1) {
		inval_Arr[0] = true;
	} else {
		inval_Arr[0] = false;
	}
	
	
	
	if(validAll){ 
		
		sub();
		alert('게시글 수정이 완료되었습니다.')
		
	} else{
		alert('글 비밀번호를 다시 한번 확인해주세요.')
		
	}


	
});



function sub() {

	var form = document.getElementById('updateboardform');

	form.submit();
}

	
});
</script>


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
	<form action="GetUpdateBoard.do?BOARD_NO=${deteil.BOARD_NO}" id="updateboardform" method="GET">	
		<table>
			<tr>
				<td>글 번호</td><td colspan="2">
				<input type="text" id="BOARD_NO" name="BOARD_NO" value="${deteil.BOARD_NO}" readonly></td>
				<td>글 타입</td><td colspan="2">
				<input type="text" id="BOARD_TYPE" name="BOARD_TYPE" value="${deteil.BOARD_TYPE}" required></td>
			</tr>
			<tr>
				<td>글 제목</td><td colspan="4"><input type="text" name="BOARD_TITLE" value="${deteil.BOARD_TITLE}" style="width: 400px" required></td>
			</tr>
			<tr>
				<td colspan="6">
				<textarea class="form-control" rows="4" name="BOARD_CONTEXT" id="BOARD_CONTEXT" placeholder="내용을 입력해 주세요" required ></textarea>
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
				<td>비밀번호</td><td colspan="2">
				<input type="text" id="BOARD_PW" name="BOARD_PW" placeholder="비밀번호를 입력해주세요."></td>		
			</tr>
			<tr><td id="boardpw_check"></td></tr>
			<tr>
				<td></td><td></td><td></td><td></td><td></td><td></td>
				<!-- <td align="right"><input type="submit" value="수정"></td> -->
				<td align="right"> <input type= "button"  id="updateboard_submit" value="수정"/></td>
			</tr>
		</table>
	</form>
</c:forEach>
</body>
</html>