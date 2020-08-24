<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슈즈팩토리</title>
<style>
	#table-set{
		max-width: 1200px;
		margin : 0 auto;
		margin-top: 160px;
		width:1200px;
		height:400px;
		padding: 20px 20px;
		border-spacing:10px;
		border-top-width:thin;
		border-bottom:solid;
		border-bottom-width:thin;
		align:center;
	}
	#td-set1{
		width:800px;
		align:center;
	}
	#td-set2{
		width:400px;
		align:center;
	}
	.right-login {
		float: left;
	}
	.left-login {
		float: left;
		margin: 0px 50px;
	}
	.tablinks {
		margin: 15px -3px;
		width: 500px;
		height: 40px;
		background-color: lightgray;
		border: none;
		color : white;
		font-size: 13pt;
	}
	.tablinks.active {
		background-color: gray;
		border: none;
		color : white;
	}
	#button{
		border:0;
		margin-top:20px;
		margin-right:10px;
		width:250px;
		height:50px;
		font-size:20px;
		text-align:center;
		border-radius:10px;
		font-family:sans-serif;
		background-color: #C8C8C8;
		
	}
	#button-plus{
		 font-size:20px; 
		 border:none; 
		 background:none;
	}
	#button-minus{
		font-size:24px; 
		border:none; 
		background:none;
	}
	#numBox{
		font-size:20px;
		width:30px;
		text-align:center;
	}
	#thumbs {
		padding-top: 10px; overflow: hidden;
	}
	#largeImage {
  		border: 1px solid gray;
 		padding: 4px;
  		background-color: white;
 		cursor: pointer;
 		width:500px;
 		height:300px;
	}
	#thumbs img {
  		border: 1px solid gray;
 		padding: 4px;
  		background-color: white;
 		cursor: pointer;
 		float: none;
 	 	margin-right: 6px;
 	 	width:100px;
 		height:80px;
	}
	#description {
  		background: black;
   		color: white;
   		position: absolute;
  		bottom: 0;
 		padding: 10px 20px;
   		width: 525px;
   		margin: 5px;
	}
	#panel {
    	position: relative;
	}
	#tab1 img{
 		padding: 4px;
  		background-color: white;
 		cursor: pointer;
 		float: none;
 	 	margin-right: 6px;
 	 	width:600px;
 		height:400px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function updatetotal(amount){
		var update_amount = amount;
		var update_price = '${product.prod_price}';
		if(amount>=1){			
			document.getElementById('sum').value=update_amount*update_price;	
		}
		
	}
	
	
	
	function openTab(evt, tabName) {
		var i, tabcontent, tablinks;
		
		tabcontent = document.getElementsByClassName("tabcontent"); //컨텐츠 불러옴
		for(i=0; i<tabcontent.length; i++) {
			tabcontent[i].style.display = "none"; //컨텐츠 모두 숨김
		}
		tablinks = document.getElementsByClassName("tablinks"); //탭 불러옴
		for(i=0; i<tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active",""); //탭 초기화
		}
		document.getElementById(tabName).style.display = "block"; //해당되는 컨텐츠만 보여줌
		evt.currentTarget.className += " active"; //클릭한 탭 활성화
	}
	
	$(function() {
		$('#thumbs img').click(function(){
		    $('#largeImage').attr('src',$(this).attr('src').replace('thumb','large'));
		    $('#description').html($(this).attr('alt'));
		});
	});
	$(function(){ 
		  $('.bt_up').click(function(){ 
		    var n = $('.bt_up').index(this);
		    var num = $(".num:eq("+n+")").val();
		    num = $(".num:eq("+n+")").val(num*1+1);
		    var amount = document.getElementById('numBox').value;
		    updatetotal(amount);
		

		  });
		  $('.bt_down').click(function(){ 
		    var n = $('.bt_down').index(this);
		    var num = $(".num:eq("+n+")").val();
		    if(num>=2){
		    	num = $(".num:eq("+n+")").val(num*1-1); 	
		    }
		    
		    
		    var amount = document.getElementById('numBox').value;
		    updatetotal(amount);
		  });
		});
	
	
</script>
</head>
<body>
	<table id="table-set">
		<tr>
			<td id="td-set1" align="center">
				<div id="gallery">
 					<div id="panel">
 						<img id="largeImage" src="${product.prod_main_imgpath}" />
  					</div>
  					<div id="thumbs">
  						<c:forTokens items="${product.prod_thumb_imgpath}" delims="|" var="imgs">
  						<img src="${imgs}" alt="이미지가 업습니다" />
        				</c:forTokens>
  					</div>
				</div>
			</td>
			<td><td id="td-set2">
				<div>
					<h1>${product.prod_name}</h1>
					<hr size=2 border=2 width=500>
					<table>
					<tr>
							<td width="150"><h3>카드혜택</h3></td>
							<td><h3>무이자 할부</h3></td>
						</tr>
						<tr>
							<td width="150"><h3>배송비</h3></td>
							<td><h3>무료</h3></td>
						</tr>
						<tr>
							<td width="150"><h3>사이즈</h3></td>
							<td>
								<select  id="selection"style="width:150px;height:30px;">
									<option value="230">230</option>
									<option value="240">240</option>
									<option value="250">250</option>
									<option value="260">260</option>
									<option value="270">270</option>
									<option value="280">280</option>
									<option value="290">290</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><h3>수량</h3></td>
							<td>
 								<button type="button" id="button-minus" class="bt_down">-</button>
 								<input type="text" class="num" id="numBox" value="${product.prod_amount }">
 								<button type="button" id="button-plus" class="bt_up">+</button>
 						
 							</td>
						</tr>
						<tr>
							<td><h3>가격</h3>
						
							<td>${product.prod_price}원</td>
						</tr>
						<tr>
							<td>								
								<button id="button" onclick="confirmCart()">장바구니</button>
								<script>
								function confirmCart(){
									var selectOption = document.getElementById('selection');
									selectOprion = selectOption.options[selectOption.selectedIndex].value;
									
									
									var amount = document.getElementById('numBox').value;
									
									var price = "${product.prod_price}";
									
									var img = "${product.prod_main_imgpath}";
									
									
									var pname = new String("${product.prod_name}");
									
									var result = confirm("장바구니에 추가 하시겠습니까?");
									if(result){
										window.location.href="AddCart.do?cart_product_name="+pname+"&"
													+"cart_product_amount="+amount+"&"
													+"cart_product_size="+selectOprion+"&"
													+"cart_product_price="+price+"&"
													+"cart_product_mainimg="+img;
													
									}
									else{
										alert("취소하였습니다!");
									}
								}
								</script>
							</td>
							<td>
								<button id="button" onclick="confirmPay()">구매하기</button>
								<script>
								function confirmPay(){
									var selectOption = document.getElementById('selection');
									selectOprion = selectOption.options[selectOption.selectedIndex].value;
									
									
									var amount = document.getElementById('numBox').value;
									
									var price = "${product.prod_price}";
									
									var img = "${product.prod_main_imgpath}";
									
									
									var pname = new String("${product.prod_name}");
						
									window.location.href="directpay.do?his_name="+pname+"&"
													+"his_amount="+amount+"&"
													+"his_size="+selectOprion+"&"
													+"his_price="+price+"&"
													+"his_imgpath="+img;
									
								}
								</script>
							</td>
						</tr>
						<tr>
							<td> <h3>합계 :</h3></td>
							<td> <input type="text" id="sum" class="sum" value="${product.prod_price}" style="border:none">원</td>  
						</tr>
					</table>
				</div>
			</td>
		</tr>

	</table>
	<table align="center">
		<tr>
			<td>
				<section>
					<div class="left-login">
						<div class="tab">
							<button class="tablinks active" onclick="openTab(event, 'tab1')">상품 정보</button>
							<button class="tablinks" onclick="openTab(event, 'tab2')">구매 후기</button>
						</div>
					</div>
				</section>
			</td>
		</tr>
		<tr align="center">
			<td>
				<div id="tab1" class="tabcontent" style="display:block;">
					<%-- <c:forTokens items="${product.prod_sub_imgpath}" delims="|" var="imgs">
  						<img src="${imgs}"/><br>
        				</c:forTokens> --%>
        				${product.prod_sub_imgpath}
				</div>
			</td>
		</tr>
		<tr align="center">
			<td>
				<div id="tab2" class="tabcontent" style="display:none;">
										
				</div>
			</td>
		</tr>
		
	</table>

</body>
<%@ include file="../floating.jsp" %>
</html>