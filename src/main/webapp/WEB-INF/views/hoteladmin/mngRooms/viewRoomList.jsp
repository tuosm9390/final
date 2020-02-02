<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.searchSec {
	margin-top: 10px;
	float: right;
	display: inline;
}

select {
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

.floorBtn, #allFloor {
	margin-top: 10px;
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
	top: 201px;
	left: 864px;
}

.selectUnclean {
	width: 90px;
	height: 260px;
	border: 1px solid lightgrey;
	background-color: white;
	position: absolute;
	top: 201px;
	left: 1028px;
}

.selectClean div, .selectUnclean div {
	width: 90px;
	height: 213px;
	max-height: 213px;
	overflow-y: auto;
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
	margin-bottom: -5px;
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

.clientName {
	margin: 0;
	width: 140px;
	height: 20px;
	margin-left: 5px;
	float: left;
}

.detailBox {
	width: 140px;
	height: 50px;
	background-color: white;
	border-left: 5px solid white;
	border-right: 5px solid white;
}

.detailBox hr {
	margin-top: 4px;
	margin-bottom: 2px;
}

.emptyRoom {
	text-align: center;
}

.fullRoom, .reservRoom, .brokenRoom {
	font-size: 12px;
	display: none;
}

.roomFee {
	float: right;
}

.rentRoom {
	text-align: center;
	font-size: 12px;
	display: none;
}

.enterBtn {
	background-color: white;
	margin-top: 5px;
	width: 100px;
	height: 30px;
	border-radius: 100px;
	border: 1px solid lightgrey;
}

.timeBtn {
	background-color: white;
	width: 100px;
	height: 30px;
	border-radius: 100px;
	border: 1px solid blue;
	color:blue;
	font-weight:bold;
}

.boldFont {
	font-weight: bold;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<jsp:include page="modalCheckIn.jsp"></jsp:include>
		<jsp:include page="modalBroken.jsp"></jsp:include>
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
			<c:set var="nowFloor" value="" />
			<c:set var="oldFloor" value="" />
			<div class="floorSec">
				<button id="allFloor">전체</button>
				<c:forEach var="f" items="${ roomList }">
					<c:set var="nowFloor" value="${ f.floor }" />
					<c:if test="${ nowFloor ne oldFloor }">
						<button class="floorBtn" id="floor${ f.floor }" onclick="filterFloor(${ f.floor })">${ f.floor }층</button>
						<c:set var="oldFloor" value="${ nowFloor }" />
					</c:if>
				</c:forEach>
			</div>
			<!-- floorSec end -->
			<!-- statusSec -->
			<div class="statusSec">
				<div class="stInfo"><div class="stColor lightgrey"></div><div id="stEmpty">공실</div><div onclick="clickSttNum(this);"></div></div>
				<div class="stInfo"><div class="stColor lightsteelblue"></div><div id="stReserv">입실예정</div><div onclick="clickSttNum(this);"></div></div>
				<div class="stInfo"><div class="stColor gold"></div><div id="stRent">대실</div><div onclick="clickSttNum(this);"></div></div>
				<div class="stInfo"><div class="stColor mediumseagreen"></div><div id="stSleep">투숙</div><div onclick="clickSttNum(this);"></div></div>
				<div class="stInfo"><div class="stColor coral"></div><div id="stOut">퇴실예정</div><div onclick="clickSttNum(this);"></div></div>
				<div class="stInfo"><div class="stColor"><div class="stClean"></div></div><div id="stClean">정비</div><div onclick="clickSttNum(this);"></div></div>
				<div class="stInfo"><div class="stColor"><div class="stNoClean"></div></div><div id="stUnclean">미정비</div><div onclick="clickSttNum(this);"></div></div>
				<div class="stInfo"><div class="stColor darkgray"></div><div id="stBroken">고장</div><div onclick="clickSttNum(this);"></div></div>
			</div>
			<div class="selectClean">
				<div>
					<input type="checkbox" name="selectCleanAll" id="selectCleanAll">
					<label for="selectCleanAll">전체</label>
					<c:set var="nowFloor" value="" />
					<c:set var="oldFloor" value="" />
					<c:forEach var="f" items="${ roomList }">
						<c:set var="nowFloor" value="${ f.floor }" />
						<c:if test="${ nowFloor ne oldFloor }">
							<input type="checkbox" name="selectClean${ f.floor }" id="selectClean${ f.floor }">
							<label for="selectClean${ f.floor }">${ f.floor }층</label><br>
							<c:set var="oldFloor" value="${ nowFloor }" />
						</c:if>
					</c:forEach>
				</div>
				<button id="changeClean">상태변경</button>
			</div>
			<div class="selectUnclean">
				<div>
					<input type="checkbox" name="selectUncleanAll" id="selectUncleanAll">
					<label for="selectUncleanAll">전체</label>
					<c:set var="nowFloor" value="" />
					<c:set var="oldFloor" value="" />
					<c:forEach var="f" items="${ roomList }">
						<c:set var="nowFloor" value="${ f.floor }" />
						<c:if test="${ nowFloor ne oldFloor }">
							<input type="checkbox" name="selectUnclean${ f.floor }" id="selectUnclean${ f.floor }">
						<label for="selectUnclean${ f.floor }">${ f.floor }층</label><br>
							<c:set var="oldFloor" value="${ nowFloor }" />
						</c:if>
					</c:forEach>
				</div>
				<button id="changeUnclean">상태변경</button>
			</div>
			<!-- statusSec end -->
			<!-- filterSec -->
			<div class="filterSec">
				<img id="changeFilterF" alt="" src="${ contextPath }/resources/images/mngRoomsFloor.PNG">
				<img id="changeFilterA" alt="" src="${ contextPath }/resources/images/mngRoomsNot.PNG">
			</div>
			<!-- filterSec end -->
		</div>
		<!-- topSec end -->
		
		<!-- roomSec -->
		<div class="roomSec lightgrey">
			<c:forEach var="r" items="${ roomList }">
				<div id="roomBox${ r.rmNo }" class="roomBox">
					<input type="hidden" name="rmNo" value="${ r.rmNo }">
					<input type="hidden" name="floor" value="${ r.floor }">
					<div class="statusBox lightgrey">
						<div class="stClean"></div>
						<div class="stDetail">
							<p class="roomNo">${ r.rmNum }</p>
							<p class="roomType">${ r.rtName }</p>
						</div>
						<span class="clientName"></span>
					</div>
					<!-- 공실 detail -->
					<div class="detailBox emptyRoom">
						<button id="enterBtn${ r.rmNo }" class="enterBtn" onclick="goRoom(${ r.rmNo });">재실</button>
					</div>
					<!-- 예약 detail -->
					<div class="detailBox reservRoom">
						<fmt:parseDate var="reservCI_D" value="${ r.rcheckin }" pattern="yyyy-MM-dd"/>
						<fmt:parseDate var="reservCO_D" value="${ r.rcheckout }" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber var="reservCI_N" value="${ reservCI_D.time/(1000*60*60*24) }" integerOnly="true"/>
			            <fmt:parseNumber var="reservCO_N" value="${ reservCO_D.time/(1000*60*60*24) }" integerOnly="true"/>
						<c:out value="${ fn:substring(r.rcheckin, 5, 10) }"/> ~ <c:out value="${ fn:substring(r.rcheckout, 5, 10) }"/> (${ reservCO_N - reservCI_N }박)
						<hr>
						<div class="roomFee"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ r.rsvPrice }"/></div>
					</div>
					<!-- 재실 detail -->
					<div class="detailBox fullRoom">
						<fmt:parseDate var="stayCI_D" value="${ r.scheckin }" pattern="yyyy-MM-dd"/>
			            <fmt:parseDate var="stayCO_D" value="${ r.scheckout }" pattern="yyyy-MM-dd"/>
			            <fmt:parseNumber var="stayCI_N" value="${ stayCI_D.time/(1000*60*60*24) }" integerOnly="true"/>
			            <fmt:parseNumber var="stayCO_N" value="${ stayCO_D.time/(1000*60*60*24) }" integerOnly="true"/>
						<c:out value="${ fn:substring(r.scheckin, 5, 10) }"/> ~ <c:out value="${ fn:substring(r.scheckout, 5, 10) }"/> (${ stayCO_N - stayCI_N }박)
						<hr>
						<div class="roomFee"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ r.stayPrice }"/></div>
					</div>
					<!-- 대실 detail -->
					<div class="detailBox rentRoom">
						<button class="timeBtn" id="timeBtn${ r.rmNo }"><span class="hour_10"></span><span class="hour_1"></span>:<span class="min_10"></span><span class="min_1"></span></button><br>
						<div class="roomFee"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ r.stayPrice }"/></div>
					</div>
					<!-- 고장 detail -->
					<div class="detailBox brokenRoom">
						<fmt:parseDate var="strBrk_D" value="${ r.brkBegin }" pattern="yyyy-MM-dd"/>
			            <fmt:parseDate var="endBrk_D" value="${ r.brkEnd }" pattern="yyyy-MM-dd"/>
			            <fmt:parseNumber var="strBrk_N" value="${ strBrk_D.time/(1000*60*60*24) }" integerOnly="true"/>
			            <fmt:parseNumber var="endBrk_N" value="${ endBrk_D.time/(1000*60*60*24) }" integerOnly="true"/>
						<c:out value="${ fn:substring(r.brkBegin, 5, 10) }"/> ~ <c:out value="${ fn:substring(r.brkEnd, 5, 10) }"/> (${ endBrk_N - strBrk_N }박)
						<hr>
						<div class="roomFee"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ r.stayPrice }"/></div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- roomSec end -->
		
	</section>
		<script>
			var roomlist;
			var roomprice;
			var svclist;
			var ruleInfo;
			var today;
			
			//onload
			$(function(){
				$("#allFloor").css({"background-color":"#EAC064", "color":"white"});
				$(".selectClean").hide();
				$(".selectUnclean").hide();
				$("#changeFilterA").hide();
				
				roomlist = JSON.parse('${jsonList}');
				roomprice = JSON.parse('${jsonList2}');
				svclist = JSON.parse('${jsonList3}');
				ruleInfo = JSON.parse('${jsonObject}');
				today = new Date().format('yyyy-MM-dd');
				console.log(roomlist);
				
				var stEmpty = roomlist.length;
				var stReserv = 0;
				var stRent = 0;
				var stSleep = 0;
				var stOut = 0;
				var stClean = roomlist.length;
				var stUnclean = 0;
				var stBroken = 0;
				
				for(var r = 0; r < roomlist.length; r++) {
					
					//객실상태 표시
					if(roomlist[r].stayNo == 0 && roomlist[r].rsvNo == "") {
						//공실
					} else if(roomlist[r].stayNo == 0 && roomlist[r].rsvNo != ""){
						//입실대기 (예약)
						$("#roomBox" + roomlist[r].rmNo).children(".statusBox").removeClass("lightgrey").addClass("lightsteelblue");
						stReserv++;
						var reservname;
						if(roomlist[r].reservname.indexOf('-') == -1) {
							reservname = roomlist[r].reservname.substring(0, 1) + " * " + roomlist[r].reservname.substring(2);
						} else {
							reservname = roomlist[r].reservname;
						}
						$("#roomBox" + roomlist[r].rmNo).find(".clientName").text(reservname);
						$("#roomBox" + roomlist[r].rmNo).children(".emptyRoom").css({"display":"none"});
						$("#roomBox" + roomlist[r].rmNo).children(".reservRoom").css({"display":"block"});
					} else if(roomlist[r].stayNo != 0 && roomlist[r].stayType == "STAY") {
						//투숙
						$("#roomBox" + roomlist[r].rmNo).children(".statusBox").removeClass("lightgrey").addClass("mediumseagreen");
						stSleep++;
						var stayname;
						if(roomlist[r].sname.indexOf('-') == -1) {
							stayname = roomlist[r].sname.substring(0, 1) + " * " + roomlist[r].sname.substring(2);
						} else {
							stayname = roomlist[r].sname;
						}
						$("#roomBox" + roomlist[r].rmNo).find(".clientName").text(stayname);
						$("#roomBox" + roomlist[r].rmNo).children(".emptyRoom").css({"display":"none"});
						$("#roomBox" + roomlist[r].rmNo).children(".fullRoom").css({"display":"block"});
					} else if(roomlist[r].stayNo != 0 && roomlist[r].stayType == "LENT") {
						//대실
						$("#roomBox" + roomlist[r].rmNo).children(".statusBox").removeClass("lightgrey").addClass("gold");
						stRent++;
						var stayname;
						if(roomlist[r].sname.indexOf('-') == -1) {
							stayname = roomlist[r].sname.substring(0, 1) + " * " + roomlist[r].sname.substring(2);
						} else {
							stayname = roomlist[r].sname;
						}
						$("#roomBox" + roomlist[r].rmNo).find(".clientName").text(stayname);
						var dateConvert = function(date) {
					      const year = date.substring(0, 4);
					      const month = date.substring(5, 7);
					      const day = date.substring(8, 10);
					      const hour = date.substring(11, 13);
					      const minute = date.substring(14, 16);
					      const second = date.substring(17, 19);
					      const convert = year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second;
					      return new Date( convert );
						};
						var realCI = dateConvert(roomlist[r].realCI);
						CountDownTimer(realCI, roomlist[r].rmNo);
						$("#roomBox" + roomlist[r].rmNo).children(".emptyRoom").css({"display":"none"});
						$("#roomBox" + roomlist[r].rmNo).children(".rentRoom").css({"display":"block"});
					}
					
					//퇴실예정 객실상태 색상표시
					if(roomlist[r].stayNo != 0 && roomlist[r].scheckout == today && roomlist[r].stayType != "LENT") {
						$("#roomBox" + roomlist[r].rmNo).children(".statusBox").removeClass("mediumseagreen").addClass("coral");
						stOut++;
					}
					
					//고장 객실상태 표시
					if(roomlist[r].brkRsn != "") {
						$("#roomBox" + roomlist[r].rmNo).children(".statusBox").removeClass("lightgrey").addClass("darkgray");
						stBroken++;
						if(roomlist[r].brkRsn.length > 10) {
							var brokenRsn = roomlist[r].brkRsn.substring(0, 10);
						} else {
							var brokenRsn = roomlist[r].brkRsn;
						}
						$("#roomBox" + roomlist[r].rmNo).find(".clientName").text(brokenRsn);
						$("#roomBox" + roomlist[r].rmNo).children(".emptyRoom").css({"display":"none"});
						$("#roomBox" + roomlist[r].rmNo).children(".brokenRoom").css({"display":"block"});
					}
					
					//미정비상태 객실 표시 
					if(roomlist[r].cleanStatus == "N") {
						$("#roomBox" + roomlist[r].rmNo).find(".stClean").addClass("stNoClean").removeClass("stClean");
						stUnclean++;
					}
				}
				
				//상태별 객실수 표시
				stSleep -= stOut;
				stClean -= stUnclean;
				stEmpty -= (stReserv + stSleep + stRent + stOut + stBroken);
				$("#stEmpty").next().text(stEmpty);
				$("#stReserv").next().text(stReserv);
				$("#stRent").next().text(stRent);
				$("#stSleep").next().text(stSleep);
				$("#stOut").next().text(stOut);
				$("#stClean").next().text(stClean);
				$("#stUnclean").next().text(stUnclean);
				$("#stBroken").next().text(stBroken);
				
				//모달 기본 내용 불러오기 (객실타입 / 객실호수)
				var roomTypeArr = new Array();
				var tempCnt = 0;
				roomTypeArr.push(roomlist[0].rtName);
				for(var i = 0; i < roomlist.length; i++) {
					var tempRtName = roomlist[i].rtName;
					for(var j = 0; j < roomTypeArr.length; j++) {
						if(roomTypeArr[j] == tempRtName) {
							tempCnt++;
						}
					}
					if(tempCnt == 0) {
						roomTypeArr.push(tempRtName);
					}
					tempCnt = 0;
					
					
					if(roomlist[i].stayNo == 0 && roomlist[i].rsvNo == "") {
						$("#selRoomNum").append("<option value='" + roomlist[i].rmNo + "'>" + roomlist[i].rmNum + "호</option>")
					} else {
						$("#selRoomNum").append("<option value='" + roomlist[i].rmNo + "' disabled>" + roomlist[i].rmNum + "호</option>")
					}
				}
				for(var i = 0; i < roomTypeArr.length; i++) {
					$("#selRoomType").append("<option>" + roomTypeArr[i] + "</option>")
				}
			});
			//onload end
			
			
			
			//[ 정비 ] 상태 버튼
			$("#stClean").click(function(){
				$(".selectClean").toggle();
			});
			$("#selectCleanAll").change(function(){
				if($(this).prop("checked")) {
					$(".selectClean").find("input[type=checkbox]").prop("checked", true);
				} else {
					$(".selectClean").find("input[type=checkbox]").prop("checked", false);
				}
			});
			$(".selectClean").find("input[type=checkbox]").change(function(){
				if($(this).prop("checked") == false) {
					$("#selectCleanAll").prop("checked", false);
				}
			});
			
			
			
			//[ 미정비 ] 상태 버튼
			$("#stUnclean").click(function(){
				$(".selectUnclean").toggle();
			});
			$("#selectUncleanAll").change(function(){
				if($(this).prop("checked")) {
					$(".selectUnclean").find("input[type=checkbox]").prop("checked", true);
				} else {
					$(".selectUnclean").find("input[type=checkbox]").prop("checked", false);
				}
			});
			$(".selectUnclean").find("input[type=checkbox]").change(function(){
				if($(this).prop("checked") == false) {
					$("#selectUncleanAll").prop("checked", false);
				}
			});
			
			
			
			//상태변경 버튼
			$("#changeClean").click(function(){
				$(".selectClean").hide();
			});
			$("#changeUnclean").click(function(){
				$(".selectUnclean").hide();
			});
			
			
			
			//필터변경 버튼
			$("#changeFilterF").click(function(){
				$(this).hide();
				$("#changeFilterA").show();
				var tempFloor = $(".roomBox").find("input[name=floor]").eq(0).val();
				$(".roomBox").find("input[name=floor]").each(function(){
					if($(this).val() != tempFloor) {
						tempFloor = $(this).val();
						$(this).parent().before("<hr id='floorHR' style='border:1px dashed darkgray;'>");
					}
				});
			});
			$("#changeFilterA").click(function(){
				$(this).hide();
				$("#changeFilterF").show();
				$("hr").remove("#floorHR");
			});
			
			
			function namecntfunc(n, width) {
				  n = n + '';
				  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
			}
			//모달1 : [ 재실 ] 버튼 클릭 (= 공실)
			function goRoom(rmNo) {
				var nametoday = new Date().format('yyyyMMdd');
				var namecnt = 0;
				$.ajax({
					url:"ajxFindTempClient.ro",
					data:{hipen:nametoday},
					type:"post",
					success:function(data){
						namecnt = data.tempClientCnt + 1;
						$("#clientName").val(nametoday + "-" + namecntfunc(namecnt, 3));
					},
					error:function(error, status){
						alert("SYSTEM ERROR!");
					}
				});
				
				var totalPrc;
				$("#ciCancelBtn").hide();
				$("#rsvCancelBtn").hide();
				$("select[name=stayDay]").before("<input type='text' name='checkinTime' id='checkIn'>");
				$("input[name=rentYN]").before("<input type='text' name='checkoutTime' id='checkOut'>");
				$("#openMemoMD").prop("disabled", true); $("#openMemoMD").css({"background-color":"lightgrey", "border":"none"});
				$("#checkinBtn").show();
				$("#payRfd").prop("disabled", true).css("background-color", "#E4E2E2");
				
				//datepicker
				date = new Date();
				$("#checkIn").val(today);
				var sttfeeday = new Date();
				var endfeeday = 0;
				checkIn = $("#checkIn").datepicker({
					autoClose : true,
					minDate : new Date(),
					onSelect : function(date) {
						endNum = date;
						
						var ciDay = new Date($("#checkIn").val());
						var coDay = new Date($("#checkOut").val());
						var cntDay = (coDay.getTime() - ciDay.getTime()) / (1000*60*60*24);
						$("select[name=stayDay]").val(cntDay).prop('selected', true);
						
						sttfeeday = new Date(date.substring(0,4), (date.substring(5,7) * 1 - 1), date.substring(8,10));
						changeModalFee(sttfeeday, endfeeday);
						
						$("#checkOut").datepicker({
							minDate : new Date(endNum),
						});
					}
				}).data('datepicker');

				checkOut = $("#checkOut").datepicker({
					autoClose : true,
					minDate : new Date(),
					onSelect : function(date) {
						startNum = date;
						
						var ciDay = new Date($("#checkIn").val());
						var coDay = new Date($("#checkOut").val());
						var cntDay = (coDay.getTime() - ciDay.getTime()) / (1000*60*60*24);
						$("select[name=stayDay]").val(cntDay).prop('selected', true);
						if(cntDay != 0) {
							$("#rentYN").prop("checked", false);
						}
						
						endfeeday = new Date(date.substring(0,4), (date.substring(5,7) * 1 - 1), date.substring(8,10));
						changeModalFee(sttfeeday, endfeeday);
					}
				}).data('datepicker');
				
				$("#rentYN").change(function(){
					changeModalFee(sttfeeday, endfeeday);
				});
				
				$("select[name=stayDay]").change(function(){
					if(endfeeday == 0) {
						endfeeday = $("#checkOut").val();
						console.log(endfeeday);
					}
					if($(this).val() != 0) {
						$("#rentYN").prop("checked", false);
					} else {
						$("#rentYN").prop("checked", true);
					}
					changeModalFee(sttfeeday, endfeeday);
				});
				
				//선택한 룸 정보로 객실정보(+인원수 제한) setup
				var rtNo;
				var stdPer;
				var maxPer;
				for(var i = 0; i < roomlist.length; i++) {
					if(rmNo == roomlist[i].rmNo) {
						rtNo = roomlist[i].rtNo;
						stdPer = roomlist[i].stdPer;
						maxPer = roomlist[i].maxPer;
						$("#selRoomType").val(roomlist[i].rtName).prop("selected", true);
						$("#selRoomNum").val(roomlist[i].rmNo).prop("selected", true);
						
						var rmType = roomlist[i].rtName;
						var cnt = 0;
						for(var i = 0; i < roomlist.length; i++) {
							if(roomlist[i].rtName != rmType) {
								$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").hide();
							} else {
								$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").show();
								cnt++;
							}
						}
					}
				}
				for(var i = 1; i <= stdPer; i++) {
					$("#personCnt").append("<option value='" + i + "'>" + i + "</option>");
				}
				
				//요금상세 부분 설정 함수
				function detailModalFee(feedate, data, totalFee) {
					var week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
					var feedateD = new Date(feedate.substring(0,4), (feedate.substring(5,7) * 1 - 1), feedate.substring(8,10));
					var feeday = week[feedateD.getDay()];
					for(var i = 0; i < roomprice.length; i++) {
						if(roomprice[i].rtNo == rtNo && roomprice[i].dayType == feeday && roomprice[i].stayType == data) {
							var dayfee = roomprice[i].price.toLocaleString();
							totalFee += roomprice[i].price;
							$(".feeDetailSec table").append("<tr><td>" + feedate.substring(5) + "</td><td>" + dayfee + "</td></tr>");
						}
					}
					$("#totalRoom").text(totalFee.toLocaleString());
					$("#totalVlt").text((totalFee * ruleInfo.serviceRate).toLocaleString());
					changeTotalPrcTxt();
					
					return totalFee;
				}
				
				//요금상세 부분 설정
				detailModalFee(new Date().format('yyyy-MM-dd'), 'LENT', 0);
				
				//객실요금상세 동적 변화
				function changeModalFee(sttfeeday, endfeeday) {
					if(endfeeday == 0 || $("#rentYN").prop('checked')) {
						$(".feeDetailSec tr").remove();
						detailModalFee(new Date().format('yyyy-MM-dd'), 'LENT', 0);
					} else {
						$(".feeDetailSec tr").remove();
						var feedayscnt = $("select[name=stayDay]").val() * 1;
						var totalFee = 0;
						for(var i = 0; i < feedayscnt; i++) {
							var tempday = new Date(sttfeeday.getFullYear(), sttfeeday.getMonth(), sttfeeday.getDate() + i);
							var feeday = tempday.format('yyyy-MM-dd');
							totalFee = detailModalFee(feeday, 'STAY', totalFee);
						}
					}	
				}
				
				$(".modal").fadeIn();
			}
			
			
			
			
			//층수 버튼 클릭
			function filterFloor(num) {
				$(".roomBox").show();
				$(".floorBtn").css({"background-color":"white", "color":"black"});
				$("#allFloor").css({"background-color":"white", "color":"black"});
				$("#floor" + num).css({"background-color":"#EAC064", "color":"white"});
				$(".roomBox").find("input[name=floor]").each(function(){
					if($(this).val() != num) {
						$(this).parent().hide();
					}
				});
			}
			
			
			
			//전체 층수 버튼 클릭
			$("#allFloor").click(function(){
				$(".roomBox").show();
				$("#allFloor").css({"background-color":"#EAC064", "color":"white"});
				$(".floorBtn").css({"background-color":"white", "color":"black"});
			});
			
			
			
			//상태바 클릭
			$(".stColor").click(function(){
				$(this).siblings().eq(0).toggleClass('boldFont');
				$(this).siblings().eq(1).toggleClass('boldFont');
				var cnt = cntBoldFont();
				var boldFontCnt = cnt.length;
				if(boldFontCnt == 0) {
					$(".roomBox").show();
				} else {
					statusHide(cnt);
				}
			});
			function clickSttNum(thisDiv){
				$(".stInfo").find(thisDiv).parent().find(".stColor").click();
			}
			
			function cntBoldFont(){
				var cnt = new Array();
				for(var i = 0; i < 8; i++) {
					if($(".statusSec").children().eq(i).children().eq(1).hasClass('boldFont')) {
						var tempCls = $(".statusSec").children().eq(i).children().eq(0).attr('class').substring(8);
						if(tempCls == "") {
							tempCls = $(".statusSec").children().eq(i).children().eq(0).children().attr('class');
						}
						cnt.push(tempCls);
					}
				}
				return cnt;
			}
			
			function statusHide(cntBoldFont){
				$(".roomBox").each(function(){
					var tempRoomBox = $(this).children();
					for(var i = 0; i < cntBoldFont.length; i++) {
						if(tempRoomBox.hasClass(cntBoldFont[i]) || tempRoomBox.children().eq(0).hasClass(cntBoldFont[i])) {
							$(this).show();
							break;
						} else {
							$(this).hide();
						}
					}
				});
			}
			
		</script>
		
		<script>
		//날짜 포맷맞추기 javascript
			Date.prototype.format = function(f) {
				if (!this.valueOf()) return " ";
	
				var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
				var d = this;
				
				return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
					switch ($1) {
						case "yyyy": return d.getFullYear();
						case "yy": return (d.getFullYear() % 1000).zf(2);
						case "MM": return (d.getMonth() + 1).zf(2);
						case "dd": return d.getDate().zf(2);
						case "E": return weekName[d.getDay()];
						case "HH": return d.getHours().zf(2);
						case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
						case "mm": return d.getMinutes().zf(2);
						case "ss": return d.getSeconds().zf(2);
						case "a/p": return d.getHours() < 12 ? "오전" : "오후";
						default: return $1;
					}
				});
			};
			String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
			String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
			Number.prototype.zf = function(len){return this.toString().zf(len);};
		</script>
		
		<script>
		//대실 남은 시간 계산 javascript
			function CountDownTimer(dt, rmNo){
				dt.setHours(dt.getHours() + ruleInfo.rentUnit);
				dt.setMinutes(dt.getMinutes() + 1);
	            var end = new Date(dt);
	            
	            var _second = 1000;
	            var _minute = _second * 60;
	            var _hour = _minute * 60;
	            var _day = _hour * 24;
	            var timer;

	            function showRemaining() {
	                var now = new Date();

	                var distance = end - now;

	                if (distance < 0) {

	                    clearInterval(timer);

	                    return;
	                }
	                var days = Math.floor(distance / _day);
	                var hours = Math.floor((distance % _day) / _hour);
	                var minutes = Math.floor((distance % _hour) / _minute);
	                var seconds = Math.floor((distance % _minute) / _second);

	                var strDays = days.toString();
	                var strHours = hours.toString();
	                var strMin = minutes.toString();
	                var strSec = seconds.toString();

	                /* if( strDays < 10 ){
	                    $('.day_10').text('0');
	                    $('.day_1').text(strDays.substring(0, 1));
	                }else{
	                    $('.day_10').text(strDays.substring(0, 1));
	                    $('.day_1').text(strDays.substring(1, 2));
	                } */

	                if( strHours < 10 ){
	                    $("#timeBtn" + rmNo).find('.hour_10').text('0');
	                    $("#timeBtn" + rmNo).find('.hour_1').text(strHours.substring(0, 1));
	                }else{
	                	$("#timeBtn" + rmNo).find('.hour_10').text(strHours.substring(0, 1));
	                	$("#timeBtn" + rmNo).find('.hour_1').text(strHours.substring(1, 2));
	                }

	                if( strMin < 10 ){
	                	$("#timeBtn" + rmNo).find('.min_10').text('0');
	                	$("#timeBtn" + rmNo).find('.min_1').text(strMin.substring(0, 1));
	                }else{
	                	$("#timeBtn" + rmNo).find('.min_10').text(strMin.substring(0, 1));
	                	$("#timeBtn" + rmNo).find('.min_1').text(strMin.substring(1, 2));
	                }
	            }

	            showRemaining();
	            timer = setInterval(showRemaining, 5000);
	        }
		</script>
</body>
</html>