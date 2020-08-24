<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
#homeup{
	display:block; 
	width: 37px; 
	height: 30px;
	background-image:url(./resources/image/up.png); 
	background-repeat:no-repeat; 
}
#homeup:hover{	
	opacity: 0.4;
}
#homedown{
	display:block; 
	width: 37px; 
	height: 30px; 
	background-image:url(./resources/image/down.png); 	
	background-repeat:no-repeat; 
}
#homedown:hover{	
	opacity: 0.4;
}
#mypage{
	display:block;
	width: 72px;
	height: 72px;
	background-image:url(./resources/image/mypage.png);		
	background-repeat:no-repeat;
}
#cart{
display:block;
	width: 72px;
	height: 72px;
	background-image:url(./resources/image/cart.png);		
	background-repeat:no-repeat;
}

</style>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table  id="floating_menu" style="position:fixed; top:30%; left:90%;">
    	<tr>
        	<td>
            	<a id="homeup" href="#top"></a>
            </td>
        	<td>
            	<a id="homedown" href="#footer"></a>
            </td>          
        </tr>
    	<tr>
        	<td colspan="2" align="center">
			<div style ="padding:10px;">
				<a id="mypage" href="footer.jsp"></a>
			</div>
			</td>
		</tr>   
		<tr>
        	<td colspan="2" align="center">
			<div>
			<a id="cart" href="footer.jsp"></a>
			</div>
			</td>
		</tr>   
</table>

</body>

</html>