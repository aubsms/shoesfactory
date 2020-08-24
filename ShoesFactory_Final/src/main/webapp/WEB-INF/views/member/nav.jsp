<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="mylogin" items="${mlogin}">
<ul>

 <li>
 ${mylogin.mem_name}님 환영합니다.<br>
 포인트:${mylogin.mem_point} 포인트<br>
등급:${mylogin.mem_grade} 등급
 </li>
 <li>
  <a href="myPage.do?mem_id=${mylogin.mem_id}">마이페이지</a>
 </li>
 <li>
  <a href="logout.do">로그아웃</a>
 </li>

 
 </ul>
 <a href="GetBoardList.do">자유게시판으로 가자!!</a>
<a href="GetReview.do?PROD_NO=4">후기게시판으로 가자!!</a>
</c:forEach>
