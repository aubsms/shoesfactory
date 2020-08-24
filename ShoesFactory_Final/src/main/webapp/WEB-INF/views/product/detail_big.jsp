<%@page import="java.util.List"%>
<%@page import="com.shoesfactory.DAOVO.category.categoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슈즈팩토리</title>
<style>
	* {
     	margin: 0;
     	padding: 0;
     }
	h1 {
		margin: 50px auto 20px auto;
     	text-align: center;
	}
	.smallcate {
		width: 100%;
     	text-align: center;
	}
	.smallcate li{
		display: inline-block;
		margin: 0px 20px;
		font-weight: bold;
		list-style: none;
	}
	.smallcate li a {
		color: black;
	}
	.filter {
		width: 1000px;
		margin: 50px auto;
		padding: 20px 30px;
		border: 2px solid black;
	}
	.filter td {
		height: 40px;
	}
	.filter input {
		margin-left: 15px;
	}
	#search {
		width: 90px;
		height: 40px;
		background-color: black;
		color: white;
		border: none;
		margin-top: 20px;
	}
	.check {
		display: none;
		padding: 20px 0px;
		border: 2px solid black;
	}
	.check li {
		display: inline-block;
		margin: 0px 10px;
		list-style: none;
	}
	.check li strong {
		margin-right: 40px;
	}
	.submit {
		margin-left: 50px;
		width: 90px;
		height: 30px;
		background-color: black;
		color: white;
		border: none;
	}
	.sort_width {
		position: relative;
		max-width: 1050px;
		margin: 20px auto;
		height: 30px;
	}
	.sort {
		display: block;
		float: right;
		padding-top: 4px;
		padding-bottom: 7px;
	}
	.product {
		max-width: 1050px;
		margin: 30px auto;
		text-align: center;
	}
</style>
<%
	List<categoryVO> product = (List<categoryVO>)request.getAttribute("biginfo");
	String productList = "";
	if(product != null) {
		for(int i=0; i<product.size(); i++){
			if(i != product.size()-1){
				productList += "\'"+product.get(i).getProd_name()+"\'"+",";
			}
			else{
				productList += "\'"+product.get(i).getProd_name()+"\'";
			}
		}
	}	
	
	String title = (String)request.getAttribute("bigname");
%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	/* select option 값 가져와서 상품리스트랑 같이 보내기 */
	$(function() {
		$(".sort").on('change', function() {
			var select = $(this).val();
			location.href="/myapp/big_sort.do?sort="+select+"&bigtype=<%=title%>&sort_list=<%=productList%>";
		});
	});
</script>
</head>
<body>
	<section>
		<h1 align="center">${bigname}</h1>
		<div>
			<ul class="smallcate">
				<c:forEach var="bigsmall" items="${bigsmall}">
					<li><a href="smallcategory.do?smalltype=${bigsmall.prod_cat_small}">${bigsmall.prod_cat_small}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="filter">
			<form action="bigall.do">
				<table style="margin-left:auto; margin-right:auto;">
				<tr>
					<td width=150><strong>사이즈</strong></td>
					<td>
						<input type="checkbox" name="size" value="230"> 230mm
						<input type="checkbox" name="size" value="240"> 240mm
						<input type="checkbox" name="size" value="250"> 250mm
						<input type="checkbox" name="size" value="260"> 260mm
						<input type="checkbox" name="size" value="270"> 270mm
						<input type="checkbox" name="size" value="280"> 280mm
					</td>
				</tr>
				<tr>
					<td><strong>가격</strong></td>
					<td>
						<input type="checkbox" name="price" value="1"> 3만원 이하
						<input type="checkbox" name="price" value="2"> 3만원 ~ 5만원
						<input type="checkbox" name="price" value="3"> 5만원 ~ 7만원
						<input type="checkbox" name="price" value="4"> 7만원 ~ 10만원
						<input type="checkbox" name="price" value="5"> 10만원 이상
					</td>
				</tr>
				<tr>
					<input type="hidden" name="bigtype" value="${bigname}">
					<td colspan=2 style="text-align:center;"><input type="submit" name="search" value="검색" id="search"></td>
				</tr>
			</table>
			</form>
		</div>
		<div class="sort_width">
			<select name="sort" class="sort">
				<!-- <option value="new">신상품순</option>
				<option value="popular">인기순</option> -->
				<option value="">:::::정렬:::::</option>
				<option value="low_price">가격 낮은순</option>
				<option value="high_price">가격 높은순</option>
			</select>
		</div>
		<table class="product">
			<c:set var="i" value="0"/>
			<c:set var="j" value="3"/>
			<c:forEach var="biginfo" items="${biginfo}">
				<c:if test="${i%j==0}">
					<tr>
				</c:if>
				<td style="padding:50px;"><a href="prod_detail.do?prod_name=${biginfo.prod_name}"><img src="${biginfo.prod_main_imgpath}" width="250" height="200"></a>
					<br><a href="prod_detail.do?prod_name=${biginfo.prod_name}">${biginfo.prod_name}</a>
					<br>${biginfo.prod_price}원
				</td>
				<c:if test="${i%j==j-1}">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		</table>
	</section>
</body>
</html>