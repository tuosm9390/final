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
	margin-left: 450px;
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

.stInfo div:nth-child(2) {
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

.emptyroom {
	padding-left: 0px !important;
	padding-right: 0px !important;
}

.halfCI, .halfCO {
	display: inline-block;
	width: 46.5px;
	height: 19px;
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
				<div class="stInfo"><div class="stColor darkgray"></div><div id="stBroken">고장</div><div>00</div></div>
			</div>
			<!-- statusSec end -->
		</div>
		
		<div class="reservTable">
			<table class="table sticky-header" style="border-collapse: collapse;">
				<tr>
					<th width="100px;">객실</th>
					<th width="330px;">유형</th>
					<c:forEach var="i" begin="1" end="14">
						<th width="80px;"></th>
					</c:forEach>
				</tr>
				<c:set var="rtName" value="0" />
				<c:forEach var="r" items="${ roominfo }">
					<c:if test="${ r.rtName ne rtName }">
						<c:set var="rtName" value="${ r.rtName }" />
						<tr>
							<td style="border-right: 1px solid white; background-color:white;"></td>
							<td colspan="15" class="roomType">${ r.rtName }</td>
						</tr>
					</c:if>
					<tr class="emptyroomTR">
						<td>${ r.rmNum }</td>
						<td>${ r.rtName }</td>
						<c:forEach var="i" begin="1" end="14">
							<td class="emptyroom" id="${ r.rmNum }"><div class="halfCO"></div><div class="halfCI"></div></td>
						</c:forEach>	
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<script>
		var roomlist;
		
		$(function(){
			var date = new Date;
			checkIn = $("#today").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					endNum = date;
				}
			}).data('datepicker');
			
			roomlist = JSON.parse('${jsonList}');
			console.log(roomlist);
			
			for(var i = 0; i < 14; i++) {
				var week = new Array('일', '월', '화', '수', '목', '금', '토');
				var viewday = new Date();
				viewday.setDate(viewday.getDate() + i);
				
				var viewdayD = week[viewday.getDay()];
				var viewdayS = ((viewday.getMonth()+1)>9?(viewday.getMonth()+1):("0"+(viewday.getMonth()+1))) + "/" + (viewday.getDate()>9?viewday.getDate():("0"+viewday.getDate()));
				var viewdayID = viewday.getFullYear() + "-" + ((viewday.getMonth()+1)>9?(viewday.getMonth()+1):("0"+(viewday.getMonth()+1))) + "-" + (viewday.getDate()>9?viewday.getDate():("0"+viewday.getDate()));
				
				$(".reservTable tr").eq(0).children().eq(2 + i).text(viewdayS + "(" + viewdayD + ")");
				if(viewdayD == '일') {
					$(".reservTable tr").eq(0).children().eq(2 + i).css('color', 'red');
				} else if(viewdayD == '토') {
					$(".reservTable tr").eq(0).children().eq(2 + i).css('color', 'blue');
				}
				
				$(".reservTable .emptyroomTR").each(function(){
					$(this).children().eq(2 + i).attr('id', $(this).children().eq(2 + i).attr('id') + "/" + viewdayID);
				});
			}
			
			for(var i = 0; i < roomlist.length; i++) {
				
				var rmNum = roomlist[i].rmNum;
				<td class="emptyroom" id="${ r.rmNum }"><div class="halfCO"></div><div class="halfCI"></div></td>

				//고장객실
				if(roomlist[i].brkBegin != '' && roomlist[i].brkEnd != '') {
					var brkBegin = strToDate(roomlist[i].brkBegin);
					var brkEnd = strToDate(roomlist[i].brkEnd);
					var distance = (brdEnd.getTime() - brkBegin.getTime()) / 1000 / 60 / 60 / 24;
					for(int j = 1; j < distance; j++) {
						var tempday = brkBegin;
						tempday.setDate(tempday.getDate() + j);
					}
				}
				
				//예약객실
				if(roomlist[i].rcheckin != '' && roomlist[i].rcheckout != '') {
					
				}
				
				//숙박객실
				if(roomlist[i].scheckin != '' && roomlist[i].scheckout != '') {
					
					//대실객실
					if(roomlist[i].scheckin == roomlist[i].scheckout) {
						
					}
				}
				
			}
			
		});
		
		function strToDate(str) {
			var year = str.substr(0,4);
			var month = str.substr(5,7) * 1 - 1;
			var day = str.substr(8,10);
			var date = new Date(year, month, day);
			return date;
		}
		
		function dateToStr(date) {
			var year = date.getFullYear();
			var month = (date.getMonth()+1)>9?(date.getMonth()+1):"0"+(date.getMonth()+1);
			var day = date.getDate()
		}
		
		$("tr").children(".emptyroom").click(function(){
			$(".modal").fadeIn();
		});
	</script>
</body>
</html>