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

	width: 70.2%; 
	margin-left: 17%;
	height: 100px; 
	}
	#Table{
	width: 1100px;
	border-collapse: collapse;
	margin-left: 17%;
	}
	#sbody{
	margin-left: 17%;
	}
	  
	 
	td,th{
	text-align: center;
	border: 1px solid black;
	}
	tr{
	border: 1px solid black;
	}
	.searchCondition{
	float: right;
	margin-top: -50px;
	}
	.btns{
	margin-left: 17%;
	}
	.selectbar{
	float:right;
	}
</style>
</head>
<body>
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
	<header>	
		<div class="top-div">
		<h1>거래처관리</h1>
		<select class="selectbar">
			<option>이체정보</option>
			<option>사용구분</option>
		</select>
		<input type="text" name="serachCondition" class="searchCondition">
		&nbsp;<button class="searchCondition">검색</button>
		</div><!-- top div end -->
	</header>
	<section>
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
				<td><c:out value="경기도 의정부시 민락동 어디이이이인가 19123.123" /></td>
			</tr>  
			</c:forEach>
		</table>
			<div class="btns"><button>신규</button>&nbsp;<button>사용중단/재사용</button></div>
	</section>
	
	<footer>
	
	</footer>
</body>
</html>