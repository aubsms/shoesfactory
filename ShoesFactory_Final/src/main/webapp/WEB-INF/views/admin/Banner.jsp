<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.table5{
 width:100%;
 text-align:center;
 border:1;
 margin-top:30px;
 border: 1px solid #BDBDBD;
 border-collapse: collapse;
}
th, td {
    border: 1px solid #BDBDBD;
    padding: 10px;
  }

.cap{
 text-align:left;
 font-size:20pt;
 margin-bottom:30px;
}
.member_tr{
 background-color:#BDBDBD;
}
</style>
</head>
<body>
<table class="table5">
<caption class="cap">배너관리</caption>
<colgroup>
<col width="5%">
<col width="20%">
<col width="25%">
<col width="20%">
<col width="20%">
<col width="10%">
</colgroup>
<tr class="member_tr">
<th scope="col">번호</th>
<th scope="col">위치</th>
<th scope="col">배너 이미지</th>
<th scope="col">노출기간</th>
<th scope="col">등록일</th>
<th scope="col">관리</th>
</tr>
<tr>
<td>1</td>
<td>메인 상단좌측</td>
<td></td>
<td>2020-03-01<br>~<br>2020-04-01</td>
<td>2020-02-28</td>
<td><a href="#">보기</a><br>
    <a href="#">수정</a><br>
    <a href="#">삭제</a><br>
</td>
</tr>
<tr>
<td>1</td>
<td>메인 상단우측</td>
<td></td>
<td>2020-03-01<br>~<br>2020-04-01</td>
<td>2020-02-28</td>
<td><a href="#">보기</a><br>
    <a href="#">수정</a><br>
    <a href="#">삭제</a><br>
</td>
</tr>
<tr>
<td>1</td>
<td>메인 상단</td>
<td></td>
<td>2020-03-01<br>~<br>2020-04-01</td>
<td>2020-02-28</td>
<td><a href="#">보기</a><br>
    <a href="#">수정</a><br>
    <a href="#">삭제</a><br>
</td>
</tr>

</table>

</body>
</html>