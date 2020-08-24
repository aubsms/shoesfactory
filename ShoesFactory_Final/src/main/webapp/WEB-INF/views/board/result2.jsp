<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<script type="text/javascript" charset="UTF-8">
$(document).ready(function(){
	$('#mytable').DataTable({ destroy: true,//테이블 파괴가능
           							bPaginate: true, //페이징처리
           							bLengthChange: true, // n개씩보기
            							"lengthMenu" : [ [10, 25, 50, -1], [10, 25, 50, "All"] ], // 10/25/50/All 개씩보기
            							bAutoWidth: false, //자동너비
            							order: [[0, 'desc']],
            							ordering: true, //칼럼별 정렬
            							searching: true //검색기능
		}
	);
});
</script>


<title>Insert title here</title>
<style>

	table {
		border-collapse: Separate;
	}

	th, td {
 		text-align: left;
 		padding: 8px;
	}

	tr:nth-child(even){
		background-color: #f2f2f2
	}

	th {
  		background-color: #4CAF50;
  		color: white;
	}

	body{
		width: 80%;
 		margin-left: auto;
		margin-right: auto;
	}
</style>
</head>
<body>
<h2>자유 게시판</h2>
	<a href="createboard.jsp" style="align:right">글쓰기</a>
	<table id="mytable" class="table table-striped table-bordered">
			<colgroup>
				<col style="width:15%;" />
				<col style="width:10%;" />
				<col style="width:auto%;" />
				<col style="width:10%;" />
				<col style="width:15%;" />
			</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty boardlist}" >
					<tr>
						<td colspan="4" align="center">데이터가 없습니다.</td>
					</tr>
				</c:when> 
				<c:when test="${!empty boardlist}">
					<c:forEach var="list" items="${boardlist}">
						<tr>
							<td><c:out value="${list.BOARD_NO}"/></td>
							<td><c:out value="${list.BOARD_WRITER}"/></td>
							<td><a href="GetUpdateViewCnt.do?BOARD_NO=${list.BOARD_NO}">${list.BOARD_TITLE}</a></td>
							<td><c:out value="${list.BOARD_HIT}"/></td>
							<td><c:out value="${list.BOARD_DATE}"/></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
	</table>
</body>
</html>