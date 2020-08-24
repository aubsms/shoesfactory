<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">

<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 

<title>Insert title here</title>
<style>
	.button {
  		background-color: #f44336;
 	 	border: none;
  		color: white;
  		padding: 5px 15px;
  		text-align: center;
  		text-decoration: none;
  		display: inline-block;
  		font-size: 10px;
	}
	.button:hover {
  		background-color: #f44336;
  		color: white;
	}
	body {
		padding-top: 70px;
		padding-bottom: 30px;
	}
</style>
</head>
<body>
<article>
 <div class="container">
  <div class="table-responsive">
  <h2>후기 게시판</h2>
  <c:forEach var="review" items="${review}">
  	<form action="GetUpdateReview.do?REV_NO=${review.REV_NO}" method="get">
	<table class="table table-striped table-sm">
		<colgroup>
			<col style="width:15%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:auto%;" />
			<col style="width:10%;" />
		</colgroup>
		<tbody>
			<tr>
				<td colspan="5"><h4>후기 수정 form</h4></td>
			</tr>
			<tr>
				<td><input type="text" name="REV_NO" id="REV_NO" value="${review.REV_NO}" style="width: 40px" readonly="readonly"></td>
				<td><input type="text" name="REV_NAME" id="REV_NAME" value="${review.REV_NAME}" style="width: 100px" readonly></td>
				<td><input type="text" name="REV_SIZE" id="REV_SIZE" value="${review.REV_SIZE}" style="width: 100px" readonly></td>
				<td><input type="text" name="REV_WRITER" id="REV_WRITER" value="${review.REV_WRITER}" style="width: 100px" readonly></td>
				<td><select name="REV_IMGPATH">
  						<option value="10" selected>10</option>
  						<option value="9">9</option>
  						<option value="8">8</option>
  						<option value="7">7</option>
  						<option value="6">6</option>
  						<option value="5">5</option>
  						<option value="4">4</option>
  						<option value="3">3</option>
  						<option value="2">2</option>
  						<option value="1">1</option>
 					</select>
 				</td>
			</tr>
			<tr>
				<td colspan="5"><textarea class="form-control" rows="4" name="REV_CONTEXT" id="REV_CONTEXT" required>${review.REV_CONTEXT}</textarea>
					<script>					
						$(document).ready(function() {
	     				$('#REV_CONTEXT').summernote({
	            			height: 300,                
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
				<td></td><td></td><td></td><td></td>
				<td><input type="submit" value="작성" class="button"></td>
			</tr>
		</tbody>
	</table>
	</form>
	</c:forEach>
  </div>
 </div>
</article>


</body>
</html>