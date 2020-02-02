<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
/* 좌우 방향 버튼 */
.carousel-control{
	width: 100px !important;
}
/* 중앙 표시 버튼 */
.carousel-indicators li:not(:first-child){
	margin-left: 5px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		      <li data-target="#myCarousel" data-slide-to="3"></li>
		      <li data-target="#myCarousel" data-slide-to="4"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		      <div class="item active">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 720px;">
		      </div>
		
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 720px;">
		      </div>
		    
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 720px;">
		      </div>
		      
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 720px;">
		      </div>
		      
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 720px;">
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
	</section>
	<footer></footer>
</body>
</html>