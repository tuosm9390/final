<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels Boutique</title>
<style>
.site-outer-box {
	display: inline-flex;
	width: 100%;
}

.reservation-img {
	position: fixed;
	width: 38%;
	height: 100%;
	padding-top: 5px;
	border-right: 1px solid black;
}

.reservation-img-item {
	width: 47%;
	margin: 10px;
	display: inline-table;
}

/* 홀수번째 이미지 */
.reservation-img-item:nth-child(even) {
	/* 	margin-right: 2%; */
	
}
/* 짝수번째 이미지 */
.reservation-img-item:nth-child(odd) {
	margin-left: 0;
	/* 	margin-right: 2%; */
}
.reservation-text {
	position: absolute;
	left: 40%;
	padding: 10px;
	padding-left: 15px;
	width: 55%;
}

.reservation-table{
	margin-left: 30px;
}

.reservation-table tr{
	height: 40px;
}

.reservation-table tr td:first-child{
	font-weight: bold;
	font-size: 18px;
	padding-right: 20px;
}

.reservation label{
	margin: 0 !important;
}

.result-btn{
	width: 100px;
	margin-right: 20px;
}

.reservation-option label{
	margin-right: 20px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../common/reservationCancelModalForm.jsp"></jsp:include>
	</header>
	<section>
		<div class="site-outer-box">
			<!-- 좌측 이미지 -->
			<div class="reservation-img">
				<c:forEach var="filePath" items="${ filePathList }" varStatus="st">
					<div class="reservation-img-item">
						<img src="${ contextPath }${ filePath }" style="width: 100%; height: 100%;">
					</div>
				</c:forEach>
			</div>
			<!-- 좌측 이미지 끝 -->
			
			<!-- 우측 예약 내용 -->
			<div class="reservation-text">
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px;">예약 정보 확인</p>
				<!-- 예약자 정보 -->
				<div style="border: 1px solid black; width: 100%; height: 0; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);"></div>
				<br>
					<p style="font-weight: bold; font-size: 24px;">예약자 정보</p>
					<table class="reservation-table">
						<tr>
							<td><li>예약번호</li></td>
							<td><label>${ ReservationCheck.rsvNo }</label></td>
						</tr>
						<tr>
							<td><li>예약자명</li></td>
							<td><label>${ ReservationCheck.userName }</label></td>
						</tr>
						<tr>
							<td><li>전화번호</li></td>
							<td><label>${ ReservationCheck.phone }</label></td>
						</tr>
						<tr>
							<td><li>이메일</li></td>
							<td><label>${ ReservationCheck.email }</label></td>
						</tr>
						<tr>
							<td><li>결제금액</li></td>
							<td><label>${ ReservationCheck.stayPrice } 원</label></td>
						</tr>
						<tr>
							<td><li>체크인일자</li></td>
							<td><label>${ ReservationCheck.checkIn }&emsp; (체크인  ${ ReservationCheck.checkInTime })</label></td>
						</tr>
						<tr>
							<td><li>체크아웃일자</li></td>
							<td><label>${ ReservationCheck.checkOut }</label></td>
						</tr>
					</table>
				<br>
				<div style="border: 1px solid black; width: 100%; height: 0; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);"></div>
				<br>
				<!-- 객실 정보 -->
				<p style="font-weight: bold; font-size: 24px;">객실 정보</p>
				<table class="reservation-table">
					<tr>
						<td><li>객실명</li></td>
						<td colspan="4"><label>${ ReservationCheck.rtName }</label></td>
					</tr>
					<tr>
						<td><li>객실 인원</li></td>
						<td><label>대인</label>&emsp;<label>${ ReservationCheck.adult }명</label></td>
						<td><label>소인</label>&emsp;<label>${ ReservationCheck.child }명</label></td>
					</tr>
					<tr>
						<td><li>옵션</li></td>
						<td colspan="4">
							<div style="width: 350px;" class="reservation-option">
								<label>조식 <c:if test="${ ReservationCheck.rsvOption eq 'Y'}">포함</c:if>
								<c:if test="${ ReservationCheck.rsvOption eq 'N'}">불포함</c:if></label>
							</div>
						</td>
					</tr>
					<tr>
						<td><li>요청사항</li></td>
						<td colspan="4"><label>${ ReservationCheck.rsvReq }</label></td>
					</tr>
				</table>
				<br>
				<div class="reservation-page_btn" align="right">
					<button class="result-btn reservation-cancel" onclick="">예약취소</button>
					<button class="result-btn" onclick="location.href='goMain.hmain'">확인</button>
				</div>
			</div>
			<!-- 우측 예약 내용 끝 -->
		</div>
	</section>
	<footer>
	</footer>
	<script>
		$(function(){
			ReservationCheckIn = '${ReservationCheck.checkIn}';
			ReservationCheckOut = '${ReservationCheck.checkOut}';
			week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
			getDayD1 = new Date(ReservationCheckIn.substring(0, 4), (ReservationCheckIn.substring(5, 7) * 1 - 1), ReservationCheckIn.substring(8, 10));
			getDayD2 = new Date(ReservationCheckOut.substring(0, 4), (ReservationCheckOut.substring(5, 7) * 1 - 1), ReservationCheckOut.substring(8, 10));
			console.log((getDayD2 - getDayD1)/(1000*60*60*24));
			getDay1 = week[getDayD1.getDay()];
			getDay2 = week[getDayD2.getDay()];
			console.log(getDay1);
			console.log(getDay2);
			getMonth = new Date(ReservationCheckIn.substring(0, 4), (ReservationCheckIn.substring(5, 7) * 1 - 1), ReservationCheckIn.substring(8, 10)).getMonth();
			termType = "";
			if (getMonth == 0 || getMonth == 1 || getMonth == 6 || getMonth == 7 || getMonth == 11) {
				termType = "SEASON";
			} else {
				termType = "OFFSEASON";
			}
			
			dayType = "";
			if(((getDayD2 - getDayD1)/(1000*60*60*24)) > 7){
				// 주말 항상 포함
				dayType = "WEEKEND";
			} else {
				if(getDayD2.getDay() < 5 && getDayD1.getDay() > 0){
					// 항상 주중
					dayType = "WEEK";
				} else {
					// 주말 포함
					dayType = "WEEKEND";
				}
			}
			
			var startDateD = '${ ReservationCheck.checkIn }';
			var startDate = new Date(startDateD.substring(0, 4), (startDateD.substring(5, 7) * 1 - 1), startDateD.substring(8, 10));
			var today = new Date();
			rfdDate = (today - startDate)/(1000*60*60*24);
			console.log(typeof(rfdDate));
			if(termType == 'SEASON'){
				// 성수기
				if(dayType == 'WEEK'){
					// 주중
					if(rfdDate >= 10){
						rfdDate = 10;
					} else if(rfdDate >= 7){
						rfdDate = 7;
					} else if(rfdDate >= 5){
						rfdDate = 5;
					} else if(rfdDate >= 3){
						rfdDate = 3;
					} else if(rfdDate >= 1){
						rfdDate = 1;
					} else {
						rfdDate = 0;
					}
				} else {
					// 주말
					if(rfdDate >= 10){
						rfdDate = 10;
					} else if(rfdDate >= 7){
						rfdDate = 7;
					} else if(rfdDate >= 5){
						rfdDate = 5;
					} else if(rfdDate >= 3){
						rfdDate = 3;
					} else if(rfdDate >= 1){
						rfdDate = 1;
					} else {
						rfdDate = 0;
					}
				}
			} else {
				// 비성수기
				if(dayType == 'WEEK'){
					// 주중
					if(rfdDate >= 2){
						rfdDate = 2;
					} else if(rfdDate >= 1){
						rfdDate = 1;
					} else {
						rfdDate = 0;
					}
				} else {
					// 주말
					if(rfdDate >= 2){
						rfdDate = 2;
					} else if(rfdDate >= 1){
						rfdDate = 1;
					} else {
						rfdDate = 0;
					}
				}
			}
			console.log(rfdDate);
			
			$(".reservation-cancel").click(function() {
				var roomType = ${roomType};
				console.log(termType);
				$.ajax({
					url : "ajaxCallRefund.hmain",
					type : "post",
					data : {
						roomType : roomType,
						termType : termType,
						dayType : dayType,
						rfdDate : rfdDate
					},
					success:function(data){
						console.log(data.rfdList);
						console.log(termType);	// 성수기 / 비성수기
						console.log(dayType);	// 주중 / 주말
						
						$.each(data.rfdList, function(index, list){
							console.log(list);
						});
						
						var rfdprice = ${ ReservationCheck.stayPrice } * (data.rfdList[0].rfdRate * 1);
						console.log(rfdprice);
						$("#rfdprice").val(rfdprice);
						var rsvDateD = ${ ReservationCheck.rsvDate };
						var rsvDate = new Date(rsvDateD.getFullYear(), rsvDateD.getMonth(), rsvDateD.getDate(), rsvDateD.getHours(), rsvDateD.getMinutes(), rsvDateD.getSeconds());
						$("#rsvDate").val(rsvDate);
						console.log($("#rsvDate").val());
						$(".reservation-check-modal").fadeIn();
					},
					error:function(data){
						console.log("에러");
					}
				});
			});
		});
	</script>
</body>
</html>