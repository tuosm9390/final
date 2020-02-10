<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<style>
	.bodyDiv{
	margin-top:10px; 
	width: 760px;
	height: 200px;
	margin-bottom: 10px;
	} 
	#botTable{
	border-collapse: collapse;
	width: 100%;
	}
	.same{
	display: inline-block; 

	margin-top: 20px;
	}
	#sam{
	width: 540px; 
	}
	#ssam{
	width:100px;
	}
	#search{
	width:100px;
	margin-left: 110px;
	color: blue;
	}
	#textArea{
	margin-left: 65px; 
	border-radius: 3px;
	}
	input[type=text]{
	border-radius: 2px;
	}
	.btn{
	margin-top: 10px;
	border-radius: 3px; 
	width: 926px;
	}
	.imgDiv{
	font-size: 20px;
	}
	.divhr{
	width: 760px;
	border-bottom: 1px solid black;
	margin-top: 3px;
	}
	#botTable td,#botTable th{
		border: 1px solid lightgray;
		text-align: center;
	}
 	#botTable th{ 
	background-color: #f7f7f7;
	color: #005B9E;
	}
	#botTableDiv{
	width: 710px;
	height: 170px;
	border: 1px solid gray;
	overflow-y:auto;
	
	}
	#wareWrap{
	margin-left: 30px;
	}
	#reBtn2{
	background: white;
	color: #3498DB;
	border: 1px solid #3498DB;
	font-weight: bold;
	height: 25px;
	margin-left: 61.9%;
	}
	#enrollBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
</style>
</head>
<body>
	<header>
	</header>
		<div id="wareWrap">
		<div class="bodyDiv">
		<form action="update.war" method="post" id="updateWar">
		<div>	<div class="same" id="ssam">창고코드</div>  <div class="same"><input type="text" class="space" style="width:300px"  id="detailCode" name="strgNo" readonly="readonly"></div>  </div>
		<div>	<div class="same" id="ssam">창고명</div>  <div class="same"><input type="text" class="space" style="width:300px" id="detailName" name="strgName"></div>  </div>
		<div>	<div class="same" id="ssam">사용여부</div>  <div class="same"><input type="radio"  value="Y" id="yCheck" name="strgStatus">사용 &nbsp;&nbsp;<input type="radio" name="strgStatus" value="N" id="nCheck">미사용</div>  </div>
		<div>	<div class="same" id="ssam">창고위치</div>  <div class="same"><input type="text" class="space" style="width:300px" id="detailArea" name="strgSite" ></div>  </div>
		</form>
		</div><!-- end -->
		<div id="botTableDiv">
	
			<table id="botTable">
				<tr>
					
					<th>물품코드</th>			
					<th>물품명</th>			
					<th>개별수량</th>			
					<th style="width: 150px;">위치명</th>			
				</tr>
				<tbody id="dTbody">
				<c:forEach var="i" items="${detailList}">
					<tr>
						
						<td>${i.ino}</td>
						<td>${i.iName}</td>
						<td>${i.amount}</td>
						<td>${i.areaName }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</div>
	  
		<div class="btn">
	
		<button id="reBtn2">다시작성</button>
		<button id="enrollBtn">저장</button>
		</div> 
		</div>
</body>
</html>