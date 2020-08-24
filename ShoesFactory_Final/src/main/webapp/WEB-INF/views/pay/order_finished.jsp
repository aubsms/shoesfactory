<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슈즈팩토리</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	section {
		width: 1050px;
		margin-left: auto;
		margin-right: auto;
	}
	h1 {
		text-align: center;
		margin-top: 100px;
	}
	h2 {
		max-width: 1000px;
		margin: 70px auto 10px auto;
		font-size: 20px;
	}
	.wrap { 
		position:relative;
		margin:0 auto;
		width:1050px;
		height:180px;
		table-layout: fixed;
		border-collapse: collapse;
		border-top: 2px solid black;
	}
	.wrap td {
		border-bottom: 1px solid gray;
	}
	.payment {
		padding-left: 20px;
		padding-right: 20px;
	}
	.payment-label {
		float: left;
		line-height: 3;
		font-weight: bold;
	}
	.payment-value {
		float: right;
		font-size: 25px;
		font-weight: bold;
		line-height: 1.8;
	}
	.center {
		border-left: 1px solid gray;
		border-right: 1px solid gray;
	}
	.minus {
		position:absolute;
		top:35px;
		left:337px;
		width: 24px;
		height: 24px;
		background-image:url("./resources/image/minus.jpg");
		text-align:center;
		line-height:300px;
	}
	.equals {
		position:absolute;
		top:35px;
		left:689px;
		width: 24px;
		height: 24px;
		background-image:url("./resources/image/equals.jpg");
		text-align:center;
		line-height:300px;
	}
	.product_show {
		width: 1050px;
		text-align: center;
		border-collapse: collapse;
	}
	.product_show th {
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		background-color: lightgray;
	}
	.product_show td {
		border-bottom: 1px solid gray;
	}
	.product_show img {
		width: 50px;
		height: 50px;
	}
</style>
</head>
<body>
	<h1>감사합니다. 결제가 완료되었습니다.</h1>
	<h2>결제내역</h2>
	<table class="wrap">
		<tr>
			<td>
				<div class="payment">
					<span class="payment-label">주문금액</span>
					<span class="payment-value">${paylist.his_price }원</span>
				</div>
			</td>
			<td class="center">
				<div class="payment">
					<div class="minus"></div>
					<span class="payment-label">할인금액</span>
					<span class="payment-value">0원</span>
				</div>
			</td>
			<td>
				<div class="payment">
					<div class="equals"></div>
					<span class="payment-label">결제금액</span>
					<span class="payment-value">${paylist.his_price }원</span>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="payment">
					<span class="payment-label">구매상품 총$${fn:length(paylist)} 개</span>
				</div>
			</td>
			<td class="center"></td>
			<td>
				<div class="payment">
					<span class="payment-label">결제수단</span>
					<span class="payment-value">card</span>
				</div>
			</td>
		</tr>
	</table>
	<h2>주문하신 상품 정보</h2>
	<table class="product_show">
			<tr>
				<th width=65><input type="checkbox" class="checkbox" id="all_check"></th>
				<th width=200>상품이미지</th>
				<th width=300>상품명</th>
				<th>사이즈</th>
				<th width=100>수량</th>
				<th width=200>상품가격</th>
			</tr>
		<c:forEach var="paylist" items="${paylist}">
		<tr><td><img src="${paylist.his_mainimg }" width="100" height="100"></td>
		<td>${paylist.his_name }</td>
		<td>${paylist_his_size }</td>
		<td>${paylist.his_amount }</td>
		<td>${paylist.his_price }원</td>
		
		</tr>
		</c:forEach>
		</table>
</body>
</html>