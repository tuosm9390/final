<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.titleSec {
	margin-top: 10px;
	display: inline-flex;
}

.titleSec h1 {
	margin-bottom: 0px;
	margin-top: 0px;
	margin-left: 20px;
}

.titleSec select {
	height: 25px;
	width: 100px;
	border: 1px solid lightgrey;
	margin-top: 5px;
	margin-left: 20px;
	border-radius: 2px;
}

hr {
	width: 100px;
	margin-right: 1465px;
	margin-bottom: 10px;
}

.topSec {
	margin-left: 20px;
	margin-top: 20px;
	display: inline-flex;
}

#today {
	height: 19px;
	width: 150px;
	margin-right: 20px;
	border: 1px solid lightgrey;
	border-radius: 2px;
}

#goYesterday, #goToday, #goTommorow {
	height: 25px;
	border: 1px solid lightgrey;
	color: dimgray;
	background-color: white;
	border-radius: 2px;
	
}

.searchSec {
	margin-top: 10px;
	margin-left: 850px;
} 

.searchSec select {
	height: 25px;
	width: 80px;
	border: 1px solid lightgrey;
	border-radius: 2px;
}

.searchContent {
	height: 19px;
	width: 200px;
	border: 1px solid lightgrey;
	border-radius: 2px;
}

#searchBtn {
	height: 25px;
	width: 50px;
	border: 1px solid #3498DB;
	background-color: #3498DB;
	color: white;
	font-weight: bold;
	border-radius: 2px;
}

.sticky-header th {
	position: sticky;
	top: -1px;
	left: 0;
	background-color: #f7f7f7;
}

.reservList {
	border: 1px solid dimgray;
	margin-left: 20px;
	margin-top: 10px;
	width: 1555px;
	height: 510px;
	max-height: 510px;
	overflow-y: auto;
}

.reservList th {
	background-color: #f7f7f7;
    color: #005B9E;
}

.reservList th, .reservList td {
	border: 1px solid dimgray;
	padding-top: 5px;
	padding-bottom: 5px;
}

.reservList td {
	text-align: center;
}

.reservList td:nth-child(1) {
	color: royalblue;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<jsp:include page="../mngRooms/modalCheckIn.jsp"></jsp:include>
		<div class="titleSec">
			<h1>예약내역</h1>
			<select name="serReservType">
				<option selected>전체 예약</option>
				<option>온라인 예약</option>
				<option>오프라인 예약</option>
			</select>
		</div>
		 
		<hr>
		<div class="topSec">
			<div class="dateSec">
				<label>영업일자</label>
				<input type="text" id="today" name="today">
				<button id="goYesterday">◀</button>
				<button id="goToday">오늘</button>
				<button id="goTommorow">▶</button>
			</div>
			<div class="searchSec">
				<select name="searchOption">
					<option selected disabled hidden>검색조건</option>
					<option value="">고객명</option>
					<option value="">전화번호</option>
					<option value="">객실번호</option>
					<option value="">객실유형</option>
				</select>
				<input type="text" name="searchContent" class="searchContent">
				<button id="searchBtn">검색</button>
			</div>
		</div>
		
		<div class="reservList">
			<table class="sticky-header" style="border-collapse: collapse;">
				<tr>
					<th width="119px">예약번호</th>
					<th width="140px">객실유형</th>
					<th width="110px">객실번호</th>
					<th width="110px">고객명</th>
					<th width="140px">전화번호</th>
					<th width="110px">입실일자</th>
					<th width="110px">퇴실일자</th>
					<th width="90px">총금액</th>
					<th width="90px">결제금액</th>
					<th width="170px">예약일시</th>
					<th width="170px">수정일시</th>
					<th width="80px">상태</th>
					<th width="119px">예약방법</th>
				</tr>
				<c:forEach var="i" begin="1" end="50">
					<tr>
						<td>20191234</td>
						<td>스위트 패밀리</td>
						<td>707</td>
						<td id="reservNo${ i }">김진호</td>
						<td>010-0000-0000</td>
						<td>2020-01-14</td>
						<td>2020-01-16</td>
						<td style="text-align: right;">1,000,000</td>
						<td style="text-align: right;">1,000,000</td>
						<td>2020-01-11 14:05:35</td>
						<td>2020-01-11 14:05:49</td>
						<td>확정예약</td>
						<td>온라인예약</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
	</section>

	<script>
		$(function(){
			var date = new Date;
			checkIn = $("#today").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					endNum = date;
				}
			}).data('datepicker');
			
			$("#reservNo1").parent().click(function(){
				$(".modal").fadeIn();
			});
		});
	</script>
</body>
</html>