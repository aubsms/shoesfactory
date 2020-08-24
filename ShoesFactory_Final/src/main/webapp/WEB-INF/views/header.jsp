<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슈즈팩토리</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
     * {
     	margin: 0;
     	padding: 0;
     }
     .header_section1 {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		background-color: white;
		height: 40px;
		border-bottom: 1px solid lightgray;
		z-index: 999;
	}
	.section1_width {
		position: relative;
		max-width: 1200px;
		margin: 0 auto;
		padding: 0 20px;
	}
	.section1_right {
		float: right;
		height: 40px;
		line-height: 40px;
		display: flex;
		width: auto;
	}
	li {
		list-style: none;
	}
	.section1_right li {
		padding:0 10px;
		font-size: 12px;
		color:black;
	}
	a {text-decoration: none;}
	a:visited {text-decoration: none;} /* 방문했던 링크 */
	.section1_right a:hover {color: gray;} /* 커서가 링크위에 있을 때 */
	a:focus {text-decoration: none;} /* 요소에 초점이 맞춰질 때 */
	a:hover, a:active {text-decoration: none;} /* 클릭시 */

	.header_logo img{
		display: block;
		margin: 50px auto 10px auto;
		width: 400px;
	}
	.dropmenu {
		width: 100%;
     	background-color: white;
     	text-align: center;
     	border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		z-index: 999;
	}
     .dropmenu ul ul{
     	position: absolute;
     	display: none;
     }
     .dropmenu ul ul li{
     	display: block;
     	background-color: white;
     }
     .dropmenu ul li{
     	display: inline-block;
     }
     .dropmenu li ul {
     	border: 1px solid lightgray;
     	z-index: 200;
     }
     .dropmenu ul li a{
     	display: block;
     	width: 150px;
     	line-height: 43px;
       	text-decoration: none;
       }
     .category li a:hover{
     	background-color: lightgray;
     	color: black;
     	font-weight: bold;
     }
     .bigcate {
		font-weight: bold;
		font-size: 15pt;
		color: black;
	}
	.bigcate_evt {
		font-weight: bold;
		font-size: 15pt;
		color: red;
	}
	.category:hover {
		text-decoration: underline;
	}
	.category li a {
		color: black;
		font-size: 11pt;
	}
	.menuFixed {
		position: fixed;
		top: 40px;
	}
</style>
<script>
	/* 스크롤 고정 메뉴 */
	$(function() {
		var menuOffset = $(".dropmenu").offset();
		$(window).scroll(function() {
			if($(document).scrollTop() > menuOffset.top) {
				$(".dropmenu").addClass("menuFixed");
			}
			else {
				$(".dropmenu").removeClass("menuFixed");
			}
		});
	});
	/* 카테고리 드롭다운 */
	$(function() {
		$(".dropmenu ul li").hover(function() {
			$(this).find("ul").stop().fadeToggle(300);
		});
	});
</script>
</head>
<body>
	<header>
		<div class="header_section1">
			<div class="section1_width">
				<ul class="section1_right">
					<%
						String name="";
						name=(String)session.getAttribute("slogin");
						if(name==null) {
					%>
					<li><a href="login.do">로그인</a></li>
					<li><a href="signupform.do">회원가입</a></li>
					<li><a href="prod_his.do">구매내역</a></li>
					<li><a href="myPage.do" onclick="error()">마이페이지</a></li>
					<li><a href="CartView.do">장바구니</a></li>
					<li><a href="GetBoardList.do">게시판</a></li>
					<%}
						else if(name.equals("admin")) {
					%>
					<li><%=name %>님 환영합니다!</li>
					<li><a href="index.jsp">홈</a></li>
					<li><a href="adminhome.do">관리자페이지</a></li>
					<li><a href="logout.do">로그아웃</a></li>
					<%} 
						else {
					%>
					<li><%=name %>님 환영합니다.</li>
					<li><a href="logout.do">로그아웃</a></li>
					<li><a href="prod_his.do">구매내역</a></li>
					<li><a href="myPage.do?mem_id=<%=name%>">마이페이지</a></li>
					<li><a href="CartView.do">장바구니</a></li>
					<li><a href="GetBoardList.do">게시판</a></li>
					<%} %>
					<li>
						<form action="searchtext.do">
							<input type="text" name="findtext">
							<input type="image" src="./resources/image/search.png" class="search_btn" value="submit">
						</form>
					</li>
				</ul>
			</div>
		</div>
		<div class="header_logo">
			<a href="shoesfactory_home.do"><img src="./resources/image/logo.jpg" alt="슈즈팩토리"></a>
		</div>
		<div class="dropmenu">
			<ul>
				<li class="category"><a href="bigcategory.do?bigtype=casual" class="bigcate">캐주얼화</a>
					<ul>
						<li><a href="smallcategory.do?smalltype=converse">캔버스</a></li>
						<li><a href="smallcategory.do?smalltype=sneakers">스니커즈</a></li>
						<li><a href="smallcategory.do?smalltype=sport">운동화</a></li>
						<li><a href="smallcategory.do?smalltype=sandal">샌들</a></li>
						<li><a href="smallcategory.do?smalltype=slipper">슬리퍼</a></li>
					</ul>
				</li>
				<li class="category"><a href="bigcategory.do?bigtype=man" class="bigcate">남성화</a>
					<ul>
						<li><a href="smallcategory.do?smalltype=man_shoes">구두</a></li>
						<li><a href="smallcategory.do?smalltype=man_boots">부츠</a></li>
						<li><a href="smallcategory.do?smalltype=man_walker">워커</a></li>
						<li><a href="smallcategory.do?smalltype=man_loafers">로퍼</a></li>
					</ul>
				</li>
				<li class="category"><a href="bigcategory.do?bigtype=woman" class="bigcate">여성화</a>
					<ul>
						<li><a href="smallcategory.do?smalltype=woman_shoes">구두</a></li>
						<li><a href="smallcategory.do?smalltype=woman_boots">부츠</a></li>
						<li><a href="smallcategory.do?smalltype=woman_walker">워커</a></li>
						<li><a href="smallcategory.do?smalltype=woman_loafers">로퍼</a></li>
						<li><a href="smallcategory.do?smalltype=woman_danhwa">단화</a></li>
						<li><a href="smallcategory.do?smalltype=woman_heel">힐</a></li>
					</ul>
				</li>
				<li class="category"><a href="bigcategory.do?bigtype=kids" class="bigcate">아동화</a>
					<ul>
						<li><a href="smallcategory.do?smalltype=kids_flat">플랫슈즈</a></li>
						<li><a href="smallcategory.do?smalltype=kids_shoes">구두</a></li>
						<li><a href="smallcategory.do?smalltype=kids_boots">부츠</a></li>
						<li><a href="smallcategory.do?smalltype=kids_indoor">실내화</a></li>
					</ul>
				</li>
				<li class="category"><a href="" class="bigcate_evt">EVENT</a></li>
			</ul>
		</div>
	</header>
</body>
</html>