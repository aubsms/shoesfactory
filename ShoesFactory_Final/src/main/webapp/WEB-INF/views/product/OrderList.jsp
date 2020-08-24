<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .order_tr{
background-color:#D8D8D8;
height:35px;
font-weight:bold;
font-size:20;
}
.btn3 {
width:120px;
height:40px;
background-color:#D8D8D8;
}
.table1{
 width:1000px;
 margin-left:auto;
 margin-right:auto;
 margin-top:100px;
 border:0;
}
.cap{
 text-align:left;
 font-size:25pt;
 margin-bottom:30px;
}
</style>
</head>
<body>

<table class="table1">
<caption class="cap">구매내역</caption>
     <Tr class="order_tr">
          <th style="width:20%">이미지</th><th style="width:15%">상품명</th>
          <th style="width:10%">사이즈</th><th style="width:5%">수량</th><th style="width:10%">상품금액</th>
          <th style="width:5%">주문상태</th><th style="width:5%">적립금</th>
     </Tr>
    <tr align="center">
    <c:forEach var="info" items="${hisinfo }">
    <td><img src="${info.his_imgpath }" width="100" height="100"></td><td>${info.his_name }</td>
    <td>${info.his_size }</td><td>${info.his_amount }개</td><td> ${info.his_price }만원</td><td>배송중</td><td> 500P </td></tr>
    </c:forEach>
</table>
<br>
<table class="table1">
<tr><td align="right"><label>총 구매금액 : ${totalprice} 만원</label></td></tr>
<tr><td align="center"><input class="btn3" type="button" onclick="" value="홈으로">
</table>


</body>
</html>