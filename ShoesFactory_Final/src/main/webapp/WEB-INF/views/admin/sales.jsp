<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
    $("select option[value='2020']").attr("selected", true);
})

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
.cap{ text-align:left;
    margin-bottom:15px;
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
 .sum{
 color:red;
 }
 .btn {
width:80px;
height:35px;
background-color:#D8D8D8;
}
</style>
</head>
<body>
<form>
<select>
<option value="2020">
2020
</option>
<option value="2021">
2021
</option>
<option value="2022">
2022
</option>
<option value="2023">
2023
</option>
<option value="2024">
2024
</option>
<option value="2025">
2025
</option>
<option value="2026">
2026
</option>
<option value="2027">
2027
</option>
<option value="2028">
2028
</option>
<option value="2029">
2029
</option>
<option value="2030">
2030
</option>
</select>
년
<select>
<option value="01">
01
</option>
<option value="02">
02
</option>
<option value="03">
03
</option>
<option value="04">
04
</option>
<option value="05">
05
</option>
<option value="06">
06
</option>
<option value="07">
07
</option>
<option value="08">
08
</option>
<option value="09">
09
</option>
<option value="10">
10
</option>
<option value="11">
11
</option>
<option value="12">
12
</option>
</select>
월 매출자료 검색 <input class="btn" type="button" onclick="" value="검색">
<table class="table5">
<colgroup>
<col width="28%">
<col width="12%">
<col width="12%">
<col width="12%">
<col width="12%">
<col width="12%">
<col width="12%">
</colgroup>
<tr>
<th scope="col">날짜</th>
<th scope="col">제품원가</th>
<th scope="col">총 매출액</th>
<th scope="col">현금결제</th>
<th scope="col">카드결제</th>
<th scope="col">포인트결제</th>
<th scope="col">총 주문자수</th>
</tr>
<tr>
<td>2020-03-01</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr>
<td>2020-03-02</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr>
<td>2020-03-03</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr>
<td>2020-03-04</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr>
<td>2020-03-05</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr>
<td>2020-03-06</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr>
<td>2020-03-07</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr class="sum">
<td>합계</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
</table>
</form>
</body>
</html>