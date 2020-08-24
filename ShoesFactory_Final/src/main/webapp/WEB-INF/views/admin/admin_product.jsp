<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	h1 {
		text-align: center;
		margin: 50px;
	}
	section {
		width: 1050px;
		margin-left: auto;
		margin-right: auto;
	}
	.product_select {
		width: 1050px;
		height: 80px;
		border: 1px solid gray;
		border-collapse: collapse;
	}
	.product_select th {
		background-color: lightgray;
	}
	.product_select th, .product_select td {
		border: 1px solid gray;
	}
	.total {
		margin-top: 40px;
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
	.button {
		float: right;
		margin-bottom: 30px;
		margin-left: 5px;
		height: 30px;
		width: 90px;
		background-color: lightgray;
		border: none;
		font-size: 15px;
	}
	.btn {
		float: right;
	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

	/* 상품분류 */
	$(function() {
		$("#small_casual, #small_man, #small_woman, #small_kids").hide();
		
		$("select[name=bigcategory]").change(function() {
			var cate = $("select[name=bigcategory] option:selected").val();
			
			if(cate==="casual") {
				$("#small, #small_man, #small_woman, #small_kids").hide();
				$("#small_casual").show();
			}
			else if(cate==="man") {
				$("#small_casual, #small, #small_woman, #small_kids").hide();
				$("#small_man").show();
			}
			else if(cate==="woman") {
				$("#small_casual, #small_man, #small, #small_kids").hide();
				$("#small_woman").show();
			}
			else if(cate==="kids") {
				$("#small_casual, #small_man, #small_woman, #small").hide();
				$("#small_kids").show();
			}
			else {
				$("#small_casual, #small_man, #small_woman, #small_kids").hide();
				$("#small").show();
			}
		});
	});
	/* 체크박스 전체선택 */
	$(function() {
		$("#all_check").click(function() {
			if($("#all_check").is(":checked")){
				$(".checkbox").prop("checked",true);
			}
			else {
				$(".checkbox").prop("checked",false);
			}
		});
	});
	/* 한개 체크박스 해제시 전체 체크박스 해제 */
	$(function() {
		$(".checkbox").click(function() {
			if($("input[name='check']:checked").length == 10) {
				$("#all_check").prop("checked",true);
			}
			else {
				$("#all_check").prop("checked",false);
			}
		});
	});
	
function search(){
	var selectbig = document.getElementById('big');
	selectbig = selectOption.options[selectOption.selectedIndex].value;
	alert("big"+selectbig);
	var selectcasual = document.getElementById('small_casual');
	selectcasual = selectOption.options[selectOption.selectedIndex].value;
	alert("casual"+selectcasual);
	var selectman = document.getElementById('small_man');
	selectman = selectOption.options[selectOption.selectedIndex].value;
	alert("man"+selectman);
	var selectwoman = document.getElementById('small_woman');
	selectwoman = selectOption.options[selectOption.selectedIndex].value;
	alert("woman"+selectwoman);
	var selectkids = document.getElementById('small_kids');
	selectkids = selectOption.options[selectOption.selectedIndex].value;
	alert("kids"+selectkids);
	
	
	
	
	
}
</script>
</head>
<body>
	<h1 align="center">제품관리</h1>
	<section>
		<form action="prodstandard.do" method="get">
			<table class="product_select">
				<tr>
					<th width=200>상품분류</th>
					<td>
						<select id="big" name="bigcategory">
							<option value="">::대분류::</option>
							<option value="casual">캐주얼화</option>
							<option value="man">남성화</option>
							<option value="woman">여성화</option>
							<option value="kids">아동화</option>
						</select>
						<select name="small" id="small">
							<option value="">::소분류::</option>
						</select>
						<select name="small_casual" id="small_casual">
							<option value="">::소분류::</option>
							<option value="">캔버스</option>
							<option value="">스니커즈</option>
							<option value="">운동화</option>
							<option value="">샌들</option>
							<option value="">슬리퍼</option>
						</select>
						<select name="small_man" id=small_man>
							<option value="">::소분류::</option>
							<option value="">남성 캐주얼화</option>
							<option value="">남성 로퍼</option>
							<option value="">남성 부츠/워커</option>
							<option value="">남성 정장화</option>
							<option value="">남성 샌들/슬리퍼</option>
						</select>
						<select name="small_woman" id=small_woman>
							<option value="">::소분류::</option>
							<option value="">단화/플랫</option>
							<option value="">로퍼</option>
							<option value="">힐</option>
							<option value="">샌들/슬리퍼</option>
							<option value="">부츠/워커</option>
							<option value="">스니커즈</option>
						</select>
						<select name="small_kids" id=small_kids>
							<option value="">::소분류::</option>
							<option value="">아동 스니커즈</option>
							<option value="">아동 운동화</option>
							<option value="">아동 플랫슈즈/구두</option>
							<option value="">아동 슬리퍼/실내화</option>
							<option value="">아동 샌들</option>
							<option value="">아동 부츠</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>재고여부</th>
					<td>
						<select name="stock">
							<option value="">::재고상태::</option>
							<option value="">오름차순</option>
							<option value="">내림차순</option>
						</select>
					</td>
				</tr>
			</table>
			<input type="button" value="검색하기" class="button" onclick="search()">
		</form>
		<div class="total">총 상품 수 :${fn:length(prodAll)}</div>
		<table class="product_show">
			<tr>
				<th width=65><input type="checkbox" class="checkbox" id="all_check"></th>
				<th width=200>상품이미지</th>
				<th width=370>상품명</th>
				<th width=200>상품가격</th>
				<th>기능</th>
			</tr>
			<c:forEach var="prodlist" items="${prodAll}">
				<tr>
					<td><input type="checkbox" class="checkbox" name="check"></td>
					<td><img src="${prodlist.prod_main_imgpath }"></td>
					<td><a href="prodone.do?prod_name=${prodlist.prod_name}">${prodlist.prod_name}</a></td>
					<td>${prodlist.prod_price}원</td>
					<td><a href="proddelete.do?prod_name=${prodlist.prod_name}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td><button class="button">선택삭제</button></td>
				<td><a href="<%=request.getContextPath()%>/insertview.do"><input type="button" value="상품등록"></a></td>
				<td><a href="adminhome.do"><input type="button" value="관리자홈"></a></td>
			</tr>
		</table>
	</section>
</body>
</html>