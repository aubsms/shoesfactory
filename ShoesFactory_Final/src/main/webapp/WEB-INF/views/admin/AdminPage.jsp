<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

  #head{
          margin-top:30px;
          width:1000px; 
          height:35px;
          background-color:#D8D8D8;
          
          
   }
 
  #content{
          
          width:1000px;
          height:600px;
          
  }
  #foot {
          
         
          width:1000px;
          height:100px;
          text-align:left;
          
  }
 .ul_form {
  list-style-type:none;
  float:left;
  margin-left:65px;
  font-size:15pt;
  }
 .out {
 width: 100%;
 text-align: center;
 }
 .in{
  display: inline-block;
 }
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}


</style>
</head>
<body>
<h1 style="margin-left:450px; margin-top:50px;" >관리자 페이지</h1>
 <div class="out">
   <div class="in">
     <div id="head">
       <ul class="ul_form">
        <li class="ul_form"><a href="prodall.do">제품관리</a></li>
        <li class="ul_form"><a href="memall.do">회원관리</a></li>
        <li class="ul_form"><a href="Banner.jsp" target="icontent">배너관리</a></li>
        <li class="ul_form"><a href="sales.jsp" target="icontent">매출관리</a></li>
        <li class="ul_form"><a href="stocklist.do">재고관리</a></li>
        <li class="ul_form"><a href="Member.jsp" target="icontent">회원통계</a></li>
       </ul>
     </div>
     <div id="content">
     <iframe name="icontent" width="100%" height="100%" frameborder="0"/>
     </div>
     <div id="foot">

      </div>
    </div>
 </div>

</body>
</html>