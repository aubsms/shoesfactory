<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>슈즈팩토리</title>
<style>
        *{
			margin: 0;
			padding: 0;
		}
        .mySlides {display: none}
        .mySlides fade img {vertical-align: middle;}
        
        .slideshow {
        	margin-top: 50px;
        	margin-bottom: 70px;
        }
        /* Slideshow container */
        .slideshow-container {
          max-width: 1200px;
          position: relative;
          margin: auto;
          z-index:50;
        }
        
        /* Next & previous buttons */
        .prev, .next {
          cursor: pointer;
          position: absolute;
          top: 50%;
          width: auto;
          padding: 16px;
          margin-top: -22px;
          color: white;
          font-weight: bold;
          font-size: 18px;
          transition: 0.6s ease;
          border-radius: 0 3px 3px 0;
          user-select: none;
        }
        
        /* Position the "next button" to the right */
        .next {
          right: 0;
          border-radius: 3px 0 0 3px;
        }
        
        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
          background-color: rgba(0,0,0,0.8);
        }
        
        /* Number text (1/3 etc) */
        .numbertext {
          color: #f2f2f2;
          font-size: 12px;
          padding: 8px 12px;
          position: absolute;
          top: 0;
        }
        
        /* The dots/bullets/indicators */
        .dot {
          cursor: pointer;
          height: 15px;
          width: 15px;
          margin: 0 2px;
          background-color: #bbb;
          border-radius: 50%;
          display: inline-block;
          transition: background-color 0.6s ease;
        }
        
        .active, .dot:hover {
          background-color: #717171;
        }
        
        /* Fading animation */
        .fade {
          -webkit-animation-name: fade;
          -webkit-animation-duration: 1.5s;
          animation-name: fade;
          animation-duration: 1.5s;
        }
        
        @-webkit-keyframes fade {
          from {opacity: .4} 
          to {opacity: 1}
        }
        
        @keyframes fade {
          from {opacity: .4} 
          to {opacity: 1}
        }
        
        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {
          .prev, .next,.text {font-size: 11px}
        }
        
        h1 {
        	text-align: center;
        	font-size: 30pt;
        	margin: 20px 0;
        }
        .sangpum {
        	margin: 70px auto;
        	border-spacing: 100px 0;
        	text-align: center;
        }
        .sangpum img {
        	width: 320px;
        	height: 320px;
        }
		a {
			text-decoration: none;
			color: black;
		}
		a:visited {
			text-decoration: none;
		}
</style>
</head>
<body>
	<div class="slideshow">
	    <div class="slideshow-container">
	        <div class="mySlides fade">
	        	<img src="./resources/image/slide1.jpg" style="width:100%">
	        </div>
	        
	        <div class="mySlides fade">
	        	<img src="./resources/image/slide2.jpg" style="width:100%">
	        </div>
	        
	        <div class="mySlides fade">
	        	<img src="./resources/image/slide3.jpg" style="width:100%">
	        </div>
	        
	        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	        <a class="next" onclick="plusSlides(1)">&#10095;</a>
   		</div><br>
        <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span> 
            <span class="dot" onclick="currentSlide(2)"></span> 
            <span class="dot" onclick="currentSlide(3)"></span> 
	    </div>
	</div>
    <script>
    var slideIndex = 0;
    showSlides();
    var slides,dots;

    function showSlides() {
        var i;
        slides = document.getElementsByClassName("mySlides");
        dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
        }
        slideIndex++;
        if (slideIndex> slides.length) {slideIndex = 1}    
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 5000);
    }

    function plusSlides(position) {
        slideIndex +=position;
        if (slideIndex> slides.length) {slideIndex = 1}
        else if(slideIndex<1){slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
    }

    function currentSlide(index) {
        if (index> slides.length) {index = 1}
        else if(index<1){index = slides.length}
        for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[index-1].style.display = "block";  
        dots[index-1].className += " active";
    }
    </script>
    
    <h1>BEST ITEM</h1><hr>

</body>
<%@ include file="footer.jsp"%>
</html>