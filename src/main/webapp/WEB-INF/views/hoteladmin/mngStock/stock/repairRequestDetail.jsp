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
		width:735px; 
		margin-bottom: 20px;
	}
	.samee{
	display: inline-block;

	}
	
	#resultTap{
	background-color: lightgray;
	
	height: 30px;
	}
	#Table {
	width: 1200px;
	border-collapse: collapse;
	}
	
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	
	#day1{
	margin-left: 35px;
	}
	.person{
	display: inline-block;
	}
	#person1{
	margin-left: 19px;
	} 
	#etc{
	margin-left: 50px;
	}
	#etcText{
	margin-left: 26px;  
	}
	#titlemsg{
	font-size: 20px;
	}
	.hrhr{
	border-bottom: 1px solid black;
	width: 1200px;
	margin-bottom: 10px;
	margin-top: 10px;
	}
	#request{
	margin-left: 220px;
	}
</style>
</head>
<body>
	<header>
	
	</header>
	<div class="hrhr"></div>
	
	
	
	    <div class="top-divv">
		<div id="day" class="samee">
			일자
			<input type="text" id="day1" name="day1">
			<input type="text" id="day2" name="day2">
			
		</div>
		   <div id="etc" class="samee">거래처 <input type="text" id="etcText">
		</div>
			<br> 
			<div class="person" >
			결제자
			<input type="text" id="person1" name="person1">
			
			</div>
			<div class="person" id="request">
			수리번호
			<input type="text" id="person1" name="person1">
			</div>
		</div><!-- top-div end -->
		
		
		<table id="Table" border="1px solid black;">
			<tr>
				<th><input type="checkbox"></th>
				<th>NO</th>
				<th>번호</th>
				<th>대분류</th>
				<th>중분류</th>
				<th>소분류</th>
				<th>제품번호</th>
				<th>공급가액</th>
				<th>부가세</th>
				<th>수리비용</th>
				
			</tr>
			<!-- 실사용은 list size -->
			<c:forEach var="i" begin="1" end="10">
			<tr>
				<td><input type="checkbox"></td>
				<td>${i }</td>
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
			</tr>
		</table>
		<div class="hrhr"></div>
		<div class="btn"><button>확인</button></div>
		
		
	<footer>
	</footer>
	
</body>
</html>