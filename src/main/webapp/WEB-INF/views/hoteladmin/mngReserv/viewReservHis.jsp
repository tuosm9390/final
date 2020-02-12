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
	width: 110px;
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

.lightsteelblue {
	background-color: lightsteelblue;
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
		<div class="titleSec">
			<h1>예약내역</h1>
			<select name="serReservType" id="serReservType" onchange="selReservType();">
				<option value="all" selected>전체 예약</option>
				<option value="on">온라인 예약</option>
				<option value="off">오프라인 예약</option>
			</select>
		</div>
		 
		<hr>
		<div class="topSec">
			<div class="dateSec">
				<label>예약일자</label>
				<input type="text" id="today" name="today" value="${ today }">
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
				<c:forEach var="r" items="${ rsvList }">
					<tr>
						<td onclick="openModal(${ r.rsvNo })">${ r.rsvNo }</td>
						<td>${ r.rmType }</td>
						<td>${ r.rmNum }</td>
						<td>${ r.mname }</td>
						<td>${ r.phone }</td>
						<td>${ r.checkin }</td>
						<td>${ r.checkout }</td>
						<td style="text-align: right;">${ r.price }</td>

						<c:if test="${ r.rsvStatus eq 'OK' }">
						<td style="text-align: right;">${ r.price }</td>
						</c:if>
						<c:if test="${ r.rsvStatus eq 'REFUND' || r.rsvStatus eq 'NOSHOW' }">
						<td style="text-align: right;">${ r.rfdPrice }</td>
						</c:if>
						<c:if test="${ r.rsvStatus eq 'WAIT'}">
						<td style="text-align: right;">0</td>
						</c:if>

						<td>${ r.rsvDate }</td>
						<td>${ r.modDate }</td>

						<c:if test="${ r.rsvStatus eq 'OK' }">
						<td>예약확정</td>
						</c:if>
						<c:if test="${ r.rsvStatus eq 'REFUND' }">
						<td>예약취소</td>
						</c:if>
						<c:if test="${ r.rsvStatus eq 'NOSHOW' }">
						<td>고객노쇼</td>
						</c:if>
						<c:if test="${ r.rsvStatus eq 'WAIT'}">
						<td>예약대기</td>
						</c:if>

						<c:if test="${ r.rsvWay eq 'ONLINE' }">						
						<td class="onR">온라인예약</td>
						</c:if>
						<c:if test="${ r.rsvWay eq 'OFFLINE' }">						
						<td class="offR">전화예약</td>
						</c:if>
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
		
		var today = new Date();
		var day = today.getFullYear() + "-" + (today.getMonth()+1>9?today.getMonth()+1:"0" + (today.getMonth()+1)) + "-" + (today.getDate()>9?today.getDate():("0" + today.getDate()));
		
		$(function(){
			var date = new Date;
			checkIn = $("#today").datepicker({
				autoClose : true,
				maxDate : new Date(),
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					location.href = "searchRsvDay.re?day=" + date; 
				}
			}).data('datepicker');
			$("#today").text($("#today").val());
			
			if($("#today").val() == day) {
				$("#goTommorow").prop('disabled', true);
			}
			
			roomlist = JSON.parse('${jsonList}');
			roomprice = JSON.parse('${jsonList2}');
			svclist = JSON.parse('${jsonList3}');
			ruleInfo = JSON.parse('${jsonObject}');
			rfdRate = JSON.parse('${jsonObject2}');
			
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
		
		function selReservType() {
			var type = $("#serReservType").val();
			var table = $(".reservList tr");
			switch(type) {
			case "all" : table.show(); break;
			case "on" : table.find('.onR').parent().show(); table.find('.offR').parent().hide(); break;
			case "off" : table.find('.onR').parent().hide(); table.find('.offR').parent().show(); break;
			}
		}
		
		$("#goYesterday").click(function(){
			var yesterday = new Date($("#today").val().substring(0,4), $("#today").val().substring(5,7)-1, $("#today").val().substring(8,10));
			yesterday.setTime(yesterday.getTime() - (1 * 24 * 60 * 60 * 1000));
			var yday = yesterday.getFullYear() + "-" + (yesterday.getMonth()+1>9?yesterday.getMonth()+1:"0" + (yesterday.getMonth()+1)) + "-" + (yesterday.getDate()>9?yesterday.getDate():("0" + yesterday.getDate()));
			location.href = "searchRsvDay.re?day=" + yday; 
		});
		
		$("#goToday").click(function(){
			location.href = "searchRsvDay.re?day=" + day; 
		});
		
		$("#goTommorow").click(function(){
			var tommorow = new Date($("#today").val().substring(0,4), $("#today").val().substring(5,7)-1, $("#today").val().substring(8,10));
			tommorow.setTime(tommorow.getTime() + (1 * 24 * 60 * 60 * 1000));
			var tday = tommorow.getFullYear() + "-" + (tommorow.getMonth()+1>9?tommorow.getMonth()+1:"0" + (tommorow.getMonth()+1)) + "-" + (tommorow.getDate()>9?tommorow.getDate():("0" + tommorow.getDate()));
			location.href = "searchRsvDay.re?day=" + tday; 
		});
		
		
		
		
		
		
		
		//▼모달 관련 함수들▼
		var reservPayDate;
		var reservCheckinTime;
		var selRoomNumm;
		
		//모달 객실요금 변경 함수
		function changeModalFee(rtNo, sttfeeday, endfeeday, perday) {
			$(".feeDetailSec tr").remove();
			var totalFee = 0;
			for(var i = 0; i < perday; i++) {
				var tempday = new Date(sttfeeday.getFullYear(), sttfeeday.getMonth(), sttfeeday.getDate() + i);
				//var feeday = tempday.format('yyyy-MM-dd');
				var feeday = sttfeeday.getFullYear() + "-" + (sttfeeday.getMonth()+1>9?sttfeeday.getMonth()+1:"0" + (sttfeeday.getMonth()+1)) + "-" + ((sttfeeday.getDate() + i)>9?(sttfeeday.getDate() + i):"0" + (sttfeeday.getDate() + i));
				totalFee = detailModalFee(rtNo, tempday, feeday, 'STAY', totalFee);
			}
		}
		
		function detailModalFee(rtNo, tempday, feedate, data, totalFee) {
			var week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
			var feeday = week[tempday.getDay()];
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
		
		function strToDate(str) {
			var year = str.substr(0,4);
			var month = (str.substr(5,1)=='0'?str.substr(6,1):str.substr(5,2)) * 1 - 1;
			var day = str.substr(8,2);
			var date = new Date(year, month, day);
			return date;
		}
		
		function openModal(rsvNo) {
			$(".statusColor").addClass('lightsteelblue');
			$(".totalPrice").addClass('lightsteelblue');
			$("#modalStt").text('　예약');
			$("#staycode").text(rsvNo);
			
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
					$("#checkinBtn").show();
					$("#checkinBtn").text('저장').attr('onclick', 'doSave();');
					 
					$("#checkIn").val(data.stayInfo.scheckin);
					var sttday = new Date(data.stayInfo.scheckin.substring(0,4), data.stayInfo.scheckin.substring(5,7) - 1, data.stayInfo.scheckin.substring(8,10));
					$("#checkOut").val(data.stayInfo.scheckout);
					var endday = new Date(data.stayInfo.scheckout.substring(0,4), data.stayInfo.scheckout.substring(5,7) - 1, data.stayInfo.scheckout.substring(8,10));
					$("select[name=stayDay] option[value='" + data.stayInfo.stayDays + "']").prop('selected', true);
					
					var disCI = (strToDate($("#checkIn").val()).getTime() - new Date().getTime()) / 1000 / 60 / 60 / 24;
					if(disCI < 0) {
						$("#rsvCancelBtn").hide();
					} else {
						$("#rsvCancelBtn").show();
					}
					
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
						case "ACCOUNT" :
							if(data.stayPay[i].payStatus == 'REFUND') {
								$("#payRfd").val($("#payRfd").val() * 1 + data.stayPay[i].paymentFee); break;
							} else {
								$("#payAcc").val($("#payAcc").val() * 1 + data.stayPay[i].paymentFee); break;
							}
						case "REFUND" : $("#payRfd").val($("#payRfd").val() * 1 + data.stayPay[i].paymentFee); break;
						}
						
						if(i == data.stayPay.length - 1) {
							$("#lastPayDay").text(data.stayPay[i].payDate);
							reservPayDate = data.stayPay[i].payDate;
						}
						
						if(data.stayPay[i].payStatus == 'REFUND') {
							$("#rsvCancelBtn").text('취소된 예약');
							$("#rsvCancelBtn").prop('disabled', true);
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
	</script>
</body>
</html>