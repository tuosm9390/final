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
	margin-top:5px;
	width: 760px;
	height: 420px;
	background-color: #f7f7f7;
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
	.btnsc{
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
</style>
</head>
<body>
	<header>
	</header>
	
		<div class="divhr"></div>
		<div class="bodyDiv">
		<div>	<div class="same" id="ssam">품목코드</div>  <div class="same"><input type="text" class="space" style="width:600px"  id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">품목명</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">품목그룹</div>  <div class="same"><button>검색</button><input type="text" class="space" style="width:560px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">매입처</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		 <div>	<div class="same" id="ssam">제조사</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		 <div>	<div class="same" id="ssam">단가</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		 <div>	<div class="same" id="ssam">부가세</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		 <div>	<div class="same" id="ssam">공급가액</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		 <div>	<div class="same" id="ssam">품목구분</div>  <div class="same"><input type="radio">비품&nbsp;&nbsp;&nbsp;<input type="radio">소모품</div>  </div>
		</div><!-- end -->
		<div class="divhr"></div>
		<div class="btnsc"><button>저장</button>&nbsp;<button>닫기</button></div> 
</body>
</html>