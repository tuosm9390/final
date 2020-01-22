<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.site-outer{
	width: 90%;
	margin-left: 5%;
}

.searchArea{
	background: #F3F3F3;
	width: 100%;
}

.spend{
	margin-left: 10px;
}

.price{
	text-align: right;
}

.date{
	text-align: center;
}
.list-table{
	text-align: center;
	border-collapse: collapse;
}

.list-table td, th{
	padding: 10px;
}
.list-table tr{
	height: 30px;
}

.list-table th{
	background: #F3F3F3;
}

.list-table tr td:nth-child(3){
	text-align: left;
}

.list-table tr td:nth-child(6){
	text-align: right;
}

.list-table td:not(:last-child), .list-table th:not(:last-child){
	border-right: 1px solid #D9D9D9;
}

.list-table tr:last-child{
	background: #DBDBDB;
}

.analysMenubar div {
	display: inline-block;
	width: 80px;
	height: 31px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	background-color: white;
	color: black;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.analysMenubar>div:hover{
	background: #3498DB;
	color: white;
	cursor: pointer;
}

.analys-item{
	line-height: 30px;
}

#hrDiv{
	border-bottom: 1px solid lightgray;
	width: 100%;
}

.excel-btn{
	background: white;
    color: green !important;
    width: 68px;
    height: 25px;
    border-radius: 2px;
    line-height: 30px;
}

.excel-btn:hover{
	background: green !important;
	color: white !important;
}

input[type=text], select{
	width: 100px;
	border: 1px solid lightgray;
	padding: 0;
	border-radius: 3px;
	height:23px;
}
</style>
</head>
<body>
	<header>
<%-- 		<jsp:include page="../common/analysMenubar.jsp"/> --%>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
		<c:set var="price" value="300000"></c:set>
		<c:set var="sum" value="0"></c:set>
		<div class="site-outer">
			<div class="analysMenubarArea">
				<div class="analysMenubar">
					<div id="sales"
						class="analys-item sales ${ Condition eq 'sales' ? '_active' : '' }">매출
						상세</div>
					<div id="spend"
						class="analys-item spend ${ Condition eq 'spend' ? '_active' : '' }">지불
						상세</div>
					<div class="excel-btn" style="float: right;">엑셀</div>
					<input id="excel" type="file" style="display: none;">
				</div>
				<div id="hrDiv" style="background-color: lightgray; color: lightgray"></div>
			</div>
			<br>
			<!-- 매출 상세 -->
			<c:if test="${ Condition eq 'sales' }">
			<!-- 검색 영역 -->
			<div class="searchArea" align="right">
				<select class="searchCondition">
					<option value="sales">매출일자</option>
					<option value="checkIn">입실일자</option>
					<option value="checkOut">퇴실일자</option>
				</select>
				
				<input type="text" class="date" id="datepicker" readonly> - 
				<input type="text" class="date" id="datepicker2" readonly>
			</div>
			<!-- 검색 영역 끝 -->
			<br>
			<!-- 테이블 영역 -->
			<table class="list-table" style="width: 100%;">
				<tr>
					<th>객실번호</th>
					<th>예약번호</th>
					<th>고객명</th>
					<th>입실일자</th>
					<th>퇴실일자</th>
					<th>매출 금액</th>
					<th>매출 일자</th>
					<th>비고</th>
				</tr>
				<c:forEach var="i" begin="1" end="10" step="1">
				<tr>
					<td>0701</td>
					<td>20200118</td>
					<td>남윤진</td>
					<td>2020-01-19</td>
					<td>2020-01-12</td>
					<td>${ price }</td>
					<td>2020-01-10</td>
					<td></td>
				</tr>
				<c:set var="sum" value="${ sum + price }"></c:set>
				</c:forEach>
				<tr>
					<td>합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>${ sum }</td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<!-- 테이블 영역 끝 -->
			</c:if>
			<!-- 지불 상세 -->
			<c:if test="${ Condition eq 'spend' }">
			<!-- 검색 영역 -->
			<div class="searchArea" align="right">
				<label>지불 일시</label>
				<input type="text" class="date" id="datepicker" readonly> - 
				<input type="text" class="date" id="datepicker2" readonly>
			</div>
			<!-- 검색 영역 끝 -->
			<br>
			<!-- 테이블 영역 -->
			<table class="list-table" style="width: 100%;">
				<tr>
					<th>분류</th>
					<th>소분류</th>
					<th>거래담당자</th>
					<th>지불수단</th>
					<th>지불일시</th>
					<th>지불 금액</th>
					<th>담당직원</th>
					<th>비고</th>
				</tr>
				<c:forEach var="i" begin="1" end="10" step="1">
				<tr>
					<td>고객</td>
					<td>환불</td>
					<td>남윤진</td>
					<td>계좌이체</td>	
					<td>2020-01-09</td>
					<td>${ price }</td>
					<td>송기준</td>
					<td>예약번호 : 2001806</td>
				</tr>
				<c:set var="sum" value="${ sum + price }"></c:set>
				</c:forEach>
				<tr>
					<td>합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>${ sum }</td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<!-- 테이블 영역 끝 -->
			</c:if>
		</div>
	</section>
	<footer>
	</footer>
	<script>
		$("#datepicker").datepicker({
			autoClose : true,
		});
		$("#datepicker2").datepicker({
			autoClose : true,
		});
		
		$(function(){
			$("._active").css({"background":"#3498DB", "color":"white"});
		});
		
		$(".analys-item").click(function(){
			var Condition = $(this).attr('id');
			location.href='viewDetailList.hadmin?Condition=' + Condition;
		});
		
		$(".excel-btn").click(function(){
			$("#excel").click();
		});
	</script>
</body>
</html>