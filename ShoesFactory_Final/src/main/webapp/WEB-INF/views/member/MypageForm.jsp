<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
height:35px;
}
.join_ctr{
height:65px;
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
 
<form action="" method="post">
<table class="table1">
<caption class="cap">마이 페이지</caption>
<tr class="join_ctr">
<td><label>이름</label></td>
<td><label class="join_form" type="text" id="name" name="name">홍길동</label></td>
</tr>

<tr class="join_ctr">
<td><label>아이디</label></td>
<td><label class="join_form" type="text" id="id" name="id">ID</label>
</td>
</tr>

<tr class="join_ctr"><td><label>비밀번호</label></td>
<td><input class="join_form" type="password" id="pwd" name="pwd"></td>
</tr>

<tr class="join_ctr"><td><label>비밀번호확인</label></td>
<td><input class="join_form" type="password" id="pwd2" name="pwd2"></td>
</tr>

<tr class="join_ctr"><td><label>전화번호</label></td>
<td><input class="join_form" type="text" id="tel" name="tel"></td>
</tr>

<tr class="join_ctr"><td><label>이메일</label></td>
<td><input class="join_form" type="email" id="email" name="email"></td>

<tr class="join_ctr"><td><label>생년월일</label></td>
<td><input class="join_form" type="text" id="yy" name="yy" size="5"> 년
<select class="select_box" id="mm" name="mm">
 <option>월 </option>
<option value="01">
1월
</option>
<option value="02">
2월
</option>
<option value="03">
3월
</option>
<option value="04">
4월
</option>
<option value="05">
5월
</option>
<option value="06">
6월
</option>
<option value="07">
7월
</option>
<option value="08">
8월
</option>
<option value="09">
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
<input class="join_form" type="text" id="dd" name="dd" size="5">일
</td>
</tr>

<tr class="join_ctr"><td><label>관심분야</label></td>
<td><input type="checkbox" name="chk1" value="type1">관심분야1
    <input type="checkbox" name="chk1" value="type2">관심분야2<br>
    <input type="checkbox" name="chk1" value="type3">관심분야3
    <input type="checkbox" name="chk1" value="type4">관심분야4
</td>
</tr>

</table>
<table class="table3">
<tr>
<td>
<input class="btn" type="button" onclick="" name="updatebtn"  value="수정">
<input class="btn" type="button" onclick="" name="resetbtn" value="취소">
</td>
</tr>
</table>

</form>
</body>
<%@ include file="../footer.jsp"%>
</html>