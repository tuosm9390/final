<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bodyDiv{
	margin-top:10px; 
	width: 760px;
	height: 220px;
	background-color: #f7f7f7;
	margin-bottom: 10px;
	} 
	.same{
	display: inline-block;

	margin-top: 20px;
	}
	#sam{
	width: 540px; 
	}
	#ssam{
	width:100px;
	}
	#search{
	width:100px;
	margin-left: 110px;
	color: blue;
	}
	#textArea{
	margin-left: 65px; 
	border-radius: 3px;
	}
	input[type=text]{
	border-radius: 3px;
	}
	.btnss{
	margin-top: 10px;
	border-radius: 3px; 
	}
	.imgDiv{
	font-size: 20px;
	}
	.divhr{
	width: 760px;
	border-bottom: 1px solid black;
	margin-top: 3px;
	}
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	 
</style>
</head>
<body>
	<header>
	</header>
	<section>
		
		<div class="divhr"></div>
		<div class="bodyDiv">
		<div>	<div class="same" id="ssam">창고코드</div>  <div class="same"><input type="text" class="space" style="width:600px"  id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">창고명</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">구분</div>  <div class="same"><input type="radio">창고 &nbsp;&nbsp;<input type="radio">기타 </div>  </div>
		<div>	<div class="same" id="ssam">창고위치</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		</div><!-- end -->
		<div class="divhr"></div>
		<div class="btnss"><button>등록</button>&nbsp;<button>다시작성</button></div> 
	</section>
</body>
</html>