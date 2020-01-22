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

.searchSec {
	margin-left: 1100px;
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

hr {
	width: 100px;
	margin-right: 1465px;
	margin-bottom: 10px;
}

.topSec {
	margin-left: 20px;
	margin-top: 10px;
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

.statusSec>div {
	display: inline-flex;
	margin-right: 5px;
	margin-left: 5px;
	margin-top: 10px;
}

.statusSec {
	display: inline-flex;
	margin-top: -15px;
	margin-left: 130px;
}

.stColor {
	width: 30px;
	height: 30px;
	border-radius: 5px 0px 0px 5px;
}

.lightgrey {
	background-color: lightgrey;
}

.lightsteelblue {
	background-color: lightsteelblue;
}

.gold {
	background-color: gold;
}

.mediumseagreen {
	background-color: mediumseagreen;
}

.coral {
	background-color: coral;
}

.darkgray {
	background-color: darkgray;
}

.stNoClean {
	border-bottom: 30px solid transparent;
	border-left: 30px solid red;
}

.stClean {
	border-bottom: 30px solid transparent;
	border-left: 30px solid cornsilk;
}

.stInfo>div {
	border: 1px solid lightgrey;
}

.stInfo:nth-child(1)>div:nth-child(2), .stInfo:nth-child(3)>div:nth-child(2),
	.stInfo:nth-child(4)>div:nth-child(2), .stInfo:nth-child(6)>div:nth-child(2),
	.stInfo:nth-child(8)>div:nth-child(2) {
	width: 50px;
	height: 26px;
	padding-top: 4px;
	padding-left: 3px;
	border-left: none;
	border-right: none;
}

.stInfo:nth-child(2)>div:nth-child(2), .stInfo:nth-child(5)>div:nth-child(2),
	.stInfo:nth-child(7)>div:nth-child(2) {
	width: 70px;
	height: 26px;
	padding-top: 4px;
	padding-left: 3px;
	border-left: none;
	border-right: none;
}

.stInfo>div:nth-child(3) {
	width: 30px;
	height: 26px;
	text-align: center;
	padding-top: 4px;
	border-radius: 0px 5px 5px 0px;
}

.reservTable {
	border: 1px solid dimgray;
	margin-left: 20px;
	margin-top: 10px;
	width: 1555px;
	height: 510px;
	max-height: 510px;
	overflow-y: auto;
}

.sticky-header th {
	position: sticky;
	top: -1px;
	left: 0;
	background-color: #f7f7f7;
}

.reservTable th {
	background-color: #f7f7f7;
}

.reservTable th, .reservTable td {
	border: 1px solid lightgrey;
	padding: 10px;
}

.reservTable td:nth-child(1) {
	text-align: center;
}

.roomType {
	font-weight: bold;
	color: royalblue;
	border-left: none;
}

.reservTable td:nth-child(1) {
	background-color: #f7f7f7;
}

.reservTable .roomType {
	
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
			<h1>예약현황</h1>
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
		 
		<hr>
		<div class="topSec">
			<div class="dateSec">
				<label>영업일자</label>
				<input type="text" id="today" name="today">
				<button id="goYesterday">◀</button>
				<button id="goToday">오늘</button>
				<button id="goTommorow">▶</button>
			</div>
			
			<!-- statusSec -->
			<div class="statusSec">
				<div class="stInfo"><div class="stColor lightgrey"></div><div id="stEmpty">공실</div><div>00</div></div>
				<div class="stInfo"><div class="stColor lightsteelblue"></div><div id="stReserv">입실예정</div><div>00</div></div>
				<div class="stInfo"><div class="stColor gold"></div><div id="stRent">대실</div><div>00</div></div>
				<div class="stInfo"><div class="stColor mediumseagreen"></div><div id="stSleep">투숙</div><div>00</div></div>
				<div class="stInfo"><div class="stColor coral"></div><div id="stOut">퇴실예정</div><div>00</div></div>
				<div class="stInfo"><div class="stColor"><div class="stClean"></div></div><div id="stClean">정비</div><div>00</div></div>
				<div class="stInfo"><div class="stColor"><div class="stNoClean"></div></div><div id="stUnclean">미정비</div><div>00</div></div>
				<div class="stInfo"><div class="stColor darkgray"></div><div id="stBroken">고장</div><div>00</div></div>
			</div>
			<!-- statusSec end -->
		</div>
		
		<div class="reservTable">
			<table class="table sticky-header" style="border-collapse: collapse;">
				<tr>
					<th width="100px;">번호</th>
					<th width="330px;">침대</th>
					<th width="80px;" style="color: red;">01/19<br>일</th>
					<th width="80px;">01/20<br>월</th>
					<th width="80px;">01/21<br>화</th>
					<th width="80px;">01/22<br>수</th>
					<th width="80px;">01/23<br>목</th>
					<th width="80px;">01/24<br>금</th>
					<th width="80px;" style="color: blue;">01/28<br>토</th>
					<th width="80px;" style="color: red;">01/19<br>일</th>
					<th width="80px;">01/20<br>월</th>
					<th width="80px;">01/21<br>화</th>
					<th width="80px;">01/22<br>수</th>
					<th width="80px;">01/23<br>목</th>
					<th width="80px;">01/24<br>금</th>
					<th width="80px;" style="color: blue;">01/25<br>토</th>
				</tr>
				<tr>
					<td style="border-right: 1px solid white; background-color:white;"></td>
					<td colspan="15" class="roomType">스위트</td>
				</tr>
				<c:forEach var="i" begin="1" end="10">
					<tr>
						<td>701</td>
						<td>스위트 더블</td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
					</tr>
				</c:forEach>
				<tr>
					<td style="border-right: 1px solid white; background-color:white;"></td>
					<td colspan="15" class="roomType">디럭스</td>
				</tr>
				<c:forEach var="i" begin="1" end="10">
				<tr>
						<td>501</td>
						<td>디럭스 더블</td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
					</tr>
				</c:forEach>
				<tr>
					<td style="border-right: 1px solid white; background-color:white;"></td>
					<td colspan="15" class="roomType">스탠다드</td>
				</tr>
				<c:forEach var="i" begin="1" end="10">
					<tr>
						<td>201</td>
						<td>스탠다드 싱글</td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
						<td class="emptyroom"></td>
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
			
		});
		
		$("tr").children(".emptyroom").click(function(){
			$(".modal").fadeIn();
		});
	</script>
</body>
</html>