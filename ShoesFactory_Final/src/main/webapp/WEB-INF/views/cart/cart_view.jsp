<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script language='javascript'>
function form_btn(n){
	var count = document.getElementById("count"); 
	count_val = parseInt(count.value); 
	count_val += n; 
	count.value = count_val; 
	if(count_val <= 0){
	   count.value = 1;   
	}
	}
	
/* amount업 */
function upamount(amount,price){
	sessionStorage.removeItem("amount"+usernum);
	alert(amount.value)
	var num = amount.value;
	var num2 = price.value;
	var oneprice = num2/num;
	num ++;
	alert(num);
	amount.value=num;
	alert(oneprice);
	price.value=num*oneprice;
	var usernum = sessionStorage.getItem("usernum");
	var pupdate = price.value;

	var json={
		"amount":num,
		"price":pupdate
	};
	alert(json.amount);
	alert(json.price);
	alert("up");
}

/* amount다운 */
function downamount(amount,price){
	sessionStorage.removeItem("amount"+usernum);
	alert(amount.value)
	var num = amount.value;
	var num2 = price.value;
	var oneprice = num2/num;
	num --;
	alert(num);
	amount.value=num;
	alert(oneprice);
	price.value=num*oneprice;
	var usernum = sessionStorage.getItem("usernum");
	var pupdate = price.value;

	var json={
		"amount":num,
		"price":pupdate
	};
	alert(json.amount);
	alert(json.price);
	alert("down");
}

/* amount수정 */
function updateamount(pnum,pname,psize,amount,price,img){
		alert("여기!!!");
		var usernum = pnum.value;
		a
		var name = pname.value;
		
		var size = psize.value;
		
		var uamount = amount.value;
		var uprice = price.value;
		var mainimg = img.value;
		var obj = new Object();
		var obj = {
			"usernum":usernum,
			"pname":name,
			"amount":uamount,
			"psize":size,
			"price":uprice,
			"img":mainimg
		}
		var jsonData = JSON.stringify(obj);
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "/UpdateProduct.do",
			data : {
				json : jsonData
			},
			
			success : function(data){
				alert("success");
			},
			 complete : function(data) {

                 alert("반은성공...?");
           	},			
			error : function(e){
				alert(e.value);
				alert("에러!");
			}
		});
}

/* 카트전체선택 */
 function cartallproduct(){
	if($("#allcheck").is(':checked')){
		$("input[type=checkbox]").prop("checked",true);
		
	}
	else
		$("input[type=checkbox]").prop("checked",false);
		
} 

/* 카트선택구매 */
function cartselectpurchase(){
	/* sessionStorage.removeItem(usernum); */
	var checklength = $("input[name=checkone]").length;
	var list = new Array();
		
		$('input[name=checkone]:checked').each(function(){
			
			list.push($(this).val());
			alert($(this).val());
		})

	
	 var carobj = new Object();
		var cartobj = {
			"plist":list
		}
		var CartData = JSON.stringify(cartobj);
		$.ajax({
			type : "GET",
			/* dataType : "json", */
			/* async:false, */
			url : "/ListParser.do",
			data : {
				cart : CartData
			},
			
			success : function(data){
				location.href="/Purchase.purchase";
				
			},
						
			error : function(e){
				alert("에러!");
			},
			
			complete : function(data){
				location.replace();
			}
			
		});  
	
function purchaselocation(){
	location.href="/Purchase.purchase";
}
	
}
	 
		
 </script>
 <style>
 *{
		margin: 0;
		padding: 0;
	}
 h1 {
 	text-align: center;
		margin-top: 100px;
 }
section {
 	width: 1050px;
 	margin-left: auto;
 	margin-right: auto;
 }
 a {text-decoration: none;}
a:visited {text-decoration: none;} /* 방문했던 링크 */
a:focus {text-decoration: none;} /* 요소에 초점이 맞춰질 때 */
a:hover, a:active {text-decoration: none;} /* 클릭시 */
 .order_tr{
background-color:#D8D8D8;
height:35px;
font-weight:bold;
font-size:20;
}
 
.count_btn1{
background-color:#D8D8D8;
height:22px;
width:25px;
margin-right:-5px;
} 
.count_btn2{
background-color:#D8D8D8;
height:22px;
width:25px;
margin-left:-5px;
} 
.mbtn {
width:50px;
height:35px;
background-color:#D8D8D8;
}
.btn {
width:150px;
height:40px;
background-color:#D8D8D8;

}
.total{
font-size:15pt;
font-weight:bold;
}
.table1{
 text-align:center;
 margin-left:auto;
 margin-right:auto;
 
}
.cap{
 text-align:left;
 font-size:25pt;
}
.home {
	height: 50px;
	width: 120px;
	background-color: lightgray;
	border: none;
	font-size: 20px;
	margin: 50px 0px;
}
input[type=text] {
	text-align: center;
	width: 100%;
}
 </style>
</head>
<body>
<section>
<c:set var="test" value="${cartinfo }"/>
	<c:choose>
	<c:when test="${!empty test}">          
<form action="CartAllpurchase.do">
<h1 class="cap">장바구니</h1>
<table class="table1">
<tr class="order_tr">
          <th style="width:3%"></th> <th style="width:20%">이미지</th><th style="width:15%">상품명</th>
          <th style="width:10%">사이즈</th><th style="width:5%">수량</th><th style="width:10%">상품금액</th>
          <th style="width:5%"></th>
     </tr>
<c:forEach var="mycartinfo" items="${cartinfo }" varStatus="status">   
     <tr>
          <td><input type="checkbox" name="checkone" value="${mycartinfo.cart_product_name }"></td>
          <td><img src="${mycartinfo.cart_product_mainimg }" width="200" height="150"><br></td>
          <td><input style="border:none" readonly="readonly" type="text" name="update_product_name${status.index }" value="${mycartinfo.cart_product_name }" >
				<input type="hidden" name="cart_product_name" value="${mycartinfo.cart_product_name }" ></td>
          <td><input style="border:none" readonly="readonly" type="text" name="update_product_size${status.index }" value="${mycartinfo.cart_product_size }">
				<input type="hidden"  name="cart_product_size" value="${mycartinfo.cart_product_size }"></td>
          <td>
          		<div>
                  <a href="#"><img name="up" src="./images/61148.png" width="10px" height="10px" onclick="upamount(update_amount${status.index },update_price${status.index })"></a>
                </div>
         		<input style="border:none" readonly="readonly" type="text" name="update_amount${status.index }" value="${mycartinfo.cart_product_amount }">
				<input type="hidden" name="cart_product_amount" value="${mycartinfo.cart_product_amount }">
				<div>
                  <a href="#"><img name="down" src="./images/60995.png" width="10px" height="10px" onclick="downamount(update_amount${status.index },update_price${status.index })"></a>
                </div>
          </td>
          <td>
            <input type="hidden" name="cart_product_price" value="${mycartinfo.cart_product_price}">
          	  <input style="border:none" readonly="readonly" type="text" name="update_price${status.index }" value="${mycartinfo.cart_product_price * mycartinfo.cart_product_amount }" id="count" class="num" size="1"/>
            
          </td>
            <td><a href="DeleteProduct.do?cart_usernum=${sloginNum }&cart_product_name=${mycartinfo.cart_product_name}	
			&cart_product_amount=${mycartinfo.cart_product_amount}&cart_product_size=${mycartinfo.cart_product_size}
			&cart_product_price=${mycartinfo.cart_product_price}"><input class="mbtn" type="button" id="delete" value="삭제"></a></td>
            
     </tr>
     </c:forEach>
       <br><br><br><br>
     <tr><td colspan="6" class="total" align="right"><label id="tot" style="margin-right:100px;">총 금액:100원</label>
</table>
<br><br><br><br><br>
<table border="0" class="table1">
<tr><td><input type="submit" class="btn" value="전체상품 주문"><input type="button" class="btn" value="선택상품  주문" onclick="cartselectpurchase()"></td></tr>
</table>
</form>
</c:when>
	<c:otherwise>
	<h1>장바구니가 비어있습니다</h1>
	<br>
	<br>
	<br>
	<div align="center"><button class="home"><a href="shoesfactory_home.do">홈으로</a></button></div>
	</c:otherwise>
	</c:choose>



</section>
</body>
</html>