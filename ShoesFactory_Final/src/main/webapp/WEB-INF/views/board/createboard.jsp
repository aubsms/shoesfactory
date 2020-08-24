<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩과 J쿼리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script type="text/javascript" charset="utf-8" src="/se2/js/HuskyEZCreator.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<script>

	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="GetBoardList.do";
	});

</script>

<style>
	body {
  		padding-top: 70px;
  		padding-bottom: 30px;
	}
</style>
</head>
<body>

	<article>
		<div class="container" role="main">
			<h2>자유게시판</h2>
			<form name="form" id="form" role="form" method="post" action="GetCreateBoard.do">
				<div class="mb-3">
					<label for="BOARD_TYPE">타입</label>
					<select name="BOARD_TYPE">
  						<option value="공지" selected>공지</option>
  						<option value="일반">일반</option>
  						<option value="건의">건의</option>
 					</select>
				</div>
				<div class="mb-3">
					<label for="BOARD_WRITER">작성자</label>
					<input type="text" class="form-control" name="BOARD_WRITER" id="BOARD_WRITER" value="<%=session.getAttribute("slogin") %>" readonly>
				</div>
				<div class="mb-3">
					<label for="BOARD_TITLE">제목</label>
					<input type="text" class="form-control" name="BOARD_TITLE" id="BOARD_TITLE" placeholder="글 제목을 입력해 주세요.">
				</div>
				<div class="mb-3" >
					<label for="BOARD_CONTEXT">내용</label>
					<textarea class="form-control" rows="5" name="BOARD_CONTEXT" id="BOARD_CONTEXT" placeholder="내용을 입력해 주세요" ></textarea>
					<script>
					
						$(document).ready(function() {
	     				$('#BOARD_CONTEXT').summernote({
	            			height: 300,                
	             			minHeight: null,             
	             			maxHeight: null,             
	             			focus: true,                
	             			lang: 'ko-KR',
	             			placeholder: '최대 2048자까지 쓸 수 있습니다'
	     					});
						});
						
						/**
						* 이미지 파일 업로드
						*/
						function uploadSummernoteImageFile(file, editor) {
							data = new FormData();
							data.append("file", file);
							$.ajax({
								data : data,
								type : "POST",
								url : "/uploadSummernoteImageFile",
								contentType : false,
								processData : false,
								success : function(data) {
					            	//항상 업로드된 파일의 url이 있어야 한다.
									$(editor).summernote('insertImage', data.url);
								}
							});
						}
					</script>

				</div>
				<div class="mb-3">
					<label for="BOARD_PW">비번</label>
					<input type="text" class="form-control" name="BOARD_PW" id="BOARD_PW" placeholder="수정에 필요한 비밀번호를 입력해주세요.">
				</div>
			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>

</body>
<%@ include file="../footer.jsp"%>
</html>
