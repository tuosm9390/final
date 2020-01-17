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
		height: 600px;
		border-collapse: collapse;
	} 
	th{
		background-color: #f0f0f0;
		height: 40px;
	}
	#mainDiv{
		height: 600px;
		border: 1px solid black;
		width: 1000px;
	}
	.btns{
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
		<div><b>이체정보리스트</b></div>  
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
	<div class="btns"><button>신규</button>&nbsp;<button>닫기</button></div> 
	</section>
	<footer>
	
	</footer>
</body>
</html>