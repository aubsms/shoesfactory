<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<title>Insert title here</title>
	<style>
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
	<table class="table table-striped table-sm">
		<colgroup>
			<col style="width:15%;" />
			<col style="width:10%;" />
			<col style="width:auto%;" />
			<col style="width:10%;" />
		</colgroup>
		<thead>
			<tr>
				<th>평가</th>
				<th>작성자</th>
				<th>내용</th>
				<th>이미지 URL</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty getReview}" >
					<tr><td colspan="4" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:when test="${!empty getReview}">
					<c:forEach var="list" items="${getReview}">
						<tr>
						<td><c:out value="${list.REV_NAME}"/></td>
						<td><c:out value="${list.REV_WRITER}"/></td>
						<td><c:out value="${list.REV_CONTEXT}" escapeXml="false"/></td>
						<td><c:out value="${list.REV_IMGPATH}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
	<a href="addreview.jsp">글쓰기</a>
  </div>
 </div>
</article>


</body>
</html>