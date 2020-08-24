<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src ="https://ajax.googleapis.com.ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


$(function () {
	var inval_Arr = new Array(3).fill(false);
	var nmpwj = 0;
	var nmpw2j = 0;
	var nmtelj = 0;

	
	
	

$("#nonmem_pw").keyup(function (){
	var pw = $("#nonmem_pw").val(); 
	var num = pw.search(/[0-9]/g); 
	var eng = pw.search(/[a-z]/ig); 
	var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
	var regExp = /\s/g;
		
	if($("#nonmem_pw").val() == "") {
		   $("#pw_check").css("color","red").css("font-size","12px");
		   $("#pw_check").html("필수입력사항입니다.");
		   nmpwj=0;
	 }
	else if(pw.match(regExp)){
		 $("#pw_check").css("color","red").css("font-size","12px");
		 $("#pw_check").html("공백은 사용하실 수 없습니다.");
		 nmpwj=0;
	 }
	else if(pw.length < 8 || pw.length > 20){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("8자~20자 이내로 입력하세요.");	
	    nmpwj=0;
    }
	else if(pw.search(/\s/) != -1){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("공백없이 입력하세요.");
	   nmpwj=0;
	}
	else if(num < 0 || eng < 0 || spe < 0 ){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("영문,숫자,특수문자를 혼합하여 입력하세요.");
	    nmpwj=0;
	}
	else {
		$("#pw_check").css("color","green").css("font-size","12px");
	    $("#pw_check").html("사용가능합니다.");
	    nmpwj=1;
	}
});
$("#nonmem_pw2").keyup(function (){
	
	var pw = $("#nonmem_pw").val(); 
	var pw2 = $("#nonmem_pw2").val(); 
	if(pw != pw2){
		$("#pw2_check").css("color","red").css("font-size","12px");
	    $("#pw2_check").html("비밀번호와 일치하지 않습니다.");
	    nmpw2j=0;
	}
	else{
		$("#pw2_check").css("color","green").css("font-size","12px");
	    $("#pw2_check").html("일치합니다.");
	    nmpw2j=1;
	}
	
});
$("#nonmem_tel").keyup(function (){
	
	var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	var tel = $("#nonmem_tel").val().replace(/-/gi,'');
	var regExp1 = /\s/g;
	
	if(tel.length==11 || tel.length==10) {
		if(regExp_ctn.test(tel)){
			 tel = tel.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
             $(this).val(tel);
             
             
             $.ajax({

 				type: 'POST',  

 				url: './NonmemTelCheck.do', 

 				data: {nonmem_tel: tel},  

 				success: function(result){  

 					if(result == '1'){ 
 						$("#nonmemtel_check").css("color","red").css("font-size","12px");
 					    $("#nonmemtel_check").html("이미 사용중인 전화번호입니다.");
 						   nmtelj=0;
 						 
 						
 					   
 					} else {
 							$("#nonmemtel_check").css("color","green").css("font-size","12px");
 							 $("#nonmemtel_check").html("사용가능한 전화번호입니다.");
 							nmtelj=1; 
 					}

 		
 				} 
 	      
 			})
             
             
             
             
           
		}
	}
	else if(tel.match(regExp1)){
			 $("#nonmemtel_check").css("color","red").css("font-size","12px");
			 $("#nonmemtel_check").html("공백은 사용하실 수 없습니다.");
			 nmtelj=0;
		}
	else if($("#nonmem_tel").val() == "") {
		   $("#nonmemtel_check").css("color","red").css("font-size","12px");
		   $("#nonmemtel_check").html("필수입력사항입니다.");
		   nmtelj=0;
	 }
	
		else {
			$("#nonmemtel_check").css("color","red").css("font-size","12px");
			 $("#nonmemtel_check").html("유효한 전화번호가 아닙니다.");
			 nmtelj=0;
			
			
		}
	
	
	
	
});

$("#reg_submit").click(function(){
	
	if (nmtelj == 1) {
		
		inval_Arr[0] = true;
	} else {
		inval_Arr[1] = false;
	}
	
	
	
	
	if (nmpwj == 1){
		
		inval_Arr[1] = true;
	} else {
		inval_Arr[1] = false;
	}
	
	if (nmpw2j == 1) {
		
		inval_Arr[2] = true;
	} else {
		inval_Arr[2] = false;
	}

	
	
   
    
    
	var validAll = true;
	for(var i = 0; i < inval_Arr.length; i++){
		
		if(inval_Arr[i] == false){
			validAll = false;
		}
	}
	
	if(validAll){ 
		
		sub();
		
	} else{
		alert('입력한 정보들을 다시 한번 확인해주세요.')
		
	}


	
});





function sub() {

	var form = document.getElementById('nmsignupform');

	form.submit();


}




});
</script>





<style>
select {
  width: 80px;
  padding: .8em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}

select::-ms-expand {
  display: none;
}
.btn {
width:80px;
height:40px;
background-color:#D8D8D8;
}
.join_form {
height:37px;
}
.join_ctr{
height:60px;
}
.cap{
 text-align:center;
 font-size:25pt;
 margin-bottom:30px;
}
.table1{
 margin-left:auto;
 margin-right:auto;
 margin-top:50px;
 border:0;
}
.table3{
 margin-left:auto;
 margin-right:auto;
 border:0;
}
</style>

</head>
<body>
<form name="form1" action="nmsignup.do" id="nmsignupform" method="post">
<table class="table1">
<caption class="cap">비회원 정보입력</caption>

<tr class="join_ctr">
<td><label>전화번호</label></td>
<td><input class="join_form" type="text" id="nonmem_tel" name="nonmem_tel" required="required"></td>
</tr>
<tr><td></td><td id="nonmemtel_check"></td></tr>

<tr class="join_ctr"><td><label>비밀번호</label></td>
<td><input class="join_form" type="password" id="nonmem_pw" name="nonmem_pw" required="required"></td>
</tr>
<tr><td></td><td id="pw_check"></td></tr>
<tr class="join_ctr"><td><label>비밀번호확인</label></td>
<td><input class="join_form" type="password" id="nonmem_pw2" name="nonmem_pw2"></td>
</tr>
<tr><td></td><td id="pw2_check"></td></tr>
</table>
<table class="table3">
<tr>
<td>
<input class="btn" type="button" id="reg_submit" name="registerbtn"  value="정보입력">
<input class="btn" type="button" onClick="location.href='index.jsp'; return false;" name="resetbtn" value="취소">
</td>
</tr>
</table>

</form>
</body>
<%@ include file="../footer.jsp"%>
</html>