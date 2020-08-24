<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 화면</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">

$(function () {
	var inval_Arr = new Array(7).fill(false);
	var pwj = 0;
	var pw2j = 0;
	var telj = 1;
	var emailj = 1;

$("#mem_pw").keyup(function (){
	var pw = $("#mem_pw").val(); 
	var num = pw.search(/[0-9]/g); 
	var eng = pw.search(/[a-z]/ig); 
	var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
	var regExp = /\s/g;
		
	if($("#mem_pw").val() == "") {
		   $("#pw_check").css("color","red").css("font-size","12px");
		   $("#pw_check").html("필수입력사항입니다.");
		   pwj = 0;
	 }
	else if(pw.match(regExp)){
		 $("#pw_check").css("color","red").css("font-size","12px");
		 $("#pw_check").html("공백은 사용하실 수 없습니다.");
		 pwj = 0;
	 }
	else if(pw.length < 8 || pw.length > 20){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("8자~20자 이내로 입력하세요.");	
	    pwj = 0;
    }
	else if(pw.search(/\s/) != -1){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("공백없이 입력하세요.");
	    pwj = 0;
	}
	else if(num < 0 || eng < 0 || spe < 0 ){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("영문,숫자,특수문자를 혼합하여 입력하세요.");
	    pwj = 0;
	}
	else {
		$("#pw_check").css("color","green").css("font-size","12px");
	    $("#pw_check").html("사용가능합니다.");
	    pwj = 1;
	}
});
$("#mem_pw2").keyup(function (){
	
	var pw = $("#mem_pw").val(); 
	var pw2 = $("#mem_pw2").val(); 
	if(pw != pw2){
		$("#pw2_check").css("color","red").css("font-size","12px");
	    $("#pw2_check").html("비밀번호와 일치하지 않습니다.");
	    pw2j=0;
	}
	else{
		$("#pw2_check").css("color","green").css("font-size","12px");
	    $("#pw2_check").html("일치합니다.");
	    pw2j=1;
	}
	
	});
	
$("#mem_tel").keyup(function (){
	
	var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	var tel = $("#mem_tel").val().replace(/-/gi,'');
	var regExp1 = /\s/g;
	
	if(tel.length==11 || tel.length==10) {
		if(regExp_ctn.test(tel)){
			 tel = tel.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
             $(this).val(tel);
             
             
             $.ajax({

 				type: 'POST',  

 				url: './TelCheck.do', 

 				data: {mem_tel: tel},  

 				success: function(result){  

 					if(result == '1'){ 
 						$("#tel_check").css("color","red").css("font-size","12px");
 					    $("#tel_check").html("이미 사용중인 전화번호입니다.");
 						   telj=0;
 						 
 						
 					   
 					} else {
 							$("#tel_check").css("color","green").css("font-size","12px");
 							 $("#tel_check").html("사용가능한 전화번호입니다.");
 							telj=1; 
 					}

 		
 				} 
 	      
 			})
             
             
             
             
           
		}
	}
	else if(tel.match(regExp1)){
			 $("#tel_check").css("color","red").css("font-size","12px");
			 $("#tel_check").html("공백은 사용하실 수 없습니다.");
			 telj=0;
		}
	else if($("#mem_tel").val() == "") {
		   $("#tel_check").css("color","red").css("font-size","12px");
		   $("#tel_check").html("필수입력사항입니다.");
		   telj=0;
	 }
	
		else {
			$("#tel_check").css("color","red").css("font-size","12px");
			 $("#tel_check").html("유효한 전화번호가 아닙니다.");
			 telj=0;
			
			
		}
	
	
	
	
});
$("#mem_email").keyup(function (){
	 
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var email = $("#mem_email").val();
	var regExp1 = /\s/g;
	
	if($("#mem_email").val() == "") {
		   $("#email_check").css("color","red").css("font-size","12px");
		   $("#email_check").html("필수입력사항입니다.");
		   emailj=0;
	 }
	else if(email.match(regExp1)){
		 $("#email_check").css("color","red").css("font-size","12px");
		 $("#email_check").html("공백은 사용하실 수 없습니다.");
		 emailj=0;
	 }
	else if(!regExp.test(email)){
		 $("#email_check").css("color","red").css("font-size","12px");
	     $("#email_check").html("유효하지 않은 이메일 주소입니다.");
	     emailj=0;
	}
	else if($("#mem_email").val()==email){
	$("#email_check").css("color","green").css("font-size","12px");
	$("#email_check").html("사용가능한 이메일 주소입니다.");
	emailj=1;
	}
	else {
		
		
		$.ajax({

			type: 'POST',  

			url: './EmailCheck.do', 

			data: {mem_email: email},  

			success: function(result){  

				if(result == '1'){ 
					$("#email_check").css("color","red").css("font-size","12px");
				    $("#email_check").html("이미 사용중인 이메일 주소입니다.");
				    emailj=0;
					 
					
				   
				} else {
						$("#email_check").css("color","green").css("font-size","12px");
						 $("#email_check").html("사용가능한 이메일 주소입니다.");
						 emailj=1;
				}

	
			} 
      
		})
		
	}
	
});
	
$("#updateAccount_submit").click(function(){
if (pwj == 1){
		
		inval_Arr[0] = true;
	} else {
		inval_Arr[0] = false;
	}
	
	if (pw2j == 1) {
		
		inval_Arr[1] = true;
	} else {
		inval_Arr[1] = false;
	}
	
	if (telj == 1) {
		
		inval_Arr[2] = true;
	} else {
		inval_Arr[2] = false;
	}
	
    if (emailj == 1) {
		
		inval_Arr[3] = true;
	} else {
		inval_Arr[3] = false;
	}
	
	
	if ($("#mem_postnm").val() == "") {
    	
    	inval_Arr[4] = false;
        } else {
    	inval_Arr[4] = true;
        }
    
    if ($("#mem_addr").val() == "") {
    	
    	inval_Arr[5] = false;
        } else {
    	inval_Arr[5] = true;
        }
 
    if ($("#mem_dtaddr").val() == "") {
 	
 	    inval_Arr[6] = false;
        } else {
 	    inval_Arr[6] = true;
        }
	
	
    var validAll = true;
	for(var i = 0; i < inval_Arr.length; i++){
		
		if(inval_Arr[i] == false){
			validAll = false;
		}
	}
	
	if(validAll){ 
		
		sub();
		alert('회원정보 수정이 완료되었습니다.');
		
	} else{
		alert('입력한 정보들을 다시 한번 확인해주세요.')
		
	}
});

function sub() {
var form = document.getElementById('updateAccountform');
form.submit();


}



});


</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("mem_exaddr").value = extraAddr;
                
                } else {
                    document.getElementById("mem_exaddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_postnm').value = data.zonecode;
                document.getElementById("mem_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mem_dtaddr").focus();
            }
        }).open();
    }
</script>   


<style>
/* select {
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
} */
h1{
 text-align:center;
 margin:30px;
}
.btn {
width:90px;
height:40px;
background-color:#D8D8D8;
margin: 30px 10px;
}
.join_form {
height:25px;
width: 200px;
}
.join_ctr{
height:50px;
}
.table1{
	margin: 50px auto 10px auto;
 	border:0;
}
.table3{
 margin-left:auto;
 margin-right:auto;
 border:0;
}
</style>

<body>
<h1>회원정보 수정</h1>
<c:forEach var="myinfo1" items="${mMyInfo1}">
	<form action="updateAccount.do?mem_id=${myinfo1.mem_id}" id="updateAccountform" method="GET">
	<table class="table1">
		<tr class="join_ctr"><td width=120px>ID</td>
			<td><input class="join_form" type = "text" id="mem_id" name="mem_id" value="${myinfo1.mem_id}" readonly>
				<%-- <input type="hidden" name="mem_id" value="${myinfo1.mem_id}"> --%></td></tr>
		<tr class="join_ctr"><td>비밀번호</td>
			<td><input class="join_form" type = "password" id="mem_pw" name="mem_pw" required="required"></td></tr>
		<tr><td></td><td id="pw_check"></td></tr>
		<tr class="join_ctr"><td>비밀번호 확인</td>
			<td><input class="join_form" type = "password" id="mem_pw2" name="mem_pw2" required="required"></td></tr>
		<tr><td></td><td id="pw2_check"></td></tr>
		<tr class="join_ctr"><td>이름</td>
			<td><input class="join_form" type = "text" id="mem_name" name="mem_name" value="${myinfo1.mem_name}" readonly></td></tr>
		<tr class="join_ctr"><td>전화번호</td>
			<td><input class="join_form" type = "text" id="mem_tel" name="mem_tel" value="${myinfo1.mem_tel}" required="required"></td></tr>
		<tr><td></td><td id="tel_check"></td></tr>
		<tr class="join_ctr"><td>이메일주소</td>
			<td><input class="join_form" type = "text" id="mem_email" name="mem_email" value="${myinfo1.mem_email}" required="required"></td></tr>
		<tr><td></td><td id="email_check"></td></tr>
		<tr class="join_ctr"><td>우편번호</td>
			<td><input class="join_form" type = "text" id="mem_postnm" name="mem_postnm" value="${myinfo1.mem_postnm}" required="required"></td>
			<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
			</tr>
		<tr class="join_ctr"><td>주소</td>
			<td><input class="join_form" type = "text" id="mem_addr" name="mem_addr"  value="${myinfo1.mem_addr}" required="required"></td></tr>
		<tr class="join_ctr"><td>상세주소</td>
			<td><input class="join_form" type = "text" id="mem_dtaddr" name="mem_dtaddr"  value="${myinfo1.mem_dtaddr}" required="required"></td></tr>
		<tr class="join_ctr"><td>기타</td>
			<td><input class="join_form" type = "text" id="mem_exaddr" name="mem_exaddr" value="${myinfo1.mem_exaddr}" required="required"></td></tr>
		<tr class="join_ctr"><td>생년월일</td>
			<td><input class="join_form" type = "text" id="mem_dob" name="mem_dob" value="${myinfo1.mem_yy} 년 ${myinfo1.mem_mm} 월 ${myinfo1.mem_dd} 일" readonly></td></tr>
		<tr class="join_ctr"><td>관심항목</td>
			<td><input type = "checkbox" id="mem_interest" name="mem_interest" value="운동화">운동화
				<input type = "checkbox" id="mem_interest" name="mem_interest" value="구두">구두<br>
				<input type = "checkbox" id="mem_interest" name="mem_interest" value="캐주얼화">캐주얼화
				<input type = "checkbox" id="mem_interest" name="mem_interest" value="기타잡화">기타잡화
			</td></tr>
		</table>
		<table class="table3">
			<tr>
				<td>
					<input  class="btn" type="submit" id="updateAccount_submit" name="updateAccountbtn" value="회원정보수정">
				</td>
				<td>
					<a href="myPage.do?mem_id=${myinfo1.mem_id}"><input class="btn" type="button" value="마이페이지"></a>
				</td>
			</tr>
		</table>
	</form>
	
	<%-- <form action ="myPage.do?mem_id=${myinfo1.mem_id}" method ="post">
	<input type ="submit" value="마이페이지">
	</form> --%>
	
</c:forEach>
</body>
<%@ include file="../footer.jsp"%>
</html>