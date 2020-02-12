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
		height: 73px;
		width: 650px;
		overflow-y:auto; 
		margin-left: -15px;
	}
	.btnss,.btnss2{
	margin-top: 8px;
	margin-left: 74.5%;
	}
	.sb{
	display: inline-block;
	}
	.topbar{
	display: inline-block;
	float: right;
	}
	#topDivv{
	width: 1000px;
	
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
 	#newac,#newac2,#cancel,#ok{
 	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
 	} 
 	#newac2{
 	margin-left: 76px;
 	}
 	#newac{
 		margin-left: 76px;
 	}
	
</style>
</head>
<body>
	<header>
	</header>
	<div id="acDiv">
	<div id="topDivv">
		<button class="topbar" style="margin-left: 3px;width: 56px; " id="topBtn">검색</button>
		<div>
			<input type="text" class="topbar" style="border: 1px solid gray; height: 20px;">
		</div>
		
		<div>
			<select class="topbar" id="tb" style="height: 25px;">
				<option value="default" hidden="hidden">검색조건</option>
				<option value="name">예금주명</option>
				<option value="num">계좌번호</option>
			</select>
		</div>
	  
	</div>
	<div id="mainDiv" style="overflow: auto;">
	<form action="updateDetail.ac" id="updateDetail" method="post">
		<table id="TopTable">
			<tr>
				<th>은행명</th>
				<th>계좌번호</th>
				<th>예금주명</th>
				<th>비고</th>
			</tr>
			<tbody id="acTbody">
				<tr>
					<td id="acCnName">f</td>
					<td id="acAccount">f</td>
					<td id="acCnName">f</td>
					<td id="acMemo">f</td>
				</tr>
			</tbody>
				<tbody id="acTbody2">
				</tbody>
		</table>
		</form>
	</div><!-- end -->
	<div class="btnss"><button id="newac">신규</button><button id="newac2">수정</button></div>
	<div class="btnss2"><button id="cancel">취소</button>&nbsp;&nbsp;<button id="ok">완료</button></div>
	 
	</div>
	<footer>
	
	</footer>
	<script>
 	$(function(){
		/* $("#newac").hide();
		$("#newac2").hide(); */
		$(".btnss2").hide();
	}) 
	</script>
</body>
</html>