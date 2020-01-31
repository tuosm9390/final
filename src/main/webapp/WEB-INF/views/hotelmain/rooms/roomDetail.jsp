<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 좌우 방향 버튼 */
.carousel-control {
	width: 100px !important;
}
/* 중앙 표시 버튼 */
.carousel-indicators li:not (:first-child ){
	margin-left: 5px;
}

.reservation {
	position: absolute;
	width: 72%;
	height: 67px;
	left: 14%;
	top: 470px;
	background: #9A8975;
	display: inline-block;
}

.reservation-inner {
	margin-top: 8px;
	margin-right: 2px;
	padding: 15px;
	height: 50px;
	color: #6F6F6F;
	background: white;
}

.reservation-box {
	display: inline-flex;
}

.reservation-checkIn, .reservation-checkOut {
	width: 230px;
}

.reservation-adultselect, .reservation-childrenselect{
	width: 110px;
}

.reservation-text {
	width: 200px;
	padding: 13px !important;
	background: none !important;
	color: white;
	font-size: 15px;
	font-style: oblique;
}

.reservation-btn {
	width: 200px;
	height: 46px;
	margin-left: 40px;
	margin-top: 10px;
	background: #5E3055;
	color: white;
}

.reservation-btn:hover {
	cursor: pointer;
}

input[type=text], select {
	border: none !important;
	text-align: center;
}

input[type=text] {
	width: 120px;
}

.carousel-indicators {
	margin-bottom: 25px;
}

.roomDetailIntroduce {
	display: inline-flex;
	margin-top: 30px;
	width: 100%;
}

.detail-text {
	padding: 10px;
	padding-left: 15px;
	width: 55%;
}

.room-item {
	font-style: normal;
	font-weight: bold;
	font-size: 14px;
	margin-top: 20px;
	list-style: none;
	padding: 0;
}

.detail-img {
	border-right: 1px solid black;
	width: 45%;
}

.detail-img-item {
	width: 47%;
	margin: 10px;
	display: inline-table;
}

/* 홀수번째 이미지 */
.detail-img-item:nth-child(even){
	margin-right: 2%;
}
/* 짝수번째 이미지 */
.detail-img-item:nth-child(odd){
	margin-left: 0;
	margin-right: 2%;
}

.wrapper {
	position: relative;
}

.ion-calendar {
	position: absolute;
	right: 5px;
	top: 1px;
}

/* input */

#checkIn, #checkOut {
	text-align: center;
	cursor: pointer;
}

#checkIn:hover, #checkOut:hover {
	background-color: #eaf7ff;
}

#checkIn:focus, #checkOut:focus {
	outline: none;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<!-- 상단 이미지 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		    	<c:forEach var="i" begin="0" end="${ sessionScope.listsize - 1 }" >
			      <li data-target="#myCarousel" data-slide-to="${ i }"></li>
		    	</c:forEach>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		    	<c:forEach var="filePath" items="${ sessionScope.filePathList }" varStatus="st">
					<div class="item">
			        	<img src="${ contextPath }${ filePath }" style="width: 100%; height: 480px;">
					</div>
		    	</c:forEach>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
		
		<!-- 중앙 예약메뉴 -->
		<div id="reservationMenu" class="reservation">
			<form id="reservationForm" action="reservation.hmain" method="post">
			<div class="reservation-box">
				<div class="reservation-text">
					ROOM <br>
					RESERVATION
				</div>
				<div class="reservation-inner reservation-checkIn">
					<table>
						<tr>
							<td width="50%">체크인</td>
							<td>
								<div class="wrapper">
									<input type="text" id="checkIn" placeholder="날짜 선택" name="checkIn"
										readonly /><i class="ion-calendar"></i>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="reservation-inner reservation-checkOut">
					<table>
						<tr>
							<td width="50%">체크아웃</td>
							<td>
								<div class="wrapper">
									<input type="text" id="checkOut" placeholder="날짜 선택" name="checkOut"
										readonly /><i class="ion-calendar"></i>
								</div>
							</td>
						</tr>
					</table>
					
				</div>
				<div class="reservation-inner reservation-adultselect">
					
					<table>
						<tr>
							<td width="70%">성인</td>
							<td>
								<select id="adult" name="adult">
									<option value="0" selected>0</option>
									<c:forEach var="i" begin="1" end="${ sessionScope.roomInfo.maxPer }">
									<option value="${ i }">${ i }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div class="reservation-inner reservation-childrenselect">
					<table>
						<tr>
							<td width="70%">소인</td>
							<td>
								<select id="child" name="child">
									<option value="0" selected>0</option>
									<c:forEach var="i" begin="1" end="${ sessionScope.roomInfo.maxPer - 1 }">
									<option value="${ i }">${ i }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div id="reservation-btn" class="reservation-inner reservation-btn">
					<h4 align="center" style="margin: 0 0;">예약하기</h4>
				</div>
			</div>
			</form>
		</div>
		<!-- 중앙 예약메뉴 끝 -->

		<!-- 하단 세부 내용 -->
		<div class="roomDetailIntroduce" >
			<!-- 좌측 이미지 -->
			<div class="detail-img">
				<c:forEach var="filePath" items="${ sessionScope.filePathList }" varStatus="st">
					<div class="detail-img-item">
						<img src="${ contextPath }${ filePath }" style="width: 100%; height: 200px;">
					</div>
				</c:forEach>
			</div>
			<!-- 좌측 이미지 끝 -->
			
			<!-- 우측 내용 -->
			<div class="detail-text">
				<p
					style="font-style: normal; font-weight: bold; font-size: 36px; line-height: 42px; text-decoration-line: underline;">${sessionScope.roomInfo.rt_Name}</p>
				<div style="border: 1px solid black; width: 100%; height: 0;"></div>
				
				<br>
				<p style="font-style: normal; font-weight: bold; font-size: 16px; line-height: 19px;">프렌치
					모던 스타일 객실과 별도의 작은 정원 테라스</p>

				<ul class="room-item">
				<c:forTokens items="${ sessionScope.roomInfo.rm_Option }" var="option" delims=",">
					<li>${ option }</li>
				</c:forTokens>
				</ul>
			</div>
			<!-- 우측 내용 끝 -->
		</div>
		<!-- 하단 세부 내용 끝 -->
	</section>
	<footer>
	</footer>
	
	<script>
		//datepicker
		$(function() {
			date = new Date();

			checkIn = $("#checkIn").datepicker({
				autoClose : true,
				minDate : new Date(),
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					//종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
					startNum = date;
					$("#checkOut").datepicker({
						minDate : new Date(startNum),
					});
				}
			}).data('datepicker');

			checkOut = $("#checkOut").datepicker({
				autoClose : true,
				minDate : new Date(),
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					endNum = date;
					$('#checkIn').datepicker({
						//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
						maxDate : new Date(endNum),
					});
				}
			}).data('datepicker');
		});

		$("#reservation-btn").click(function() {
			if($("#checkIn").val() != "" && $("#checkOut").val() != ""){
				if(Number($("#adult").val()) >= 1 && (Number($("#adult").val()) + Number($("#child").val())) <= Number('${roomInfo.maxPer}')){
					$("#reservationForm").submit();
				} else {
					alert("인원은 성인 최소 1명이상, 최대 ${roomInfo.maxPer}명 입니다.");
				};
			} else {
				alert("체크인 체크아웃날짜를 선택해주세요");
			};
		});
		
		$(function(){
			$(".carousel-indicators").children().eq(0).addClass('active');
			$(".carousel-inner").children().eq(0).addClass('active');
		});
	</script>
</body>
</html>