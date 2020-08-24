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

	var inval_Arr = new Array(12).fill(false);
	var namej = 0;
	var idj = 0;
	var pwj = 0;
	var pw2j = 0;
	var telj = 0;
	var emailj = 0;
	var yyj = 0;
	var ddj = 0;

	
	
	
$("#mem_name").keyup(function (){
	
	 var name = $('#mem_name').val();
	 var regExp = /\s/g;
	

	 
	 if(name == "") {
		 
		 $("#name_check").css("color","red").css("font-size","12px");
		 $("#name_check").html("필수입력사항입니다.");
		   namej=0;	 
	 } 
	 else if(name.match(regExp)){
		 $("#name_check").css("color","red").css("font-size","12px");
		 $("#name_check").html("공백은 사용하실 수 없습니다.");
		 namej=0;	
	 }
	 else if(name.length < 2){
		 $("#name_check").css("color","red").css("font-size","12px");
		 $("#name_check").html("이름을 정확히 입력하세요.");
		 namej=0;	
	 }
	 else if(!name.match("^[\uAC00-\uD7A3]*$")){
		 $("#name_check").css("color","red").css("font-size","12px");
		 $("#name_check").html("이름을 정확히 입력하세요");
		 namej=0;	
	 }
	 else{
		 $("#name_check").css("color","green").css("font-size","12px");
		 $("#name_check").html("멋진 이름입니다.");
		 namej=1;	
	 }
	 
	 
	 
});
	
$("#mem_id").keyup(function Check_id(){

	var regType1 = /^[A-Za-z0-9+]{4,12}$/; 
    var regType2 = /[^a-z0-9]+|^([a-z]+|[0-9]+)$/i;
    var id = $('#mem_id').val();
    var regExp = /\s/g;
    
 if($("#mem_id").val() == "") {
	   $("#id_check").css("color","red").css("font-size","12px");
	   $("#id_check").html("필수입력사항입니다.");
	   idj=0;	
 }
 else if(id.match(regExp)){
	 $("#id_check").css("color","red").css("font-size","12px");
	 $("#id_check").html("공백은 사용하실 수 없습니다.");
	 idj=0;
 }
 else if(!regType1.test($("#mem_id").val())){
	   $("#id_check").css("color","red").css("font-size","12px");
	   $("#id_check").html("아이디는 4~12자 영문 대소문자와 숫자만 가능합니다.");
	   idj=0;
 }
 else if(regType2.test($("#mem_id").val())){
	   $("#id_check").css("color","red").css("font-size","12px");
	   $("#id_check").html("아이디는 영문 과 숫자의 조합으로 구성하여야합니다.");
	   idj=0;
 }
 else{
     	$.ajax({
			type: 'POST',  
				url: './IdCheck.do', 
					data: {mem_id: id},  

			success: function(result){  

				if(result == '1'){ 
					$("#id_check").css("color","red").css("font-size","12px");
				    $("#id_check").html("이미 사용중인 아이디입니다.");
				    idj=0;
					 
				} else {
					 $("#id_check").css("color","green").css("font-size","12px");
					$("#id_check").html("사용가능한 아이디입니다.");
					idj=1;
				}

	
			} 
      
		})
	 
 }
});
$("#mem_pw").keyup(function (){
	var pw = $("#mem_pw").val(); 
	var num = pw.search(/[0-9]/g); 
	var eng = pw.search(/[a-z]/ig); 
	var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
	var regExp = /\s/g;
		
	if($("#mem_pw").val() == "") {
		   $("#pw_check").css("color","red").css("font-size","12px");
		   $("#pw_check").html("필수입력사항입니다.");
		   pwj=0;
	 }
	else if(pw.match(regExp)){
		 $("#pw_check").css("color","red").css("font-size","12px");
		 $("#pw_check").html("공백은 사용하실 수 없습니다.");
		 pwj=0;
	 }
	else if(pw.length < 8 || pw.length > 20){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("8자~20자 이내로 입력하세요.");	
	    pwj=0;
    }
	else if(pw.search(/\s/) != -1){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("공백없이 입력하세요.");
	    pwj=0;
	}
	else if(num < 0 || eng < 0 || spe < 0 ){
		$("#pw_check").css("color","red").css("font-size","12px");
	    $("#pw_check").html("영문,숫자,특수문자를 혼합하여 입력하세요.");
	    pwj=0;
	}
	else {
		$("#pw_check").css("color","green").css("font-size","12px");
	    $("#pw_check").html("사용가능합니다.");
	    pwj=1;
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
$("#mem_yy").keyup(function (){
	var yy = $("#mem_yy").val();
	var regExp = /^[0-9]+$/;
	
	if(yy < 1920 || yy > 2015){
		 $("#birth_check").css("color","red").css("font-size","12px");
	     $("#birth_check").html("태어난 년도를 정확하게 입력해주세요.");
	     yyj=0;
	}
	else if(!regExp.test(yy)){
		 $("#birth_check").css("color","red").css("font-size","12px");
	     $("#birth_check").html("태어난 년도는 숫자만 입력가능합니다.");
	     yyj=0;
	}
	else if(yy.length != 4){
		
		 $("#birth_check").css("color","red").css("font-size","12px");
	     $("#birth_check").html("태어난 년도를 정확하게 입력해주세요.");
	     yyj=0;
	}
	
	else
		 $("#birth_check").html("");
		yyj=1;
	
});


$("#mem_dd").keyup(function (){
	
	var dd = $("#mem_dd").val();
	var yy = $("#mem_yy").val();
    var mm = $("#mem_mm option:selected").val();
	var regExp = /^[0-9]+$/;
	
	if(mm =="1" || mm =="2" || mm =="3" || mm =="4" || mm =="5" || mm =="6" || mm =="7" ||
		mm =="8" || mm =="9" || mm =="10" || mm =="11" || mm =="12" && yy != ""){
		if(dd == "") {
			   $("#birth_check").css("color","red").css("font-size","12px");
			   $("#birth_check").html("태어난 일을 입력해주세요.");
			   ddj=0;
		 }
		else if(yy == ""){
			$("#birth_check").css("color","red").css("font-size","12px");
	        $("#birth_check").html("태어난 년도를  입력해주세요.");
	        ddj=0;
		}
	    else if(!regExp.test(dd)){
			 $("#birth_check").css("color","red").css("font-size","12px");
		     $("#birth_check").html("태어난 일은 숫자만 입력가능합니다.");
		     ddj=0;
		}
		else if(mm == 2 && ( yy%4==0 && yy%100!=0 || yy%400==0 )){
			if(dd < 1 || dd > 29) {
				 $("#birth_check").css("color","red").css("font-size","12px");
			     $("#birth_check").html("태어난 일을 정확히 입력해주세요.");
			     ddj=0;
			}
			else{
				$("#birth_check").css("color","green").css("font-size","12px");
			    $("#birth_check").html("생년월일 입력완료!");
			    ddj=1;
			}
		}
		else {
			
		 if(mm == 1 || mm == 3 || mm == 5 || mm == 7 || mm == 8 || mm == 10 || mm == 12){
			if(dd < 1 || dd > 31) {
				 $("#birth_check").css("color","red").css("font-size","12px");
			     $("#birth_check").html("태어난 일을 정확히 입력해주세요.");
			     ddj=0;
			}
			else{
				$("#birth_check").css("color","green").css("font-size","12px");
			    $("#birth_check").html("생년월일 입력완료!");
			    ddj=1;
			}
		} 
		else if(mm == 2){
			 if(dd < 1 || dd > 28){
				 $("#birth_check").css("color","red").css("font-size","12px");
			     $("#birth_check").html("태어난 일을 정확히 입력해주세요.");
			     ddj=0;
			 }
			 else{
				 $("#birth_check").css("color","green").css("font-size","12px");
				 $("#birth_check").html("생년월일 입력완료!");
				 ddj=1;
			 }
		 }
		else {
			if(dd < 1 || dd > 30) {
				 $("#birth_check").css("color","red").css("font-size","12px");
			     $("#birth_check").html("태어난 일을 정확히 입력해주세요.");
			     ddj=0;
			}
			else {
				$("#birth_check").css("color","green").css("font-size","12px");
			    $("#birth_check").html("생년월일 입력완료!");
			    ddj=1;
			}
		} 
	}	
			
	}
	
	
	else {
		$("#birth_check").css("color","red").css("font-size","12px");
	    $("#birth_check").html("태어난 월을 선택해주세요.");
	    ddj=0;
	}	
});




$("#reg_submit").click(function(){
	
	if (namej == 1) {
		inval_Arr[0] = true;
	} else {
		inval_Arr[0] = false;
	}
	
	if (idj == 1) {
		inval_Arr[1] = true;	
	} else {
		inval_Arr[1] = false;
	}
	
	if (pwj == 1){
		
		inval_Arr[2] = true;
	} else {
		inval_Arr[2] = false;
	}
	
	if (pw2j == 1) {
		
		inval_Arr[3] = true;
	} else {
		inval_Arr[3] = false;
	}

	if (telj == 1) {
		
		inval_Arr[4] = true;
	} else {
		inval_Arr[4] = false;
	}
	
    if (emailj == 1) {
		
		inval_Arr[5] = true;
	} else {
		inval_Arr[5] = false;
	}
	
   if (yyj == 1) {
	
	inval_Arr[6] = true;
    } else {
	inval_Arr[6] = false;
    }

    if (ddj == 1) {
	
	inval_Arr[7] = true;
    } else {
	inval_Arr[7] = false;
    }
    
    if ($("#mem_postnm").val() == "") {
    	
    	inval_Arr[8] = false;
        } else {
    	inval_Arr[8] = true;
        }
    
    if ($("#mem_addr").val() == "") {
    	
    	inval_Arr[9] = false;
        } else {
    	inval_Arr[9] = true;
        }
 
    if ($("#mem_dtaddr").val() == "") {
 	
 	    inval_Arr[10] = false;
        } else {
 	    inval_Arr[10] = true;
        }
    
    if ($(':radio[name="mem_sex"]:checked').length < 1){
    	
    	inval_Arr[11] = false;
    } else {
    	inval_Arr[11] = true;
    }
    
    
	var validAll = true;
	for(var i = 0; i < inval_Arr.length; i++){
		
		if(inval_Arr[i] == false){
			validAll = false;
		}
	}
	
	if(validAll){ 
		
		sub();
		alert('회원가입이 완료되었습니다.')
		
	} else{
		alert('입력한 정보들을 다시 한번 확인해주세요.')
		
	}


	
});





function sub() {

	var form = document.getElementById('signupform');

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
<form name="form1" action="signup.do" id="signupform" method="post">
<table class="table1">
<caption class="cap">회원가입</caption>
<tr class="join_ctr">
<td><label>이름</label></td>
<td><input class="join_form" type="text" id="mem_name" name="mem_name" required="required"></td>
</tr>
<tr><td></td><td id="name_check"></td></tr>
<tr class="join_ctr">
<td><label>아이디</label></td>
<td><input class="join_form" type="text" id="mem_id" name="mem_id" required="required"></td>
</tr>
<tr><td></td><td id="id_check"></td></tr>

<tr class="join_ctr"><td><label>비밀번호</label></td>
<td><input class="join_form" type="password" id="mem_pw" name="mem_pw" required="required"></td>
</tr>
<tr><td></td><td id="pw_check"></td></tr>
<tr class="join_ctr"><td><label>비밀번호확인</label></td>
<td><input class="join_form" type="password" id="mem_pw2" name="mem_pw2"></td>
</tr>
<tr><td></td><td id="pw2_check"></td></tr>
<tr class="join_ctr"><td><label>전화번호</label></td>
<td><input class="join_form" type="text" id="mem_tel" name="mem_tel" required="required"></td>
</tr>
<tr><td></td><td id="tel_check"></td></tr>
<tr class="join_ctr"><td><label>이메일</label></td>
<td><input class="join_form" type="email" id="mem_email" name="mem_email" required="required"></td>
</tr>
<tr><td></td><td id="email_check"></td></tr>


<tr class="join_ctr"><td><label>우편번호</label></td>
<td><input class="join_form" type="text" id="mem_postnm" name="mem_postnm" required="required" readonly> 
<input class="join_form" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
<td></td></tr>



<tr class="join_ctr"><td><label>주소</label></td>
<td><input class="join_form"type="text" id="mem_addr" name="mem_addr" placeholder="주소" required="required" readonly></td></tr>
<tr class="join_ctr"><td><label>상세주소</label>
<td><input class="join_form"type="text" id="mem_dtaddr" name="mem_dtaddr" placeholder="상세주소 입력" ></td></tr>
<tr class="join_ctr"><td><label>비고</label>
<td><input class="join_form"type="text" id="mem_exaddr" name="mem_exaddr" placeholder="비고"  readonly></td></tr>


<tr class="join_ctr"><td><label>성별</label></td>
<td><input type="radio" id="mem_sex1" name="mem_sex" value="male">남자
    <input type="radio" id="mem_sex2" name="mem_sex" value="female">여자
</td>
</tr>
<tr class="join_ctr"><td><label>생년월일</label></td>
<td><input class="join_form" type="text" id="mem_yy" name="mem_yy" size="5" maxlength="4" required="required"> 년
<select id="mem_mm" name="mem_mm" required="required">
 <option>월 </option>
<option value="1">
1월
</option>
<option value="2">
2월
</option>
<option value="3">
3월
</option>
<option value="4">
4월
</option>
<option value="5">
5월
</option>
<option value="6">
6월
</option>
<option value="7">
7월
</option>
<option value="8">
8월
</option>
<option value="9">
9월
</option>
<option value="10">
10월
</option>
<option value="11">
11월
</option>
<option value="12">
12월
</option>
</select>
<input class="join_form" type="text" id="mem_dd" name="mem_dd" size="5" required="required">일
</td>
</tr>
<tr><td></td><td id="birth_check"></td></tr>
<tr class="join_ctr"><td><label>관심항목(선택사항)</label></td>
<td><input type="checkbox" id="mem_interest" name="mem_interest" value="운동화">운동화
    <input type="checkbox" id="mem_interest" name="mem_interest" value="구두">구두<br>
    <input type="checkbox" id="mem_interest" name="mem_interest" value="캐주얼화">캐주얼화
    <input type="checkbox" id="mem_interest" name="mem_interest" value="기타잡화">기타잡화
</td>
</tr>

</table>
<table class="table3">
<tr>
<td>
<input class="btn" type="button" id="reg_submit" name="registerbtn"  value="가입하기">
<input class="btn" type="button" onClick="location.href='index.jsp'; return false;" name="resetbtn" value="취소">
</td>
</tr>
</table>

</form>
</body>
<%@ include file="../footer.jsp"%>
</html>