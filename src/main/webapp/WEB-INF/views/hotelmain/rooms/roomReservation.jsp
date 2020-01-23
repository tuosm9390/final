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
	
}
/* 짝수번째 이미지 */
.reservation-img-item:nth-child(odd) {
	margin-left: 0;
}

.reservation-text {
	position: absolute;
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
/* 	border: 1px solid black; */
}

.reservation-price{
	font-weight: bold;
	font-size: 18px;
	line-height: 30px;
	padding: 0;
	margin-bottom: 0;
}
.name{
	float: left;
}

.value{
	float: right;
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
	font-size: 16px;
}
.option-radio{
	padding-left: 5px;
}

.reservation-btn{
	margin-left: 20px;
	width: 100px;
}

.option label{
	font-weight: normal !important;
}

.refund-table{
	width: 100%;
	border-collapse: collapse;
}

.refund-table tr:not(:last-child) td{
	border: 1px solid black;
	text-align: center;
	padding: 5px 0;
}

.refund-table tr:last-child td{
	border: none;
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
				<form action="reservationResult.hmain" method="post" id="reservationInfo">
					<table class="reservation-table" width="90%">
						<tr>
							<td colspan="4"><li>숙박 일정</li></td>
							<td colspan="2" rowspan="2" style="width: 40%;">
								<ul class="reservation-price">
									<li><div class="name">객실요금</div><div class="value">원</div></li>
									<li><div class="name">봉사료</div><div class="value">원</div></li>
									<li><div class="name">요금 합계</div><div class="value">원</div></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="width: 70%; padding-right: 210px; padding-left: 23px;">
								<div class="schedule">
									<div class="name">체크인</div>
									<div class="value">
										<input type="hidden" name="CheckIn" value="${ CheckIn }">${ CheckIn }
									</div>
									<br>
									<div class="name">체크아웃</div>
									<div class="value">
										<input type="hidden" name="CheckOut" value="${ CheckOut }">${ CheckOut }
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 250px;"><li>체크인 시간</li></td>
							<td style="padding-left: 30px; width: 80px;">
								<select class="checkIn-time" name="checkIntime">
									<option>12:00</option>
									<option>13:00</option>
									<option>14:00</option>
								</select>
							</td>
							<td>
								<p style="font-size: 16px; color: #9C8B8B; margin: 0;">* 노쇼규정</p>
							</td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td colspan="4">
							<p style="font-size: 12px;">
							선택하신 체크인 시간 2시간 이후까지 호텔에 방문하지 않을 경우 예약취소처리 되며
							금액은 환불되지 않습니다. 변동사항은 호텔측으로 연락주시기 바랍니다.</p>
							</td>
						</tr>
						<tr>
							<td colspan="8"><li>예약자 정보 입력</li></td>
						</tr>
						<tr>
							<td><li>투숙 인원</li></td>
							<td colspan="5">성인 <input type="hidden" name="adult" value="${ adult }">${ adult }명 &emsp;
							소인 <input type="hidden" name="children" value="${ children }">${ children }명</td>
						</tr>
						<tr>
							<td><li>예약자명</li></td>
							<td colspan="5"><input type="text" id="reservName" name="reservName"></td>
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
							<td colspan="3"><li>옵션 선택사항</li></td>
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
							<td rowspan="2" style="line-height: 30px;">
								<ul class="option">
									<li><label>금연객실</label></li>
									<li><label>반려동물 동반</label></li>
									<li><label>조식선택</label></li>
									<li><label>침대유형</label></li>
								</ul>
							</td>
							<td colspan="2" rowspan="2" style="line-height: 30px; width: 50%;">
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
					<h5>※ 공제 또는 배상 비율(소비자 책임)</h5>
					<table class="refund-table">
						<tr>
							<td style="width: 15%;" rowspan="2"></td>
							<td style="width: 35%;" colspan="2"><h4 style="font-weight: bold;">[ 성수기 ]</h4></td>
							<td style="width: 15%;" rowspan="2"></td>
							<td style="width: 35%;" colspan="2"><h4 style="font-weight: bold;">[ 비수기 ]</h4></td>
						</tr>
						<tr>
							<td style="font-weight: bold;">주중</td>
							<td style="font-weight: bold;">주말</td>
							<td style="font-weight: bold;">주중</td>
							<td style="font-weight: bold;">주말</td>
						</tr>
						<tr>
							<td>10일전</td>
							<td>전액 환불</td>
							<td>전액 환불</td>
							<td rowspan="2">2일전</td>
							<td rowspan="2">전액 환불</td>
							<td rowspan="2">전액 환불</td>
						</tr>
						<tr>
							<td>7일전</td>
							<td>10%</td>
							<td>20%</td>
						</tr>
						<tr>
							<td>5일전</td>
							<td>30%</td>
							<td>40%</td>
							<td rowspan="2">1일전</td>
							<td rowspan="2">10%</td>
							<td rowspan="2">20%</td>
						</tr>
						<tr>
							<td>3일전</td>
							<td>50%</td>
							<td>60%</td>
						</tr>
						<tr>
							<td>1일전</td>
							<td>80%</td>
							<td>90%</td>
							<td rowspan="2">노쇼</td>
							<td rowspan="2">20%</td>
							<td rowspan="2">30%</td>
						</tr>
						<tr>
							<td>노쇼</td>
							<td>100%</td>
							<td>100%</td>
						</tr>
						<tr>
							<td colspan="6"><h4 style="font-weight: bold;">[ 기후변화 또는 천재지변, 거짓 과장 광고]</h4></td>
						</tr>
						<tr>
							<td colspan="6">전액 환불</td>
						</tr>
						<tr>
							<td colspan="6" style="color: gray; text-align: right;">※ 사업자 책임일 경우 계약금 + 배상 비율만큼 배상</td>
						</tr>
					</table>
					<br>
					<label style="font-weight: 200; font-size: 16px; line-height: 21px; color: rgba(145, 133, 133, 0.71); float: right;">
						<input type="checkbox" id="agreement" name="agreement"
						style="width: 19px; height: 19px; vertical-align: middle; margin-top: 0px;">위 규정을 확인하였습니다.
					</label>
					</div>
				</div>
				<!-- 규정 안내 끝 -->
				<br><br>
				<div class="reservation-page_btn" align="right">
					<button class="reservation-btn reservation-cancel">취소</button>
					<button class="reservation-btn reservation-submit">예약</button>
					<br><br><br>
				</div>
			</div>
			<!-- 우측 내용 끝 -->
		</div>
	
	</section>
	<footer></footer>
	<script>
		$(".reservation-cancel").click(function(){
			location.href='goRooms.hmain';
		});
		
		$(".reservation-submit").click(function(){
			if($("#agreement").prop("checked") == true){
// 				location.href='reservationResult.hmain';
				$("#reservationInfo").submit();
			} else {
				alert("환불 규정을 확인해주세요.");
			}
		});
	</script>
</body>
</html>