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
	width: 63.7%;
	margin-left: 17%; 
	height: 100px; 
	margin-top: -50px;
	}

	.searchCondition{

	margin-top: -50px;
	display: inline-block; 
	width: 100px;
	
	}

	#titlemsg{
		width: 220px;
		height: 50px;
		margin-top: 60px;
	
	}
	#searchZone{
	float: right;
	}
	#stockTb2{
	width: 900px;
	height: 560px;
	border-collapse: collapse;
	border: 1px solid black;
	margin-left: 17%;
	}
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	#hrDiv2{
	border-bottom: 1px solid black;
	width: 1000px;
	margin-left: 17%;
	margin-top: 20px;
	}
	.btns{
	margin-left: 17%;
	margin-top: 10px;

	}
	.tabClass{
	display: inline-block;
	width: 120px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px 10px 0px 0px;
	border-bottom: none;
	font-weight: bold;

	}
	#tclass{
	margin-left: 20px;
	}
	#hrDiv3{
	margin-bottom: 20px;
	border-bottom: 1px solid black;
		width: 1000px;
		margin-left: 17%;
	}
	#mainmsg{
	font-size: 20px;
	margin-left: 17%;
	margin-bottom: 10px;
	}

	
</style>
</head>
<body>
	<header>
	</header>
	<section>
	<div id="mainmsg">물품상세</div>
	<div id="hrDiv3"></div>
		<div>
			<table id="stockTb2">  
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">대분류</th>
					<th style="color: #005B9E">중분류</th>
					<th style="color: #005B9E">소분류</th>
					<th style="color: #005B9E">제품번호</th>
					<th style="color: #005B9E">공급가액</th>
					<th style="color: #005B9E">부가세</th>
					<th style="color: #005B9E">단가</th>
					<th style="color: #005B9E">제조사</th>
				</tr>
				<c:forEach var="i" begin="1" end="10">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="품목코드"/></td>
						<td style="color: #005B9E"><c:out value="익스트림 울트라 명품조립 pc"/></td>
						<td><c:out value="소분류"/></td>
						<td><c:out value="재고수량"/></td>
						<td><c:out value="공급가액"/></td>
						<td><c:out value="제조사"/></td>
						<td><c:out value="매입처"/></td>
						<td><c:out value="품목구분"/></td>
					</tr>
				</c:forEach>
			</table>
		<div id="hrDiv2"></div>
		</div>
	</section>
</body>
</html>