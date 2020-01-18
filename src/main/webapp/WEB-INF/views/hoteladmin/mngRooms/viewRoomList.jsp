<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.searchSec {
	float: right;
	display: inline;
}

select {
	height: 25px;
	width: 80px;
	border: 1px solid lightgrey;
}

.searchContent {
	height: 19px;
	width: 200px;
	border: 1px solid lightgrey;
}

#searchBtn {
	height: 25px;
	width: 60px;
	border: 1px solid lightgrey;
}

.floorBtn, #allFloor {
	height: 50px;
	width: 50px;
	border-radius: 100%;
	border: 3px solid #EAC064;
	background-color: white;
	font-weight: bold;
}

.statusSec>div {
	display: inline-flex;
	margin-right: 5px;
	margin-left: 5px;
	margin-top: 10px;
}

.statusSec {
	display: inline-flex;
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

.stInfo>div:nth-child(2) {
	width: 87px;
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

.selectClean {
	width: 90px;
	height: 260px;
	border: 1px solid lightgrey;
	background-color: white;
	position: absolute;
	top: 207px;
	left: 864px;
}

.selectUnclean {
	width: 90px;
	height: 260px;
	border: 1px solid lightgrey;
	background-color: white;
	position: absolute;
	top: 207px;
	left: 1028px;
}

input[type=checkbox] {
	margin-left: 10px;
}

#changeClean {
	border: 1px solid lightgrey;
	background-color: lightgrey;
	width: 80px;
	height: 30px;
	border-radius: 5px;
	margin-top: 10px;
	margin-left: 5px;
}

#changeUnclean {
	border: 1px solid lightgrey;
	background-color: lightgrey;
	width: 80px;
	height: 30px;
	border-radius: 5px;
	margin-top: 10px;
	margin-left: 5px;
}

.filterSec {
	float: right;
}

.roomSec {
	width: 100%;
	height: 515px;
	overflow: auto;
}

.roomBox {
	display: inline-grid;
	margin-right: 9px;
	margin-left: 9px;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 150px;
	height: 150px;
	background-color: white;
	width: 150px;
}

.statusBox {
	border: 5px solid white;
	width: 140px;
	height: 90px;
	background-color: pink;
}

.stDetail {
	width: 140px;
	height: 40px;
	margin-top: -5px;
}

.roomNo {
	font-size: 30px;
	font-weight: bold;
	float: left;
	margin: 0 auto;
	margin-left: 5px;
}

.roomType {
	font-size: 15px;
	font-weight: bold;
	float: right;
	margin: 0 auto;
	align-self: bottom;
	margin-right: 5px;
	margin-top: 17px;
}

.reservName {
	margin: 0 auto;
	width: 140px;
	height: 20px;
	margin-left: 5px;
}

.detailBox {
	width: 140px;
	height: 50px;
	background-color: white;
	border-left: 5px solid white;
	border-right: 5px solid white;
}

.emptyRoom {
	text-align: center;
}

.fullRoom {
	font-size: 12px;
}

.roomFee {
	float: right;
}

.rentRoom {
	text-align: center;
	font-size: 12px;
}

#enterBtn {
	background-color: white;
	margin-top: 5px;
	width: 100px;
	height: 30px;
	border-radius: 100px;
	border: 1px solid lightgrey;
}

#timeBtn {
	background-color: white;
	width: 100px;
	height: 30px;
	border-radius: 100px;
	border: 1px solid blue;
	color:blue;
	font-weight:bold;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<jsp:include page="modalCheckIn.jsp"></jsp:include>
		<!-- topSec -->
		<div class="topSec">
			<!-- searchSec -->
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
			<!-- searchSec end -->
			<!-- floorSec -->
			<div class="floorSec">
				<button id="allFloor">전체</button>
				<c:forEach var="f" begin="2" end="11">
					<button class="floorBtn" id="floor${ f }">${ f }층</button>
				</c:forEach>
			</div>
			<!-- floorSec end -->
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
			<div class="selectClean">
				<c:forEach var="f" begin="2" end="11">
					<input type="checkbox" name="selectClean${ f }" id="selectClean${ f }">
					<label for="selectClean${ f }">${ f }층</label><br>
				</c:forEach>
				<button id="changeClean">상태변경</button>
			</div>
			<div class="selectUnclean">
				<c:forEach var="f" begin="2" end="11">
					<input type="checkbox" name="selectUnclean${ f }" id="selectUnclean${ f }">
					<label for="selectUnclean${ f }">${ f }층</label><br>
				</c:forEach>
				<button id="changeUnclean">상태변경</button>
			</div>
			<!-- statusSec end -->
			<!-- filterSec -->
			<div class="filterSec">
				<img id="changeFilter" alt="" src="${ contextPath }/resources/images/mngRoomsFloor.PNG">
			</div>
			<!-- filterSec end -->
		</div>
		<!-- topSec end -->
		
		<!-- roomSec -->
		<div class="roomSec lightgrey">
			<c:forEach var="r" begin="1" end="20">
				<div id="roomBox${ r }" class="roomBox">
					<div class="statusBox">
						<div class="stClean"></div>
						<div class="stDetail">
							<p class="roomNo">201</p>
							<p class="roomType">디럭스</p>
						</div>
						<p class="reservName">김 * 호</p>
					</div>
					<!-- 재실 detail -->
					<div class="detailBox fullRoom">
						01-17~01-18 (1박)
						<hr>
						<div class="roomFee">90,000</div>
					</div>
				</div>
				<div id="roomBox${ r + 30 }" class="roomBox">
					<div class="statusBox">
						<div class="stClean"></div>
						<div class="stDetail">
							<p class="roomNo">201</p>
							<p class="roomType">디럭스</p>
						</div>
						<p class="reservName">김 * 호</p>
					</div>
					<!-- 공실 detail -->
					<div class="detailBox emptyRoom">
						<button id="enterBtn">재실</button>
					</div>
				</div>
				<div id="roomBox${ r + 60 }" class="roomBox">
					<div class="statusBox">
						<div class="stClean"></div>
						<div class="stDetail">
							<p class="roomNo">201</p>
							<p class="roomType">디럭스</p>
						</div>
						<p class="reservName">김 * 호</p>
					</div>
					<!-- 대실 detail -->
					<div class="detailBox rentRoom">
						<button id="timeBtn">05:58</button><br>
						<div class="roomFee">90,000</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- roomSec end -->
		
	</section>
		<script>
			$(function(){
				$("#allFloor").css({"background-color":"#EAC064", "color":"white"});
				$(".selectClean").hide();
				$(".selectUnclean").hide();
			});
			
			//[ 정비 ] 상태 버튼
			$("#stClean").click(function(){
				$(".selectClean").toggle();
			});
			//[ 미정비 ] 상태 버튼
			$("#stUnclean").click(function(){
				$(".selectUnclean").toggle();
			});
			
			//상태변경 버튼
			$("#changeClean").click(function(){
				$(".selectClean").hide();
			});
			$("#changeUnclean").click(function(){
				$(".selectUnclean").hide();
			});
			
			//필터변경 버튼
			$("#changeFilter").click(function(){
				$(this).prop({"src":"${ contextPath }/resources/images/mngRoomsNot.PNG"});
			});
			
			//룸 클릭
			$("#roomBox1").click(function(){
				$(".modal").fadeIn();
			});
			$("#roomBox31").click(function(){
			});
			$("#roomBox61").click(function(){
			});
		</script>
</body>
</html>