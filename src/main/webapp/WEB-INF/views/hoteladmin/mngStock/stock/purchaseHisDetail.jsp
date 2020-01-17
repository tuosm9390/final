<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매상세</title>
<style>
	.top-div{
		background-color: lightgray;
		width:1100px;
		margin-bottom: 20px;
	} 
	.same{
	display: inline-block;

	}
	#person{
	
	}
	#resultTap{
	background-color: lightgray;
	
	height: 30px;
	}
	#Table {
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
</style>
</head>
<body>
	<header><h1><u>구매 상세</u></h1></header>
	<hr>
	<section>
		<div class="top-div">
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
		<table id="Table" border="1px solid black;">
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
		<hr>
		<div class="btns"><button>수정</button>&nbsp;<button>다시작성</button></div>
		
		
	</section>
	<footer>
	</footer>
	
</body>
</html>