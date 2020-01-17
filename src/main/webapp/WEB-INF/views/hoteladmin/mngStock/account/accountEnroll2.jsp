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
	height: 470px;
	background-color: #f0f0f0;
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
	border-radius: 5px;
	}
	input[type=text]{
	border-radius: 5px;
	}
	.btns{
	margin-top: 10px;
	border-radius: 5px; 
	}
</style>
</head>
<body>
	<header>
	</header>
	<section>
		<div class="imgDiv">
		<img src="${contextPath }/resources/images/tap1.PNG" width="60px"> 
		</div>
		<div class="bodyDiv">
		<div>	<div class="same" id="ssam">거래처코드</div>  <div class="same"><input type="text" class="space" style="width:100px" disabled="disabled" id="sam"><button>fn</button></div>  </div>
		<div>	<div class="same" id="ssam">상호(이름)</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">대표자명</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">종목</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="ssam">전화</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
		<div>	<div class="same" id="search">우편번호검색</div>  <div class="same"><input type="text" class="space" style="width:490px" id="sam"></div>  </div>
		<div>	<div class="same" id="address" >주소</div>  <div class="same"><textarea style="width: 600px; height: 50px; resize: none" id="textArea"></textarea></div>  </div>
		<div>	<div class="same" id="ssam">담당자</div>  <div class="same"><button>검색</button><input type="text" class="space" style="width:557px" id="sam"></div>  </div>
		 <div>	<div class="same" id="ssam">Email</div>  <div class="same"><input type="text" class="space" style="width:600px" id="sam"></div>  </div>
			  
		</div><!-- end -->
		<div class="btns"><button>수정</button>&nbsp;<button>다시작성</button></div> 
	</section>
</body>
</html>