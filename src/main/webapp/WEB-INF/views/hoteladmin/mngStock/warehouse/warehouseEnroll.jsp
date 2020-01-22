<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bodyDivx{
	margin-top: 20px;
    width: 760px;
    height: 182px;
    margin-bottom: 10px;
    margin-left: 20px;
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
    float: right;
    margin-right: 46px;
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
	#enrDiv{
	margin-left: 5px;
	margin-top: 10px;
	}
	#enrollBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
	#resetBtn{
	color: gray;
	background: white;
	border: 1px solid gray;
	}
	 
</style>
</head>
<body>
	<header>
	</header>
		<div id="enrDiv">
		<div class="bodyDivx">
		<div>	<div class="same" id="ssam">창고코드</div>  <div class="same"><input type="text" class="space" style="width:600px"  id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">창고명</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">구분</div>  <div class="same"><input type="radio">창고 &nbsp;&nbsp;<input type="radio">기타 </div>  </div>
		<div>	<div class="same" id="ssam">창고위치</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		</div><!-- end -->
		<div class="btnss">
		<button id="resetBtn">다시작성</button>&nbsp;
		<button id="enrollBtn">등록</button>
		</div> 
		</div>
</body>
</html>