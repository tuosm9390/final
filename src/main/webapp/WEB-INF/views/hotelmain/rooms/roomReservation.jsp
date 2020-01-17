<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
/* 	border-left: 1px solid black; */
	left: 40%;
	padding: 10px;
	padding-left: 15px;
	width: 55%;
}

.reservation-table tr{
	height: 40px;
}

.reservation-table td{
	font-weight: bold;
	font-size: 18px;
}

.reservation-price{
	font-weight: bold;
	font-size: 18px;
	line-height: 50px;
}

.reservation-table .person{
	width: 50px;
}

#name{
	width: 100px;
}

.phone{
	width: 50px;
}

#email{
	width: 120px;
}

.datepicker{
	border: none !important;
}

.option, .option-radio{
	padding-left: 0;
	list-style: none;
}
.option-radio{
	padding-left: 5px;
}

.refund-box{
	display: inline-flex;
}

.refund{
	margin-left: 60px;
	font-size: 14px;
}

.reservation-btn{
	margin-right: 20px;
}

.option label{
	font-weight: normal !important;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<div class="site-outer-box">
			<!-- 좌측 이미지 -->
			<div class="reservation-img">
				<div class="reservation-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
				<div class="reservation-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
				<div class="reservation-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
				<div class="reservation-img-item">
					<img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 100%;">
				</div>
			</div>
			<!-- 좌측 이미지 끝 -->
			
			<!-- 우측 내용 -->
			<div class="reservation-text">
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px; text-decoration-line: underline;">예약</p>
				<br>
				<form action="" method="" id="reservationInfo">
					<table class="reservation-table">
						<tr>
							<td colspan="4"><li> 숙박일정</li></td>
							<td colspan="2" rowspan="2">
								<ul class="reservation-price">
									<li>총 숙박 일수 : 박</li>
									<li>객실요금 : 원</li>
									<li>봉사료 : 원</li>
									<li>요금 합계 : 원</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="schedule" style="display: inline-flex;">
									<div id="checkIn"></div>&nbsp;&nbsp;
									<div id="checkOut"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td><li>객실 인원</li></td>
							<td>성인 <input type="text" class="person" readonly></td>
							<td>어린이 <input type="text" class="person" readonly></td>
							<td><li>체크인 시간</li></td>
							<td>
								<select class="checkIn-time">
									<option>12:00</option>
								</select>
							</td>
							<td>
								<p style="font-size: 16px; color: #9C8B8B; margin: 0;">* 노쇼규정</p>
							</td>
						</tr>
						<tr>
							<td colspan="5"><li>예약자 정보 입력</li></td>
							<td rowspan="2">
							<p style="font-size: 12px;">
							선택하신 체크인 시간<br>
							2시간 이후까지 호텔에<br>
							방문하지 않을 경우<br>
							예약취소처리 되며<br>
							금액은 환불되지 않습니다.<br>
							변동사항은 호텔측으로<br>
							연락주시기 바랍니다.</p>
							</td>
						</tr>
						<tr>
							<td><li>예약자명</li></td>
							<td colspan="4"><input type="text" id="name" name="name"></td>
						</tr>
						<tr>
							<td>
								<li>전화번호</li>
							</td>
							<td colspan="3">
								<select id="phone" name="phone">
									<option selected>010</option>
									<option>011</option>
								</select> - 
								<input type="text" id="phone2" class="phone" name="phone2"> - 
								<input type="text" id="phone3" class="phone" name="phone3">
							</td>
							<td colspan="2"><li>옵션 선택사항</li></td>
						</tr>
						<tr>
							<td><li>이메일</li></td>
							<td colspan="3">
								<input type="text" id="email" name="email"> @ 
								<select id="email2" name="email2">
									<option selected>naver.com</option>
									<option>kakao.co.kr</option>
									<option>daum.com</option>
								</select>
							</td>
							<td rowspan="2">
								<ul class="option">
									<li><label>금연객실</label></li>
									<li><label>반려동물 동반</label></li>
									<li><label>조식선택</label></li>
									<li><label>침대유형</label></li>
								</ul>
							</td>
							<td rowspan="2">
								<ul class="option-radio">
									<li>
										<label id="non-smoke-y"><input type="radio" name="non-smoke" checked>Y</label>&emsp;
										<label id="non-smoke-n"><input type="radio" name="non-smoke">N</label>
									</li>
									<li>
										<label id="animal-y"><input type="radio" name="animal">Y</label>&emsp;
										<label id="animal-n"><input type="radio" name="animal" checked>N</label>
									</li>
									<li>
										<label id="breakfast-y"><input type="radio" name="breakfast" checked>Y</label>&emsp;
										<label id="breakfast-n"><input type="radio" name="breakfast">N</label>
									</li>
									<li>
										<label id="bed-twin"><input type="radio" name="bed" checked>트윈</label>
										<label id="bed-double"><input type="radio" name="bed">더블</label>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: text-top;"><li>요청사항</li></td>
							<td colspan="3"><textarea rows="3" cols="30" style="resize: none; height: auto;"></textarea>
						</tr>
					</table>
				</form>
				<br>
				<div style="border: 1px solid black; width: 100%; height: 0; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);"></div>
				<br>
				
				<!-- 환불규정 -->
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px;">환불규정
				</p>
				<!-- 규정 안내 -->
				<div class="refund-box">
					<!-- 성수기 -->
					<div class="refund peak-refund">
						<h4 style="font-weight: bold;">[ 성수기 주중 / 성수기 주말 ]</h4>
	<p style="font-weight: bold;">- 소비자 책임</p>
	10일전 or 계약 당일 : 계약금 환급 / 동일<br>
	7일전 : 10% 공제 / 20% 공제<br>
	5일전 : 30% 공제 / 40% 공제<br>
	3일전 : 50% 공제 / 60% 공제<br>
	1일전 또는 당일 : 80% 공제 / 90% 공제<br>
	<br>
	<p style="font-weight: bold;">- 사업자 책임</p>
	10일전 : 계약금 / 동일<br>
	7일전 : 계약금+10%배상 / 계약금+20%배상<br>
	5일전 : 계약금+30%배상 / 계약금+40%배상<br>
	3일전 : 계약금+50%배상 / 계약금+60%배상<br>
	1일전 또는 당일 : 손해배상 / 동일<br>
					</div>
					
					<!-- 비성수기 -->
					<div class="refund nonpeak-refund">
						<h4 style="font-weight: bold;">[ 비수기 주중 / 비수기 주말 ]</h4>
	<p style="font-weight: bold;">- 소비자 책임</p>
	2일전 : 계약금 / 동일<br>
	1일전 : 10%공제 / 20%공제<br>
	당일 또는 노쇼 : 20%공제 / 30%공제<br>
	<br>
	<p style="font-weight: bold;">- 사업자 책임</p>
	2일전 : 계약금 / 동일<br>
	1일전 : 계약금+10%배상 / 계약금+20%배상<br>
	당일 : 계약금+20%배상 / 계약금+30%배상<br>
	
						<!-- 기후변화 -->
						<div class="refund accident-refund" style="margin: 0;" align="center">
							<br>
							<h4 style="font-weight: bold;">[ 기후변화 또는 천재지변, 거짓 과장 광고]</h4>
							계약금 환급
						</div>
						<br>
						<label style="font-weight: 200; font-size: 16px; line-height: 21px; color: rgba(145, 133, 133, 0.71); float: right;">
							<input type="checkbox" id="agreement" name="agreement"
							style="width: 19px; height: 19px; vertical-align: middle; margin-top: 0px;">위 규정을 확인하였습니다.
						</label>
					</div>
				</div>
				<!-- 규정 안내 끝 -->
				
				<div class="reservation-page_btn" align="right">
					<button class="reservation-btn reservation-cancel">뒤로가기</button>
					<button class="reservation-btn reservation-submit">예약하기</button>
					<br><br><br>
				</div>
			</div>
			<!-- 우측 내용 끝 -->
		</div>
	
	</section>
	<footer></footer>
	<script>
		$(function() {
			var date = new Date();
			$("#checkIn").datepicker({
				moveToOtherMonthsOnSelect: false,
			});
			$("#checkOut").datepicker();
		});
		
		$(".reservation-cancel").click(function(){
			location.href='goRooms.hmain';
		});
		
		$(".reservation-submit").click(function(){
			location.href='reservationResult.hmain';
		});
	</script>
</body>
</html>