<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
			margin: 0;
			padding: 0;
	}
	h1 {
		text-align: center;
		margin: 50px;
	}
	table {
		width: 700px;
		margin: 30px auto;
		border-collapse: collapse;
	}
	.table tr {
		height: 40px;
	}
	.table th, .table td {
		border: 1px solid black;
	}
	.table input {
		width: 100px;
	}
	.title {
		background-color: lightgray;
		text-align: center;
	}
	.button {
		text-align: center;
	}
	.btn {
		height: 50px;
		width: 90px;
		background-color: lightgray;
		border: none;
		font-size: 15px;
		margin: 5px;
	}
</style>
</head>
<body>
	<h1>재고 등록</h1>
	<form action="stockinsert.do">
	<table class="table">
		<tr class="title">
			<th>제품명</th>
			<th>230</th>
			<th>240</th>
			<th>250</th>
			<th>260</th>
			<th>270</th>
			<th>280</th>
		</tr>
		<tr>
			<td><input type="text" name="prod_name"></td>
			<td><input type="text" name="size_230" value="0"></td>
			<td><input type="text" name="size_240" value="0"></td>
			<td><input type="text" name="size_250" value="0"></td>
			<td><input type="text" name="size_260" value="0"></td>
			<td><input type="text" name="size_270" value="0"></td>
			<td><input type="text" name="size_280" value="0"></td>
		</tr>
	</table>
	<table class="button">
		<tr>
			<td>
				<input type="submit" value="입력" class="btn">
				<a href="stocklist.do"><input type="button" value="취소" class="btn"></a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>