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
		width: 1000px;
		height: 400px;
		border-collapse: collapse;
	} 
	th{
		background-color: #f7f7f7;
		color: #005B9E;
		height: 40px;
	}
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	
	}
	
	#mainDiv{
		height: 600px;
		border: 1px solid black;
		width: 1000px;
	}
	.btnss{
	margin-top: 5px;
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
</style>
</head>
<body>
	<header>
	</header>
	<section>
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
	<div id="hr"></div>
	<div id="mainDiv" style="overflow: auto;">
		<table border="1px solid black;" id="TopTable">
			<tr>
				<th>은행코드</th>
				<th>은행명</th>
				<th>계좌번호</th>
				<th>예금주명</th>
				<th>비고</th>
			</tr>
			<c:forEach var="i" begin="1" end="10">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div><!-- end -->
	<div class="btnss"><button>신규</button>&nbsp;<button>닫기</button></div> 
	</section>
	<footer>
	
	</footer>
	<script>
		
	</script>
</body>
</html>