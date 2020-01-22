<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#TopTable{
		width: 100%;
		border-collapse: collapse;
	} 
	#TopTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		height: 40px;
	}
	#TopTable td,#TopTable th{
		border: 1px solid lightgray;
		text-align: center;
		height: 31px;
	
	}
	
	#mainDiv{
		height: 400px;
		width: 1000px;
		overflow-y:auto; 
		border: 1px solid lightgray;
	}
	.btnss{
	margin-top: 8px;
	margin-left: 89%;
	}
	.topbar{
	display: inline-block;
	float: right;
	}
	#topDivv{
	width: 1000px;
	height: 30px;
	}
	#hr{
	border-bottom: 1px solid black;
	width: 1000px;
	margin-bottom: 5px;
	}
	#tb{
	margin-right: 5px;
	height:21px; 
	}
	#acDiv{
	margin-left: 40px;
	margin-top: 24px;
	}
	#newac{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	width: 60px;
	}
</style>
</head>
<body>
	<header>
	</header>
	<div id="acDiv">
	<div id="topDivv">
		<div>
			<input type="text" class="topbar">
		</div>
		
		<div>
			<select class="topbar" id="tb">
				<option>ff</option>	
				<option>ff</option>
			</select>
		</div>
	  
	</div>
	<div id="mainDiv" style="overflow: auto;">
		<table id="TopTable">
			<tr>
				<th>은행코드</th>
				<th>은행명</th>
				<th>계좌번호</th>
				<th>예금주명</th>
				<th>비고</th>
			</tr>
			<c:forEach var="i" begin="1" end="1">
				<tr>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
				</tr>
			</c:forEach>
		</table>
	</div><!-- end -->
	<div class="btnss"><button id="newac">신규</button></div> 
	</div>
	<footer>
	
	</footer>
	<script>
		
	</script>
</body>
</html>