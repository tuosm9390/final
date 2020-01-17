<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 250px;
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
	height: 600px;
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
	height: 100%;
	padding: 5px;
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
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		      <li data-target="#myCarousel" data-slide-to="3"></li>
		      <li data-target="#myCarousel" data-slide-to="4"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		      <div class="item active">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		    
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		      
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		      
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
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
			<div class="reservation-box">
				<div class="reservation-text">
					ROOM <br>
					RESERVATION
				</div>
				<div class="reservation-inner reservation-checkIn">
					<table>
						<tr>
							<td width="50%">체크인</td>
							<td><input type="text" id="checkIn" name="checkIn"></td>
						</tr>
					</table>
				</div>
				<div class="reservation-inner reservation-checkOut">
					<table>
						<tr>
							<td width="50%">체크아웃</td>
							<td><input type="text" id="checkOut" name="checkOut"></td>
						</tr>
					</table>
					
				</div>
				<div class="reservation-inner reservation-adultselect">
					<table>
						<tr>
							<td>성인</td>
							<td>
								<select id="adult">
									<option selected>1</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div class="reservation-inner reservation-childrenselect">
					<table>
						<tr>
							<td>어린이</td>
							<td>
								<select id="children">
									<option selected></option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div id="reservation-btn" class="reservation-inner reservation-btn">
					<h4 align="center" style="margin: 0 0;">예약하기</h4>
				</div>
			</div>
		</div>
		<!-- 중앙 예약메뉴 끝 -->
		
		<!-- 하단 세부 내용 -->
		<div class="roomDetailIntroduce" >
			<!-- 좌측 이미지 -->
			<div class="detail-img">
				<div class="detail-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
				<div class="detail-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
				<div class="detail-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
				<div class="detail-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
				<div class="detail-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
			</div>
			<!-- 좌측 이미지 끝 -->
			
			<!-- 우측 내용 -->
			<div class="detail-text">
				<p
					style="font-style: normal; font-weight: bold; font-size: 36px; line-height: 42px; text-decoration-line: underline;">ROOM</p>
				<div style="border: 1px solid black; width: 100%; height: 0;"></div>
				
				<br>
				<p style="font-style: normal; font-weight: bold; font-size: 16px; line-height: 19px;">프렌치
					모던 스타일 객실과 별도의 작은 정원 테라스</p>

				<ul class="room-item">
					<li>세계 최고 품질의 매트리스</li>
					<li>공기 정화 시스템</li>
					<li>Only One Collection 가구</li>
					<li>Jacuzzi 욕조</li>
					<li>Organic 화장품 (사월 호텔 자체 개발 – 프랑스산 천연 오일 사용)</li>
					<li>Hotel BGM System</li>
					<li>4월 호텔의 향을 이용한 디퓨져</li>
					<li>친환경 고급 인테리어</li>
					<li>정원 테라스</li>
				</ul>
				
				<br>
				<div style="border: 1px solid black; width: 100%; height: 0;"></div>
				<br>
				<p style="font-style: normal; font-weight: bold; font-size: 16px; line-height: 19px;">
				LUXURIOUS 6-METER TALL DOUBLE-FLOOR ROOM WITH THE STATE OF THE ART SPA EQUIPMENT</p>

				<ul class="room-item">
					<li>Large Jacuzzi</li>
					<li>Basic cooking gear</li>
					<li>Mirror TV</li>
					<li>Air purification system</li>
					<li>Only One Collection furniture</li>
					<li>Organic cosmetics (Developed by Hotel April using oil from France)</li>
					<li>BGM System</li>
					<li>Hotel April’s unique scent diffuser</li>
					<li>Attractive interior layout and design</li>
					<li>Terrace</li>
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
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					endNum = date;
					//종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
					$("#checkOut").datepicker({
						minDate : new Date(endNum),
					});
				}
			}).data('datepicker');

			checkOut = $("#checkOut").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					startNum = date;
					$('#checkIn').datepicker({
						//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
						maxDate : new Date(startNum),
					});
				}
			}).data('datepicker');
		});

		$("#reservation-btn").click(function() {
			location.href = "reservation.hmain";
		});
	</script>
</body>
</html>