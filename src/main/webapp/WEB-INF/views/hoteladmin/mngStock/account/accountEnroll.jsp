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
	margin-top:-3px;
	width: 760px;
	height: 444px;
	
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
	width: 100px;
    margin-left: 103px;
    color: blue;
	}
	#textArea{
	margin-left: 65px; 
	border-radius: 5px;
	}
	input[type=text]{
	border-radius: 2px;
	border: 1px solid gray;
	}
	.btnx{
    margin-top: 0px;
    border-radius: 5px;
    margin-left: 76.4%;
	}
	#enrollDiv{
	margin-left: 10px;
	margin-top: 5px;
	}
	#enrollBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	#reBtn{
	background: white;
	border: 1px solid gray;
	color: 1px solid gray;
	}
	#addressDiv{
	    position: relative;
    bottom: 80px;
	}
	
</style>
</head>
<body>
	<header>
	</header>
	<div id="enrollDiv">
	
		<div class="bodyDiv">
		<div>	<div class="same" id="ssam">거래처코드</div>  <div class="same"><input type="text" class="space" style="width:100px" disabled="disabled" id="sam">&nbsp;<button>fn</button></div>  </div>
		<div>	<div class="same" id="ssam">상호(이름)</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">대표자명</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">종목</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">전화</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="search">우편번호검색</div>  <div class="same"><input type="text" class="space" style="width:497px" id="sam"></div>  </div>
		<div>	<div class="same" id="address"><label id="addressDiv">주소</label></div>  <div class="same"><textarea style="width: 600px; height: 50px; resize: none" id="textArea"></textarea></div>  </div>
		<div>	<div class="same" id="ssam">담당자</div>  <div class="same"><button>검색</button>&nbsp;<input type="text" class="space" style="width:551px" id="sam"></div>  </div>
		 <div>	<div class="same" id="ssam">Email</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
			  
		</div><!-- end -->
		<div class="btnx">
		<button id="reBtn">다시작성</button>&nbsp;
		<button id="enrollBtn">등록</button></div>
		</div>
</body>
</html>