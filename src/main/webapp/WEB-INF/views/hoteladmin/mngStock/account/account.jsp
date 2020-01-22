<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 .top-div{
	width: 78%;
	height: 100px; 
	} 
	#Table{
	width:100%;
	border-collapse: collapse;
	}
	
	#filter{
	position: relative;
    bottom: 28px;
	}
	
	#Table td, #Table th{
	border: 1px solid lightgray;
		text-align: center;
		height: 33.1px;  
	}
	#Table th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	.searchCondition{
	margin-top: 32px;
	}
	.term{
	float:right;
	}
	#termId{
	margin-left: 10px;
	}
	#titlemsg{
		width: 220px;
		height: 36px;
		margin-top: 40px;
	}
	#filterDiv{
	margin-top: -20px;
	}
	#searchBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	#purSearch{
	border: 1px solid #919191;
	}
	#excel{
	background : white;
	color:gray;
	border: 1px solid gray;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
	#print{
	color:#3498DB;
	background : white;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	.btns{
	margin-top: 5px;
	margin-left: 63.7%;
	}
	#purDivv{
	height: 403.7px;
	border: 1px solid lightgray;
	width: 1000px;
	margin-top: 2px;
	}
	#line{
		width: 120px;
		border-bottom: 1px solid black;
	}
</style>
</head>
<body>
	
<header>	
	<jsp:include page="../../common/menubar.jsp"/>
	<jsp:include page="../../common/productMenubar.jsp"/>
	 <jsp:include page="../modal/mAccountDetail.jsp"/> 
	 <jsp:include page="../modal/mAccountEnroll.jsp"/> 
</header>
	<section id="sbody">

		<div class="top-div">
		<div id="titlemsg"><h1>거래처관리</h1></div>
		<div id=line></div>
		<div id="searchZone" style="width: 1000px;"> 
		<div>
			<select class="searchCondition"  id="purSearch" style="margin-left:70% ; height: 26px;">
				<option value="default">기본옵션</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px;">
		<button class="searchCondition" id="searchBtn">Search</button>
		</div>
		
		</div>
		</div><!-- top div end -->
		
	<div id="purDivv">
	<table id="Table">
			<tr>
				<th>No</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>대표자명</th>
				<th>전화번호</th>
				<th>거래항목</th>
				<th style="width:40px;">사용구분</th>
				<th style="width:80px;">이체정보</th> 
				<th style="width:300px;">주소</th>
			</tr>
			<c:forEach var="i" begin="1" end="10">
			<tr>
				<td><c:out value="${i}"/></td>
				<td><c:out value="1239123" /></td>
				<td><c:out value="김상찬거래처" /></td>
				<td><c:out value="김상찬" /></td>
				<td><c:out value="010-1234-5678" /></td>
				<td><c:out value="전자제품(tv)asdasdasd" /></td>
				<td><c:out value="YES" /></td>
				<td><c:out value="확인" /></td>
				<td><c:out value="경기도 의정부시 민락동 어디이이이인" /></td>
			</tr>  
			</c:forEach>
		</table>

	</div><!-- purDivv end -->
	<div class="btns"><button id="excel" style="width: 125px;">사용중단/재사용</button>&nbsp;<button id="print">신규</button></div>

	</section>
	
	
	<script>
	//테이블
	$(function(){
		$("#Table").find("td").mouseenter(function(){
			$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent("tr").css({"background":"white"});
		}).click(function(){
			var bid = $(this).parent().children("td").eq(1).text();
			$(".modal").fadeIn();
			console.log(bid);
		});
	});
	
	$("#mState").click(function(){
		$(".modalState").fadeIn();
	});
	
	$("#print").click(function(){
		$(".modalEnroll").fadeIn();
	});
	</script>
</body>
</html>