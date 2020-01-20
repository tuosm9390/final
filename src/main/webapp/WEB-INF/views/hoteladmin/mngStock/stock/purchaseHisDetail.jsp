<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매상세</title>
<style>
	.top-divv{
		background-color: #f7f7f7;
		width:1100px;
		margin-bottom: 20px;
	} 
	.same{
	display: inline-block;

	}
	#person{
	
	}
	#resultTap{
	background-color: #f7f7f7;
	
	height: 30px;
	}
	#Tablee {
	width: 1200px;
	border-collapse: collapse;
	}
	#day1{
	margin-left: 35px;
	}
	
	#person1{
	margin-left: 19px;
	}
	#etc{
	margin-left: 50px;
	}
	#etcText{
	margin-left: 20px;
	}
	#Tablee th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	#Tablee td,#Tablee th{
		border: 1px solid lightgray;
		text-align: center;
	}
	#mainMsg{
	font-size: 20px;
	}
	.hrodiv{
	width: 1220px;
	border-bottom: 1px solid black;
	margin-bottom: 10px;
	}
	#hrodiv2{
	margin-top: 10px;
	}
</style>
</head>
<body>
	
	<section>
	<div class="hrodiv"></div>
		<div class="top-divv">
		<div id="day" class="same">
			일자
			<input type="text" id="day1" name="day1">
			<input type="text" id="day2" name="day2">
			<input type="text" id="day3" name="day3">
		</div>
		   <div id="etc" class="same">비고사항 <input type="text" id="etcText">
		</div>
			<br> 
			<div id="person" >
			담당자
			<input type="text" id="person1" name="person1">
			<input type="text" name="person2" id="person2">
			</div>
		</div><!-- top-div end -->
		<table id="Tablee" border="1px solid black;">
			<tr>
				<th>NO</th>
				<th>번호</th>
				<th>대분류</th>
				<th>중분류</th>
				<th>소분류</th>
				<th>제품명</th>
				<th>단가</th>
				<th>공급가액</th>
				<th>부가세</th>
				<th>비고</th>
				<th>입고창고</th>
				<th>거래처</th>
			</tr>
			<!-- 실사용은 list size -->
			<c:forEach var="i" begin="1" end="10">
			<tr>
				<td>${i }</td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td> 
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
			</tr>
			</c:forEach>
			<tr id="resultTap">
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
			</tr>
		</table>
		<div class="hrodiv" id="hrodiv2"></div>
		<div class="btns"><button>전표</button>&nbsp;<button>다시작성</button></div>
		
		
	</section>
	<footer>
	</footer>
	
</body>
</html>