<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrapp{
	width: 800px;
	height: 620px;
	border-radius: 5px;
	border: 1px solid black;
	}
	#imgDiv{
	margin-left: 10px;
	margin-top: 10px;
	width: 200px;
	}
	.same{
	display: inline-block;
	}
	#topInfo{
	width: 250px; 
	height: 70px;
	margin-left: 40px;
	font-size: 15px;
	}
	.btns{
	margin-left: 10px;
	width: 200px;
	height: 60px;
	}
	#rightBtn{
	margin-left: 10px;
	}
	.hrDiv{
	width: 800px;
	margin-top: 5px;
	border-bottom: 1px solid black;
	}
	.bodyEq{
	border-bottom: 1px solid lightgray;
	width: 370px; 
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	font-size: 17px;
	font-weight: bold;
	margin-top: 10px;
	}
	.valueEq{
		margin-left: 20px;
		
	}
	input[type=text]{
	width: 260px;
	}
	#botDiv{
	width: 763px;
	border-bottom: 1px solid lightgray;
	height: 30px;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 17px;
	font-weight: bold;
	} 
	#botTable{
	width: 760px;
	height: 200px;
	margin-left: 10px;
	margin-top: 10px;
	}
	#botTable2 td, #botTable2 th{ 
		border: 1px solid lightgray;
		text-align: center;
	}  
	#botTable2 th{
	background-color: #f7f7f7;
	color: #005B9E;
	height: 40px;
	width: 100%;
	}
	#botTable2{
	border-collapse: collapse;
	width: 760px;
	height: 100%;
	} 
	.botText{
	width: 760px;
	height: 70px;
	margin-left: 10px;
/* 	margin-top: 10px; */
	}
	.botEq{
	height: 90px;
	display: inline-table;
	}
	#infoTable{
	   position: relative;
    bottom: -7px;
    left:-19px;
    width: 500px;
	}
	#saveBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	font-weight: bold;
	width: 60px;
	float: right;
	margin-top: 11px;
	}
	
	
	
</style>
</head>
<body>
	<header>
		<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
		<jsp:include page="../common/settingMenubar.jsp"/>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
	<h1>영수증</h1>
	<div class="wrapp">
		<div id="topInfo"class="same">
			<table id="infoTable">
				<tr>
					<td><c:out value="Boutique"/></td>
				</tr>
				<tr>
					<td><c:out value="Tel)01033376811"/></td>
				</tr>
				<tr>
					<td><c:out value="경기도 하남시 신창동 442-20번지 201호"/></td>
				</tr>
				<tr>
					<td><c:out value="사업자명 : Boutique"/></td>
				</tr>
				<tr>
					<td><c:out value="사업자번호 : 1211-14442-1123"/></td>
				</tr>
			</table>
		</div>
		<div class="btns"></div>
		<div align="right" style="color: blue; margin-right: 10px;">* 부가가치세법 제32조 1항 규정에 의한 영수증</div>
		<div class="hrDiv"></div>
		
		<!-- 반복 -->
		<div class="bodyEq">Guest Name<label style="margin-left: 40px;">홍길동</label></div>
		<div class="bodyEq" id="rightEq">Folio No<label style="margin-left: 50px;">123455</label></div> 
		<!-- ㅇㅇ -->
		<div class="bodyEq">Account<label style="margin-left: 70px;">Sanha Tour</label></div>
		<div class="bodyEq" id="rightEq">Room No<label style="margin-left: 43px;">501-2</label></div>
		
		<div class="bodyEq">Arrival<label style="margin-left: 80.5px;">2018-03-12</label></div> 
		<div class="bodyEq" id="rightEq">Departure<label style="margin-left: 34px;">2018-03-12</label></div>
		
		<div id="botDiv">Address<label style="width: 500px; margin-left: 72px;" >서울 금천구 디지털로 9길 대룡포스트타워 5차 1501호</label></div>
		
		<div id="botTable">
			<table id="botTable2">
				<tr>
					<th>Date</th>
					<th  style="width:200px;">Description</th>
					<th  style="width:200px;">Amount</th>
					<th  style="width:200px;">Reference</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				
			</table>
		</div>
		<div class="hrDiv"></div>
		<div class="botText">
			<div class="botEq" style="width: 460px;">
			<label style="margin-top: 10px;color: blue;font-size: 12px;">i agree that my liability for this bill is not walved
			and agree to be held personally liable in the event that the indicated person, company or association fails to pay for any or the fulll amount of these charges.
			</label>
			</div>
			
			
			<div class="botEq" style="width:220px; margin-left: 10px">
			<label>Guest Signature</label>
				<div style="border-bottom: 1px solid black; width: 200px; margin-top: 30px; margin-left: 10px"></div>
			</div>
		</div>
	<div class="btnss">
		<button id="saveBtn">수정</button>
	</div>
	
	</div>
	</section>
		<script> 
	$(function(){
		$("#addBtn").click(function(){
			$("#addBtn2").click();
		})
	})
	</script>
	
</body>
</html>