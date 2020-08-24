<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

</head>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src ="https://ajax.googleapis.com.ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {


	
$("#mem_tel").keyup(function (){
	var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	var tel = $("#mem_tel").val().replace(/-/gi,'');
		
	
	if(tel.length==11 || tel.length==10) {
	if(regExp_ctn.test(tel)){
	tel = tel.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
    $(this).val(tel);
			}
		}
	});
	
$("#mem_tel2").keyup(function (){
	var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	var tel2 = $("#mem_tel2").val().replace(/-/gi,'');
		
	
	if(tel2.length==11 || tel2.length==10) {
	if(regExp_ctn.test(tel2)){
			 tel2 = tel2.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
             $(this).val(tel2);
			}
		}
	});
	
$("#findID_submit").click(function(){
sub();
});	

$("#findPW_submit").click(function(){
sub2();
});


function sub() {

	var form = document.getElementById('findIDform');

	form.submit();
	

}

function sub2() {

	var form2 = document.getElementById('findPWform');

	form2.submit();


}
	
	

});



</script>




<body>
	
	
		
			<form id="findIDform" name="findIDform" action="findID.do">
			<table class="table1">
			<caption class="cap">아이디 찾기</caption>
			<tr class="join_ctr">
			<td><label>회원님의 전화번호를 입력하세요</label></td>
			<td><input class="join_form" type="text" name="mem_tel" id="mem_tel" ></td></tr>
			<tr><td><input class="join_form"type="button" id="findID_submit" name="findID_btn" value="아이디 찾기"/></td></tr>
			</table>
			</form>
			<br><br><br><br>
			
			
			<form id="findPWform" name="findPWform" action = "findPW.do" method="post">
			<table class="table1">
			<caption class="cap">비밀번호 찾기</caption>
			<tr class="join_ctr">
			<td><label>회원님의 ID를 입력하세요</label></td>
			<td><input class="join_form" type="text" name="mem_id" id="mem_id" ></td></tr>
			<tr class="join_ctr">
			<td><label>회원님의 전화번호를 입력하세요</label></td>
			<td><input class="join_form" type="text" name="mem_tel2" id="mem_tel2" ></td></tr>
			<tr><td><input type="button" id="findPW_submit" name="findPW_btn" value="비밀번호 찾기"/></td></tr>
			</table>
			</form>


			
			
			
		
</body>
<%@ include file="../footer.jsp"%>		
</html>