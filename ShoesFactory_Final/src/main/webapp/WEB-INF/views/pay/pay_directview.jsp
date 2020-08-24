<%@page import="com.shoesfactory.DAOVO.cart.cartVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
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
.cap{
 text-align:left;
 font-size:25pt;
 margin-bottom:30px;
}


.table1{
 margin-top:150px;
 margin-left:auto;
 margin-right:auto;
 width:70%;
 
}
 .order_tr{
background-color:#D8D8D8;
height:35px;
font-weight:bold;
font-size:20;
}
.btn {
width:100px;
height:50px;
background-color:#D8D8D8;
}
.cap{
 text-align:left;
 font-size:25pt;
 margin-bottom:30px;
}
.table1{
 style:width:70%;
 margin-left:auto;
 margin-right:auto;
 margin-top:100px;
}
input[type=text] {
	text-align: center;
	width: 100%;
}
.total{
font-size:15pt;
font-weight:bold;
}
</style>
<%

  request.getAttribute("direct_List");

%>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">


function payment(){

	var IMP = window.IMP;
	IMP.init('imp85655982');
	IMP.request_pay({
		pg : 'html5_inicis',
		pay_method:'card',
		merchant_uid:'merchant_'+new Date().getTime(),
		name:'주문명:결제테스트',
		amount:100,
		buyer_email:'',
		buyer_name:'',
		buyer_tel:'',
		buyer_addr:'',
		buyer_postcode:'',
		m_redirect_url:'/payEnd.purchase'
		},function(rsp){
			if(rsp.success){
				
					var msg = '결제가 완료되었습니다.';
					msg+='고유ID:'+rsp.imp_uid;
					msg+='상점 거래ID:'+rsp.merchant_uid;
					msg+='결제금액:'+rsp.paid_amount;
					msg+='카드 승인번호:'+rsp.apply_num;
					alert(msg);
					location.href="payEnd.purchase";
					
			}else{
				var msg='결제에 실패하였습니다';
				msg+='에러내용'+rsp.error_msg;
			}	
		});
}


function redirecthome(){
	location.href="shoesfactory_home.do";
}
</script>

</head>

<body>

<table class="table1" action="confirm.purchase">
  <caption class="cap">주문서 작성</caption>
     <Tr class="order_tr">
          <th style="width:20%">이미지</th><th style="width:15%">상품명</th><th style="width:10%">사이즈</th><th style="width:5%">수량</th><th style="width:10%">상품금액</th>
     </Tr>
     
     
     <tr style="text-align: center;">
          <td><img src="${direct_List.his_imgpath }" width="100" height="100"><br></td>
          <td><input style="border:none" type="text" name="his_name" value="${direct_List.his_name}"></td>
          <td><input style="border:none" type="text" name="his_size" value="${direct_List.his_size }"></td>
		  <td><input style="border:none" type="text" name="his_price" value="${direct_List.his_price}"></td>
		  <td><input style="border:none" type="text" name="his_amount" value="${direct_List.his_amount }"></td>
			  <%-- <input type="hidden" name="his_num" value="${direct_List.his_rnum }"> --%>
     </tr>
     <tr>
		<td colspan="4" class="total" align="right"><label id="tot" style="margin-right:100px;">총 금액:</label>
		<td><input style="border:none" readonly="readonly" type="text" name="total_price" value="${direct_List.his_price}"></td>
	</tr>
    
     <tr class="order_tr"><td colspan="5">주문자정보</td></tr>
     <tr>
     	
     </tr>
     <tr class="order_tr"><td colspan="5">배송정보</td></tr>
     <tr></tr>
     <tr class="order_tr"><td colspan="5">결제예정금액</td></tr>
     <tr></tr>
     <tr class="order_tr"><td colspan="5">결제수단</td></tr>
     <tr><td colspan="5"><input type="radio" name="pay1">카드결제
                         <input type="radio" name="pay2">무통장입금
                         <input type="radio" name="pay3">카카오페이
                         <input type="radio" name="pay4">SAMSUNG PAY
     </td></tr>
     
</table>
<br><br><br>
<table class="table1">
<tr align="center"><td colspan="5"><input type="button" class="btn" value="결제하기" onclick="payment()">
                                   <input type="button" class="btn" value="취소" onclick="redirecthome()">
     </td>
</tr>
</table>
</body>
</html>