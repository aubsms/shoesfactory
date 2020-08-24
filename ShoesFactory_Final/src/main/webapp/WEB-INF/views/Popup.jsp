<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onunload=function(){
	kajaCookie(); 
}
   function kajaCookie() {  
	   if(document.f1.chk1.checked==true) {  
		  
		   var oneul1= new Date() 
		   oneul1.setDate(oneul1.getDate()+1)
		   document.cookie = "annaeCookie=kongji1;expires=" 
		 
		   +oneul1.toUTCString() 
		   
	   } 
   }

</script>
<style>
.btn2 {
  align="center";
  width: 180px;
  height: 50px;
  font-size:20px;
  font-family: 'Nanum Gothic';
  color: white;
  line-height: 50px;
  text-align: center;
  background: gray;
  border: solid 2px grey;
  border-radius: 12px;
}
.pop1 {
  text-align: center;
  font-size:20pt;
  color: white;
}
.pop2 {
  text-align: center;
  font-size:10pt;
  color: white;
}
.pop3{
  color:white;
}
.pop4{
 text-align: center; 
 pont-size:15pt;
 color: white;
}

</style>
</head>
<body bgcolor="#585858">
<p class="pop1">비밀번호 변경하면 적립금 2000원!</p>
<p class="pop2">
대상 : 이벤트 기간 내 비밀번호 변경하시는 모든 고객
</p>
<p class="pop4">
기간 : 3/1 ~ 3/31
</p>
<div align="center"><input class="btn2" type="button" onclick="MypageForm.jsp" value="변경하러가기"></div>
<hr>

<form class="pop3" name="f1">
 <input type="checkbox" name="chk1">
  지금부터 하루동안 이 창을 띄우지 않습니다
</form>


</body>
</html>