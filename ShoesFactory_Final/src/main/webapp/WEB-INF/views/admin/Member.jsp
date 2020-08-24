<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
select {
  width: 100px;
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
.input1{
 width:50px;
 height:30px;
}
.input2{
 height:30px;
 width:200px;
}
.table5{
 width:100%;
 text-align:center;
 border:1;
 margin-top:30px;
 border: 1px solid #BDBDBD;
 border-collapse: collapse;
}
 th, td {
    border: 1px solid #BDBDBD;
    padding: 10px;
  }
  
.btn {
width:80px;
height:40px;
background-color:#0040FF;
color:white;
}
.btn2 {
width:80px;
height:40px;
background-color:#A4A4A4;
color:black;
}
.member_tr{
 background-color:#BDBDBD;
}
</style>
</head>
<body>
<form action="" method="post">
<table class="table5">
<tr>
<td><label>아이디</label></td><td><input class="input2" type="text" id="id"></td><td><label>이름</label></td><td><input class="input2" type="text" id="name"></td>
</tr>
<tr>
<td><label>핸드폰</label></td><td><input class="input2" type="text" id="phone"></td><td><label>총 구매금액</label></td><td><input class="input2" type="text" id="money"></td>
</tr>
<tr>
<td>
<label>회원 등급</label>
</td>
<td>
<select name="grade">
<option>-선택-</option>
<option value="브론즈">
브론즈</option>
<option value="실버">
실버</option>
<option value="골드">
골드</option>
<option value="플레티넘">
플레티넘</option>
<option value="다이아">
다이아</option>
</select>
</td>
<td>
<label>적립포인트</label>
</td>
<td>
<input type="text" class="input2" id="point">
</td>
</tr>
<tr>
<td>
<label>회원가입일</label>
</td>
<td colspan="3">
<input class="input1" type="text" id="yy"> 년 <input class="input1" type="text" id="mm"> 월 <input class="input1" type="text" id="dd">일    ~   
<input class="input1" type="text" id="yy2"> 년 <input class="input1" type="text" id="mm2"> 월 <input class="input1" type="text" id="dd2">일
</td>
</tr>
<tr>
<td colspan="4" align="center">
<input type="button" id="search" class="btn" onclick="" value="검색"><input class="btn2" type="reset" name="초기화">
</td>
</tr>
</table>

<table class="table5">
<colgroup>
<col width="5%">
<col width="15%">
<col width="10%">
<col width="20%">
<col width="20%">
<col width="15%">
<col width="15%">
</colgroup>
<tr class="member_tr">
<th scope="col">번호</th>
<th scope="col">아이디</th>
<th scope="col">성명</th>
<th scope="col">핸드폰</th>
<th scope="col">회원가입일</th>
<th scope="col">총 구매금액</th>
<th scope="col">회원등급</th>
</tr>
<tr>
<td>1</td>
<td>test</td>
<td>홍길동</td>
<td>000-0000-0000</td>
<td>2020-03-01</td>
<td>150,000원</td>
<td>플레티넘</td>
</tr>
<tr>
<td>2</td>
<td>test2</td>
<td>홍길동</td>
<td>000-0000-0000</td>
<td>2020-03-01</td>
<td>150,000원</td>
<td>플레티넘</td>
</tr>
<tr>
<td>3</td>
<td>test3</td>
<td>홍길동</td>
<td>000-0000-0000</td>
<td>2020-03-01</td>
<td>150,000원</td>
<td>플레티넘</td>
</tr>
</table>
</form>
</body>
</html>