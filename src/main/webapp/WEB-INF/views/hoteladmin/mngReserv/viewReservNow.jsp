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
	margin-left: 810px;
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
	width: 50px;
	height: 26px;
	padding-top: 4px;
	padding-left: 3px;
	border-left: none;
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
		<jsp:include page="../mngRooms/modalDetailClient.jsp"></jsp:include>
	</header>
	<section>
		<jsp:include page="../mngRooms/modalCheckIn.jsp"></jsp:include>
		<jsp:include page="../mngRooms/modalBroken.jsp"></jsp:include>
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
				<div class="stInfo"><div class="stColor lightsteelblue"></div><div id="stReserv">예약</div></div>
				<div class="stInfo"><div class="stColor gold"></div><div id="stRent">대실</div></div>
				<div class="stInfo"><div class="stColor mediumseagreen"></div><div id="stSleep">투숙</div></div>
				<div class="stInfo"><div class="stColor darkgray"></div><div id="stBroken">고장</div></div>
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
		var roomprice;
		var svclist;
		var ruleInfo;
		var rfdRate;
		var startDay = '${ startDay }';
		
		function strToDate(str) {
			var year = str.substr(0,4);
			var month = (str.substr(5,1)=='0'?str.substr(6,1):str.substr(5,2)) * 1 - 1;
			var day = str.substr(8,2);
			var date = new Date(year, month, day);
			return date;
		}
		
		function dateToStr(date) {
			var year = date.getFullYear();
			var month = (date.getMonth()+1)>9?(date.getMonth()+1):"0"+(date.getMonth()+1);
			var day = date.getDate()>9?date.getDate():"0"+date.getDate();
			var str = year + "-" + month + "-" + day;
			return str;
		}
		
		$(function(){
			var date = new Date;
			checkIn = $("#today").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					location.href = "searchRsvNowDay.re?day=" + date;
				}
			}).data('datepicker');
			$("#today").val('${ startDay }');
			
			roomlist = JSON.parse('${jsonList}');
			roomprice = JSON.parse('${jsonList2}');
			svclist = JSON.parse('${jsonList3}');
			ruleInfo = JSON.parse('${jsonObject}');
			rfdRate = JSON.parse('${jsonObject2}');
			console.log(roomlist);
			
			
			for(var i = 0; i < 14; i++) {
				var week = new Array('일', '월', '화', '수', '목', '금', '토');
				var viewday = strToDate(startDay);
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
					$(this).children().eq(2 + i).attr('id', $(this).children().eq(2 + i).attr('id') + "n" + viewdayID);
				});
			}
			
			for(var i = 0; i < roomlist.length; i++) {
				
				var rmNum = roomlist[i].rmNum;

				//고장객실
				if(roomlist[i].brkBegin != '' && roomlist[i].brkEnd != '') {
					var brkBegin = strToDate(roomlist[i].brkBegin);
					var brkEnd = strToDate(roomlist[i].brkEnd);
					var distance = (brkEnd.getTime() - brkBegin.getTime()) / 1000 / 60 / 60 / 24;
					
					for(var j = 0; j <= distance; j++) {
						var tempday = strToDate(roomlist[i].brkBegin);
						tempday.setDate(tempday.getDate() + j);
						var rmNo = roomlist[i].rmNo;
						$("#" + rmNum + "n" + dateToStr(tempday)).children().addClass('darkgray').attr('onclick', 'goBroken('+rmNo+')');
						
						if(j == 0) {
							$("#" + rmNum + "n" + dateToStr(tempday)).children('.halfCO').css({"border-left":"1px solid black", "width":"45.5px"});
						} else if(j == distance) {
							$("#" + rmNum + "n" + dateToStr(tempday)).children('.halfCI').css({"border-right":"1px solid black", "width":"45.5px"});
						}
						
					}
				}
				
				//예약객실
				if(roomlist[i].rcheckin != '' && roomlist[i].rcheckout != '') {
					var rcheckin = strToDate(roomlist[i].rcheckin);
					var rcheckout = strToDate(roomlist[i].rcheckout);
					var distance = (rcheckout.getTime() - rcheckin.getTime()) / 1000 / 60 / 60 / 24;
					
					var rsvNo = roomlist[i].rsvNo;
					$("#" + rmNum + "n" + roomlist[i].rcheckin).children('.halfCI').addClass('lightsteelblue').css({"border-left":"1px solid black", "width":"45.5px"}).attr('onclick', 'goReserv('+rsvNo+')');;
					$("#" + rmNum + "n" + roomlist[i].rcheckout).children('.halfCO').addClass('lightsteelblue').css({"border-right":"1px solid black", "width":"45.5px"}).attr('onclick', 'goReserv('+rsvNo+')');;
					
					for(var j = 1; j < distance; j++) {
						var tempday = strToDate(roomlist[i].rcheckin);
						tempday.setDate(tempday.getDate() + j);
						$("#" + rmNum + "n" + dateToStr(tempday)).children().addClass('lightsteelblue').attr('onclick', 'goReserv('+rsvNo+')');
					}
				}
				
				//숙박객실
				if(roomlist[i].scheckin != '' && roomlist[i].scheckout != '') {
					var scheckin = strToDate(roomlist[i].scheckin);
					var scheckout = strToDate(roomlist[i].scheckout);
					var distance = (scheckout.getTime() - scheckin.getTime()) / 1000 / 60 / 60 / 24;
					
					var stayNo = roomlist[i].stayNo;
					$("#" + rmNum + "n" + roomlist[i].scheckin).children('.halfCI').removeClass('lightsteelblue').addClass('mediumseagreen').css({"border-left":"1px solid black", "width":"45.5px"}).attr('onclick', 'goStay('+stayNo+')');
					$("#" + rmNum + "n" + roomlist[i].scheckout).children('.halfCO').removeClass('lightsteelblue').addClass('mediumseagreen').css({"border-right":"1px solid black", "width":"45.5px"}).attr('onclick', 'goStay('+stayNo+')');
					
					for(var j = 1; j < distance; j++) {
						var tempday = strToDate(roomlist[i].scheckin);
						tempday.setDate(tempday.getDate() + j);
						$("#" + rmNum + "n" + dateToStr(tempday)).children().removeClass('lightsteelblue').addClass('mediumseagreen').attr('onclick', 'goStay('+stayNo+')');
					}
					
					//대실객실
					if(roomlist[i].scheckin == roomlist[i].scheckout) {
						$("#" + rmNum + "n" + roomlist[i].scheckin).children().removeClass('mediumseagreen');
						$("#" + rmNum + "n" + roomlist[i].scheckin).children('.halfCO').addClass('gold').css({"border-right":"1px solid black", "width":"45.5px"}).attr('onclick', 'goLent('+stayNo+')');
					}
				}
				
			}
			
		});
		
		$("#goYesterday").click(function(){
			var yesterday = new Date($("#today").val().substring(0,4), $("#today").val().substring(5,7)-1, $("#today").val().substring(8,10));
			yesterday.setTime(yesterday.getTime() - (1 * 24 * 60 * 60 * 1000) * 14);
			var yday = yesterday.getFullYear() + "-" + (yesterday.getMonth()+1>9?yesterday.getMonth()+1:"0" + (yesterday.getMonth()+1)) + "-" + (yesterday.getDate()>9?yesterday.getDate():("0" + yesterday.getDate()));
			location.href = "searchRsvNowDay.re?day=" + yday; 
		});
		
		$("#goToday").click(function(){
			var today = new Date();
			var day = dateToStr(today);
			location.href = "searchRsvNowDay.re?day=" + day; 
		});
		
		$("#goTommorow").click(function(){
			var tommorow = new Date($("#today").val().substring(0,4), $("#today").val().substring(5,7)-1, $("#today").val().substring(8,10));
			tommorow.setTime(tommorow.getTime() + (1 * 24 * 60 * 60 * 1000) * 14);
			var tday = tommorow.getFullYear() + "-" + (tommorow.getMonth()+1>9?tommorow.getMonth()+1:"0" + (tommorow.getMonth()+1)) + "-" + (tommorow.getDate()>9?tommorow.getDate():("0" + tommorow.getDate()));
			console.log(tday);
			location.href = "searchRsvNowDay.re?day=" + tday; 
		});
		
		$(".emptyroom div").click(function(){
			var cnt = $(this).parent().attr('id').indexOf('n');
			var thisRoom = $(this).parent().attr('id').substring(0, cnt);
			var thisDay = $(this).parent().attr('id').substring(cnt + 1);
			var distance = strToDate(thisDay).getTime() - new Date().getTime();
			if(distance < 1 || $(this).attr('class').length > 7) {
				
			} else {
				goRoom(thisRoom, thisDay);
			}
		});
		
	</script>
	
	
	<script>
		$(function(){
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
				
				$("#selRoomNum").append("<option value='" + roomlist[i].rmNo + "'>" + roomlist[i].rmNum + "호</option>")
			}
			for(var i = 0; i < roomTypeArr.length; i++) {
				$("#selRoomType").append("<option>" + roomTypeArr[i] + "</option>")
			}
		});
	</script>
	
	
	<script>
		//모달1 : 공실 [ 입실 ] 버튼 클릭
		var today;
		function goRoom(rmNo, selDay) {
			$("#modalStt").text('　예약');
			$(".statusColor").addClass('lightsteelblue');
			$(".totalPrice").addClass('lightsteelblue');
			
			var totalPrc;
			$("select[name=stayDay]").before("<input type='text' name='checkinTime' id='checkIn' value='" + today + "'>");
			$("input[name=rentYN]").before("<input type='text' name='checkoutTime' id='checkOut'>");
			$("#openMemoMD").prop("disabled", true); $("#openMemoMD").css({"background-color":"lightgrey", "border":"none"});
			$("#checkinBtn").text('등록').attr('onclick', 'doSaveReserv();');
			$("#checkinBtn").show();
			$("#payRfd").prop("disabled", true).css("background-color", "#E4E2E2");
			$("#checkIn").val(selDay);
			today = strToDate($("#checkIn").val());
			 
			//datepicker
			date = new Date();
			var sttfeeday = strToDate(selDay);
			var endfeeday = 0;
			
			var reservOkDay = new Date();
			reservOkDay.setDate(reservOkDay.getDate() + 1);
			checkIn = $("#checkIn").datepicker({
				autoClose : true,
				minDate : reservOkDay,
				onSelect : function(date) {
					endNum = date;
					
					var ciDay = new Date($("#checkIn").val());
					var coDay = new Date($("#checkOut").val());
					var cntDay = (coDay.getTime() - ciDay.getTime()) / (1000*60*60*24);
					$("select[name=stayDay]").val(cntDay).prop('selected', true);
					
					sttfeeday = new Date(date.substring(0,4), (date.substring(5,7) * 1 - 1), date.substring(8,10));
					today = strToDate($("#checkIn").val());
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
			
			$("#rentYN").prop('disabled', true);
			
			$("select[name=stayDay]").change(function(){
				if(endfeeday == 0) {
					endfeeday = $("#checkOut").val();
				}
				changeModalFee(sttfeeday, endfeeday);
			});
			
			//선택한 룸 정보로 객실정보(+인원수 제한) setup
			var rtNo;
			var stdPer;
			var maxPer;
			for(var i = 0; i < roomlist.length; i++) {
				if(rmNo == roomlist[i].rmNum) {
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
			
			//요금상세 부분 설정
			detailModalFee(dateToStr(new Date()), 'STAY', 0);
			
			//요금상세 부분 설정 함수
			function detailModalFee(feedate, data, totalFee) {
				var week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
				var feedateD = new Date(feedate.substring(0,4), (feedate.substring(5,7) * 1 - 1), feedate.substring(8,10));
				var feeday = week[feedateD.getDay()];
				var termType;
				if((feedate.substring(5,7) * 1) == 1 || (feedate.substring(5,7) * 1) == 2 || (feedate.substring(5,7) * 1) == 7 || (feedate.substring(5,7) * 1) == 8 || (feedate.substring(5,7) * 1) == 12) {
					termType = "SEASON";
				} else {
					termType = "OFFSEASON";
				}
				for(var i = 0; i < roomprice.length; i++) {
					if(roomprice[i].rtNo == rtNo && roomprice[i].dayType == feeday && roomprice[i].stayType == data && roomprice[i].termType == termType) {
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
			
			//객실요금상세 동적 변화
			function changeModalFee(sttfeeday, endfeeday) {
				if(endfeeday == 0) {
					$(".feeDetailSec tr").remove();
					detailModalFee(dateToStr(new Date()), 'STAY', 0);
				} else {
					$(".feeDetailSec tr").remove();
					var feedayscnt = $("select[name=stayDay]").val() * 1;
					var totalFee = 0;
					for(var i = 0; i < feedayscnt; i++) {
						var tempday = new Date(sttfeeday.getFullYear(), sttfeeday.getMonth(), sttfeeday.getDate() + i);
						var feeday = dateToStr(tempday);
						totalFee = detailModalFee(feeday, 'STAY', totalFee);
					}
				}	
			}
			
			$(".modal").fadeIn();
			
		}
	
	
		//모달2 : 예약 [ 입실대기 ] 객실 클릭
		var reservPayDate;
		var reservCheckinTime;
		var selRoomNumm;
		function goReserv(rsvNo) {
			$(".statusColor").addClass('lightsteelblue');
			$(".totalPrice").addClass('lightsteelblue');
			$("#modalStt").text('　예약');
			$("#staycode").text(rsvNo);
			$("#checkinBtn").show();
			
			$("select[name=stayDay]").before("<input type='text' name='checkinTime' id='checkIn' value='" + today + "'>");
			$("input[name=rentYN]").before("<input type='text' name='checkoutTime' id='checkOut'>");
			
			$.ajax({
				url:"ajxSelectRsvInfo.ro",
				type:"post",
				data:{rsvNo:rsvNo},
				success:function(data) {
					$("#clientName").val(data.stayInfo.clientName);
					$("#insertClient").text(data.stayInfo.clientNo);
					$("#clientNo").val(data.stayInfo.clientNo);
					$("#clientPhone").val(data.stayInfo.clientPhone);
					$("#clientEmail").val(data.stayInfo.clientEmail);
					
					var noshowCutline = (data.stayInfo.timeCI.substring(0,2) * 1) + ruleInfo.noshowUnit;
					var timeGap = noshowCutline - (new Date().getHours());
					if(timeGap > 0) {
						$("#rsvCancelBtn").show();
					} else {
						$("#ciCancelBtn").show();
					}
					
					$("#checkIn").val(data.stayInfo.scheckin);
					var sttday = new Date(data.stayInfo.scheckin.substring(0,4), data.stayInfo.scheckin.substring(5,7) - 1, data.stayInfo.scheckin.substring(8,10));
					$("#checkOut").val(data.stayInfo.scheckout);
					var endday = new Date(data.stayInfo.scheckout.substring(0,4), data.stayInfo.scheckout.substring(5,7) - 1, data.stayInfo.scheckout.substring(8,10));
					$("select[name=stayDay] option[value='" + data.stayInfo.stayDays + "']").prop('selected', true);
					
					$("#selRoomType").val(data.stayInfo.roomType).prop("selected", true);
					$("#selRoomNum").val(data.stayInfo.rmNo).prop("selected", true);
					selRoomNumm = data.stayInfo.rmNo;
					
					
					var stdPer = data.stayInfo.stdPer;
					var maxPer = data.stayInfo.maxPer;
					var rmType = data.stayInfo.roomType;
					for(var i = 0; i < roomlist.length; i++) {
						if(roomlist[i].rtName != rmType) {
							$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").hide();
						} else {
							$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").show();
						}
						
						if(roomlist[i].rsvNo == rsvNo) {
							reservCheckinTime = roomlist[i].ciTime;
						}
					}
					for(var i = 1; i <= stdPer; i++) {
						if(i == data.stayInfo.stayPer) {
							$("#personCnt").append("<option value='" + i + "' selected>" + i + "</option>");
						} else {
							$("#personCnt").append("<option value='" + i + "'>" + i + "</option>");
						}
					}
					
					var perday = ((endday.getTime() - sttday.getTime()) / 1000 / 60 / 60/ 24);
					changeModalFee(data.stayInfo.rtNo, sttday, endday, perday);
					
					var tempSvcTotal = 0;
					for(var i = 0; i < data.staySvc.length; i++) {
						var tempSvc = $(".svcTR").clone();
						tempSvc.attr('class', 'useSvc').css({'display':'table-row', 'width':'100%'});
						tempSvc.children().eq(0).text(data.staySvc[i].svcDate);
						tempSvc.find('select').attr('disabled', 'disabled');
						tempSvc.find('select option[value="' + data.staySvc[i].svcCode + '"]').prop("selected", true);
						tempSvc.find('input[type=number]').eq(0).attr('readonly', 'readonly').val(data.staySvc[i].useCnt);
						tempSvc.children().eq(3).children().attr('type', 'text').css("background-color", "white").val(data.staySvc[i].svcPrice.toLocaleString());
						tempSvc.children().eq(4).children().attr('type', 'text').css("background-color", "white").val((data.staySvc[i].useCnt * data.staySvc[i].svcPrice).toLocaleString());
						tempSvcTotal += data.staySvc[i].useCnt * data.staySvc[i].svcPrice;
						tempSvc.find('button').remove();
						$(".svcDetailSec table").append(tempSvc);
					}
					$("#totalSvc").text(tempSvcTotal.toLocaleString());
					
					for(var i = 0; i < data.stayPay.length; i++) {
						switch(data.stayPay[i].payWay) {
						case "CARD" : $("#payCard").val($("#payCard").val() * 1 + data.stayPay[i].paymentFee); break;
						case "CASH" : $("#payCash").val($("#payCash").val() * 1 + data.stayPay[i].paymentFee); break;
						case "ACCOUNT" : $("#payAcc").val($("#payAcc").val() * 1 + data.stayPay[i].paymentFee); break;
						case "REFUND" : $("#payRfd").val($("#payRfd").val() * 1 + data.stayPay[i].paymentFee); break;
						}
						
						if(i == data.stayPay.length - 1) {
							$("#lastPayDay").text(data.stayPay[i].payDate);
							reservPayDate = data.stayPay[i].payDate;
						}
					}
					changeTotalPrcTxt();
					
				},
				error:function(error, status) {
					alert("SYSTEM ERROR!");
				}
			});
			
			$(".modal").fadeIn();
		}
		
		
		
		//모달3 : [ 대실 ] 객실 클릭
		var checkoutStayNo;
		function goLent(stayNo) {
			$(".statusColor").addClass('gold');
			$(".totalPrice").addClass('gold');
			$("#staycode").text('　　');
			$(".infoBtnSec").show();
			$("#rentYN").prop('checked', true);
			checkoutStayNo = stayNo;
			
			$("select[name=stayDay]").before("<input type='text' name='checkinTime' id='checkIn' value='" + today + "'>");
			$("input[name=rentYN]").before("<input type='text' name='checkoutTime' id='checkOut'>");
			
			$.ajax({
				url:"ajxSelectStayInfo.ro",
				type:"post",
				data:{stayNo:stayNo},
				success:function(data) {
					$("#modalStt").text('　' + data.stayInfo.rmNum + ' (대실)');
					$("#clientName").val(data.stayInfo.clientName);
					//$("#insertClient").text(data.stayInfo.clientNo);
					$("#clientPhone").val(data.stayInfo.clientPhone);
					$("#clientEmail").val(data.stayInfo.clientEmail);
					
					$("#checkIn").val(data.stayInfo.scheckin);
					var sttday = new Date(data.stayInfo.scheckin.substring(0,4), data.stayInfo.scheckin.substring(5,7) - 1, data.stayInfo.scheckin.substring(8,10));
					$("#checkOut").val(data.stayInfo.scheckout);
					var endday = new Date(data.stayInfo.scheckout.substring(0,4), data.stayInfo.scheckout.substring(5,7) - 1, data.stayInfo.scheckout.substring(8,10));
					$("select[name=stayDay] option[value='" + data.stayInfo.stayDays + "']").prop('selected', true);
					
					$("#selRoomType").val(data.stayInfo.roomType).prop("selected", true);
					$("#selRoomNum").val(data.stayInfo.rmNo).prop("selected", true);
					
					
					var stdPer = data.stayInfo.stdPer;
					var maxPer = data.stayInfo.maxPer;
					var rmType = data.stayInfo.roomType;
					for(var i = 0; i < roomlist.length; i++) {
						if(roomlist[i].rtName != rmType) {
							$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").hide();
						} else {
							$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").show();
						}
					}
					for(var i = 1; i <= stdPer; i++) {
						if(i == data.stayInfo.stayPer) {
							$("#personCnt").append("<option value='" + i + "' selected>" + i + "</option>");
						} else {
							$("#personCnt").append("<option value='" + i + "'>" + i + "</option>");
						}
					}
					
					var perday = ((endday.getTime() - sttday.getTime()) / 1000 / 60 / 60/ 24);
					changeModalFee(data.stayInfo.rtNo, sttday, endday, perday);
					
					var tempSvcTotal = 0;
					for(var i = 0; i < data.staySvc.length; i++) {
						var tempSvc = $(".svcTR").clone();
						tempSvc.attr('class', 'useSvc').css({'display':'table-row', 'width':'100%'});
						tempSvc.children().eq(0).text(data.staySvc[i].svcDate);
						tempSvc.find('select').attr('disabled', 'disabled');
						tempSvc.find('select option[value="' + data.staySvc[i].svcCode + '"]').prop("selected", true);
						tempSvc.find('input[type=number]').eq(0).attr('readonly', 'readonly').val(data.staySvc[i].useCnt);
						tempSvc.children().eq(3).children().attr('type', 'text').css("background-color", "white").val(data.staySvc[i].svcPrice.toLocaleString());
						tempSvc.children().eq(4).children().attr('type', 'text').css("background-color", "white").val((data.staySvc[i].useCnt * data.staySvc[i].svcPrice).toLocaleString());
						tempSvcTotal += data.staySvc[i].useCnt * data.staySvc[i].svcPrice;
						tempSvc.find('button').remove();
						$(".svcDetailSec table").append(tempSvc);
					}
					$("#totalSvc").text(tempSvcTotal.toLocaleString());
					
					for(var i = 0; i < data.stayPay.length; i++) {
						switch(data.stayPay[i].payWay) {
						case "CARD" : $("#payCard").val($("#payCard").val() * 1 + data.stayPay[i].paymentFee); break;
						case "CASH" : $("#payCash").val($("#payCash").val() * 1 + data.stayPay[i].paymentFee); break;
						case "ACCOUNT" : $("#payAcc").val($("#payAcc").val() * 1 + data.stayPay[i].paymentFee); break;
						case "REFUND" : $("#payRfd").val($("#payRfd").val() * 1 + data.stayPay[i].paymentFee); break;
						}
						
						if(i == data.stayPay.length - 1) {
							$("#lastPayDay").text(data.stayPay[i].payDate);
						}
					}
					
					changeTotalPrcTxt();
					
				},
				error:function(error, status) {
					alert("SYSTEM ERROR!");
				}
			});
			
			$(".modal").fadeIn();
		}
		
		
		
		//모달4 : [ 투숙 ] 객실 클릭
		function goStay(stayNo) {
			$(".statusColor").addClass('mediumseagreen');
			$(".totalPrice").addClass('mediumseagreen');
			$("#staycode").text('　　');
			$(".infoBtnSec").show();
			checkoutStayNo = stayNo;
			
			$("select[name=stayDay]").before("<input type='text' name='checkinTime' id='checkIn' value='" + today + "'>");
			$("input[name=rentYN]").before("<input type='text' name='checkoutTime' id='checkOut'>");
			
			$.ajax({
				url:"ajxSelectStayInfo.ro",
				type:"post",
				data:{stayNo:stayNo},
				success:function(data) {
					$("#modalStt").text('　' + data.stayInfo.rmNum + ' (재실)');
					$("#clientName").val(data.stayInfo.clientName);
					$("#insertClient").text(data.stayInfo.clientNo);
					$("#clientPhone").val(data.stayInfo.clientPhone);
					$("#clientEmail").val(data.stayInfo.clientEmail);
					
					$("#checkIn").val(data.stayInfo.scheckin);
					var sttday = new Date(data.stayInfo.scheckin.substring(0,4), data.stayInfo.scheckin.substring(5,7) - 1, data.stayInfo.scheckin.substring(8,10));
					$("#checkOut").val(data.stayInfo.scheckout);
					var endday = new Date(data.stayInfo.scheckout.substring(0,4), data.stayInfo.scheckout.substring(5,7) - 1, data.stayInfo.scheckout.substring(8,10));
					$("select[name=stayDay] option[value='" + data.stayInfo.stayDays + "']").prop('selected', true);
					
					$("#selRoomType").val(data.stayInfo.roomType).prop("selected", true);
					$("#selRoomNum").val(data.stayInfo.rmNo).prop("selected", true);
					
					
					var stdPer = data.stayInfo.stdPer;
					var maxPer = data.stayInfo.maxPer;
					var rmType = data.stayInfo.roomType;
					for(var i = 0; i < roomlist.length; i++) {
						if(roomlist[i].rtName != rmType) {
							$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").hide();
						} else {
							$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").show();
						}
					}
					for(var i = 1; i <= stdPer; i++) {
						if(i == data.stayInfo.stayPer) {
							$("#personCnt").append("<option value='" + i + "' selected>" + i + "</option>");
						} else {
							$("#personCnt").append("<option value='" + i + "'>" + i + "</option>");
						}
					}
					
					var perday = ((endday.getTime() - sttday.getTime()) / 1000 / 60 / 60/ 24);
					changeModalFee(data.stayInfo.rtNo, sttday, endday, perday);
					
					var tempSvcTotal = 0;
					for(var i = 0; i < data.staySvc.length; i++) {
						var tempSvc = $(".svcTR").clone();
						tempSvc.attr('class', 'useSvc').css({'display':'table-row', 'width':'100%'});
						tempSvc.children().eq(0).text(data.staySvc[i].svcDate);
						tempSvc.find('select').attr('disabled', 'disabled');
						tempSvc.find('select option[value="' + data.staySvc[i].svcCode + '"]').prop("selected", true);
						tempSvc.find('input[type=number]').eq(0).attr('readonly', 'readonly').val(data.staySvc[i].useCnt);
						tempSvc.children().eq(3).children().attr('type', 'text').css("background-color", "white").val(data.staySvc[i].svcPrice.toLocaleString());
						tempSvc.children().eq(4).children().attr('type', 'text').css("background-color", "white").val((data.staySvc[i].useCnt * data.staySvc[i].svcPrice).toLocaleString());
						tempSvcTotal += data.staySvc[i].useCnt * data.staySvc[i].svcPrice;
						tempSvc.find('button').remove();
						$(".svcDetailSec table").append(tempSvc);
					}
					$("#totalSvc").text(tempSvcTotal.toLocaleString());
					
					for(var i = 0; i < data.stayPay.length; i++) {
						switch(data.stayPay[i].payWay) {
						case "CARD" : $("#payCard").val($("#payCard").val() * 1 + data.stayPay[i].paymentFee); break;
						case "CASH" : $("#payCash").val($("#payCash").val() * 1 + data.stayPay[i].paymentFee); break;
						case "ACCOUNT" : $("#payAcc").val($("#payAcc").val() * 1 + data.stayPay[i].paymentFee); break;
						case "REFUND" : $("#payRfd").val($("#payRfd").val() * 1 + data.stayPay[i].paymentFee); break;
						}
						
						if(i == data.stayPay.length - 1) {
							$("#lastPayDay").text(data.stayPay[i].payDate);
						}
					}
					
					changeTotalPrcTxt();
					
				},
				error:function(error, status) {
					alert("SYSTEM ERROR!");
				}
			});
			
			$(".modal").fadeIn();
		}
		
		
		
		//모달 객실요금 변경 함수
		function changeModalFee(rtNo, sttfeeday, endfeeday, perday) {
			if(perday == 0) {
				$(".feeDetailSec tr").remove();
				detailModalFee(rtNo, dateToStr(new Date()), 'LENT', 0);
			} else {
				$(".feeDetailSec tr").remove();
				var feedayscnt = $("select[name=stayDay]").val() * 1;
				var totalFee = 0;
				for(var i = 0; i < feedayscnt; i++) {
					var tempday = new Date(sttfeeday.getFullYear(), sttfeeday.getMonth(), sttfeeday.getDate() + i);
					var feeday = dateToStr(tempday);
					totalFee = detailModalFee(rtNo, feeday, 'STAY', totalFee);
				}
			}	
		}
		
		function detailModalFee(rtNo, feedate, data, totalFee) {
			var week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
			var feedateD = new Date(feedate.substring(0,4), (feedate.substring(5,7) * 1 - 1), feedate.substring(8,10));
			var feeday = week[feedateD.getDay()];
			var termType;
			if((feedate.substring(5,7) * 1) == 1 || (feedate.substring(5,7) * 1) == 2 || (feedate.substring(5,7) * 1) == 7 || (feedate.substring(5,7) * 1) == 8 || (feedate.substring(5,7) * 1) == 12) {
				termType = "SEASON";
			} else {
				termType = "OFFSEASON";
			}
			for(var i = 0; i < roomprice.length; i++) {
				if(roomprice[i].rtNo == rtNo && roomprice[i].dayType == feeday && roomprice[i].stayType == data && roomprice[i].termType == termType) {
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
	
		
		//모달5 : [ 고장 ] 객실 클릭
		function goBroken(rmNo) {
			$("#realRmNo").val(rmNo);
			$.ajax({
				url:"ajxFindBrokenHis.re",
				data:{rmNo:rmNo},
				type:"post",
				success:function(data) {
					var brkRoom = data.brkRoom;
					$("#brkRmNo").text(brkRoom.rmNo);
					
					var week = new Array('일', '월', '화', '수', '목', '금', '토');
					var begin = new Date(brkRoom.brkBegin);
					var dateB = ((begin.getMonth()+1)>9?(begin.getMonth()+1):"0"+(begin.getMonth()+1)) + "-" + (begin.getDate()>9?begin.getDate():"0"+begin.getDate());
					var dayB = week[begin.getDay()];
					var end = new Date(brkRoom.brkEnd);
					var dateE = ((end.getMonth()+1)>9?(end.getMonth()+1):"0"+(end.getMonth()+1)) + "-" + (end.getDate()>9?end.getDate():"0"+end.getDate());
					var dayE = week[end.getDay()];
					$("#brkPeriod").text(dateB + "(" + dayB + ") ~ " + dateE + "(" + dayE + ")");
					console.log("begin : " + begin + "/" + dateB + dayB);
					console.log("end : " + end + "/" + dateE + dayE);
					$("#brkMno").text(brkRoom.userName);
					$("#brkRsnTA").text(brkRoom.brkRsn);
					$("#endBroken").hide();
					$(".modalBroken").fadeIn();
				},
				error:function(error, status) {
					alert("SYSTEM ERROR!");
				}
			});
		}
	</script>
</body>
</html>