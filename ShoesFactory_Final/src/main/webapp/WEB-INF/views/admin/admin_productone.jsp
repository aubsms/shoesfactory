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
	.table td {
		border: 1px solid black;
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
<script>
function getFileName(file){
	var filePath = file.value;
	var thisfilefoldername = filePath.substring(filePath.lastIndexOf('\\')+1, filePath.length);
	document.getElementById('mainimg').value="../resources/image/"+thisfilefoldername;	
}

function getthumbFileName(thumbfile){
	var filePath = thumbfile.value;

	var thisfilefoldername = filePath.substring(filePath.lastIndexOf('\\')+1, filePath.length);
	
	document.getElementById('thumbimg').value="../resources/image/"+thisfilefoldername;
}

function getSubFileName(subfile){
	var filePath = subfile.value;
	var pathStr = document.getElementById('subimg').value;
	var thisfilefoldername = "<img src=../resources/image/" +filePath.substring(filePath.lastIndexOf('\\')+1, filePath.length)+"><br>";
	document.getElementById('subimg').value=pathStr+thisfilefoldername;
	
}
</script>
</head>
<body>
<h1>상품 수정</h1>
	<form action="produpdate.do" method="get">
	<table class="table">
	<tr>
		<td>제품이름</td><td><input type="text" name="prod_name" value="${prodOne.prod_name}"></td>
	</tr>
	<tr>
		<td>제품가격</td><td><input type="text" name="prod_price" value="${prodOne.prod_price}"></td>
		<input type="hidden" name="prod_amount" value="${prodOne.prod_amount }">
	</tr>
		
	<tr>
		<td>카테고리(대)</td><td><input type="text" name="prod_cat_big" value="${prodOne.prod_cat_big}"></td>
	</tr>
	<tr>
		<td>카테고리(소)</td><td><input type="text" name="prod_cat_small" value="${prodOne.prod_cat_small}"></td>
	</tr>
	<tr>
		<td rowspan=2>메인이미지</td><td><input type="text" id="mainimg" name="prod_main_imgpath" value="${prodOne.prod_main_imgpath}"></td>
	</tr>
	<tr>
		<td><input type="file" name="main_img" onchange="getFileName(this)"></td>
	</tr>
	
	<tr>
		<td rowspan=2>썸네일</td><td><input type="text" id="thumbimg" name="prod_thumb_imgpath" value="${prodOne.prod_thumb_imgpath}"></td>
	</tr>
	<tr>
		<td><input type="file" name="thumb_img" onchange="getthumbFileName(this)"></td>
	</tr>
	<tr>
		<td rowspan=5>상세이미지</td><td><input type="text" id="subimg" name="prod_sub_imgpath" value="${prodOne.prod_sub_imgpath}"></td>
	</tr>
	<tr>
		<td><input type="file" name="sub_img1" onchange="getSubFileName(this)"></td>
	</tr>
	<tr>
		<td><input type="file" name="sub_img2" onchange="getSubFileName(this)"></td>
	</tr>
	<tr>
		<td><input type="file" name="sub_img3" onchange="getSubFileName(this)"></td>
	</tr>
	<tr>
		<td><input type="file" name="sub_img4" onchange="getSubFileName(this)"></td>
	</tr>
</table>
<table class="button">
		<tr>
			<td>
				<input type="submit" value="수정" class="btn">
				<a href="prodall.do"><input type="button" value="취소" class="btn"></a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>