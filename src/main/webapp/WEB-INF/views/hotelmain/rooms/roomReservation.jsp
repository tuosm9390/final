<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

#userName{
	width: 100px;
}

.phone{
	width: 130px;
}

#email{
	width: 150px;
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
/* 	display : table-cell; */
}

.refund-table td{
	border: 1px solid black;
	text-align: center;
	padding: 5px 0;
}

.refund-table tr:last-child td{
/* 	border: none; */
}

.test{
	width: 49.9%;
    position: relative;
    display: inline-flex;
    margin-right: -5.4px;
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
				<c:forEach var="filePath" items="${ sessionScope.filePathList }" varStatus="st">
					<div class="reservation-img-item">
						<img src="${ contextPath }${ filePath }" style="width: 100%; height: 100%;">
					</div>
				</c:forEach>
			</div>
			<!-- 좌측 이미지 끝 -->
			
			<!-- 우측 내용 -->
			<div class="reservation-text">
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px; text-decoration-line: underline;">예약</p>
				<br>
				<!-- 숙박 일 수 계산 -->
				<fmt:parseDate var="startDate_D" value="${sessionScope.rsv.checkIn}" pattern="yyyy-MM-dd"/>
				<fmt:parseDate var="endDate_D" value="${sessionScope.rsv.checkOut}" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber var="startDate_N" value="${startDate_D.time/(1000*60*60*24)}" integerOnly="true"/>
				<fmt:parseNumber var="endDate_N" value="${endDate_D.time/(1000*60*60*24)}" integerOnly="true"/>
				
				<form action="reservationPay.hmain?roomType=${ sessionScope.roomInfo[0].rt_No }" method="post" id="reservationInfo">
					<input type="hidden" name="roomNo" id="roomNo" value="${ sessionScope.rsv.rmNo }">
					<table class="reservation-table" width="90%">
						<tr>
							<td colspan="4"><li>숙박 일정</li></td>
							<td colspan="2" rowspan="2" style="width: 40%;">
								<ul class="reservation-price">
									<li><div class="name">객실요금</div><div class="roomPrice-value value"></div></li>
									<li><div class="name">봉사료</div><div class="vlt-value value"></div></li>
									<li><div class="name">요금 합계</div><div class="total-value value"></div>
									<input type="hidden" name="stayPrice" id="stayPrice"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="width: 70%; padding-right: 210px; padding-left: 23px;">
								<div class="schedule">
									<div class="name">체크인</div>
									<div class="value">
										<input type="hidden" name="checkIn" value="${ sessionScope.rsv.checkIn }">${ sessionScope.rsv.checkIn }
									</div>
									<br>
									<div class="name">체크아웃</div>
									<div class="value">
										<input type="hidden" name="checkOut" value="${ sessionScope.rsv.checkOut }">${ sessionScope.rsv.checkOut }
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 250px;"><li>체크인 시간</li></td>
							<td style="padding-left: 30px; width: 80px;">
								<select class="checkIn-time" name="checkInTime">
									<option value="12:00">12:00</option>
									<option value="13:00">13:00</option>
									<option value="14:00">14:00</option>
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
							<td colspan="5">대인 ${ sessionScope.rsv.adult }명 &emsp;
							소인 ${ sessionScope.rsv.child }명</td>
						</tr>
						<tr>
							<td><li>예약자명</li></td>
							<td colspan="5"><input type="text" id="userName" name="userName">&emsp;
							<label style="font-weight: normal; font-size: x-small;">※두 글자 이상의 한글을 입력해주세요.</label></td>
						</tr>
						<tr>
							<td>
								<li>전화번호</li>
							</td>
							<td colspan="3">
								<input type="text" id="phone" class="phone" name="phone" maxlength="11"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&emsp;
								<label style="font-weight: normal; font-size: x-small;">※숫자만 입력해주세요.</label>
							</td>
							<td colspan="3"><li>옵션 선택사항</li></td>
						</tr>
						<tr>
							<td><li>이메일</li></td>
							<td colspan="3">
								<input type="email" id="email" name="email">
							</td>
							<td rowspan="2" style="line-height: 30px;">
								<ul class="option">
									<li><label>조식선택</label></li>
								</ul>
							</td>
							<td colspan="2" rowspan="2" style="line-height: 30px; width: 50%;">
								<ul class="option-radio">
									<li>
										<label><input type="radio" id="breakfast-y" name="rsvOption" value="Y" checked>Y</label>&emsp;
										<label><input type="radio" id="breakfast-n" name="rsvOption" value="N">N</label>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: text-top;"><li>요청사항</li></td>
							<td colspan="3"><textarea name="rsvReq" rows="3" cols="30" style="resize: none; height: auto;"></textarea>
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
					<h5>※ 공제 또는 배상 비율(소비자 책임시 해당 비율 공제 후 환불)</h5>
					<div class="test">
					<table class="refund-table">
						<tr>
							<td style="width: 15%;" rowspan="2"></td>
							<td style="width: 35%;" colspan="2"><h4 style="font-weight: bold;">[ 성수기 ]</h4></td>
						</tr>
						<tr>
							<td style="font-weight: bold;">주중</td>
							<td style="font-weight: bold;">주말</td>
						</tr>
						<c:forEach var="rfdList" items="${ rfdList }">
							<c:if test="${ rfdList.dayType eq 'WEEK'}">
								<tr>
									<c:if test="${ rfdList.termType eq 'SEASON' }">
										<c:if test="${ rfdList.rfdDate ne '0' }">
											<td>${ rfdList.rfdDate }일전</td>
											<c:if test="${ rfdList.rfdRate eq '100' }">
												<td>전액 환불</td>
												<td>전액 환불</td>
											</c:if>
											<c:if test="${ rfdList.rfdRate eq '0' }">
												<td>100%</td>
												<td>100%</td>
											</c:if>
											<c:if test="${ rfdList.rfdRate ne '0' && rfdList.rfdRate ne '100' }">
												<td>${ 100 - rfdList.rfdRate }%</td>
												<td>${ 110 - rfdList.rfdRate }%</td>
											</c:if>
										</c:if>
										<c:if test="${ rfdList.rfdDate eq '0' }">
											<tr>
												<c:if test="${ rfdList.termType eq 'SEASON' }">
													<td>노쇼</td>
													<td>100%</td>
													<td>100%</td>
												</c:if>
											</tr>
										</c:if>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					</div>
					<div class="test">
					<table class="refund-table">
						<tr>
							<td style="width: 15%;" rowspan="2"></td>
							<td style="width: 35%;" colspan="2"><h4 style="font-weight: bold;">[ 비수기 ]</h4></td>
						</tr>
						<tr>
							<td style="font-weight: bold;">주중</td>
							<td style="font-weight: bold;">주말</td>
						</tr>
						<c:forEach var="rfdList" items="${ rfdList }">
							<c:if test="${ rfdList.dayType eq 'WEEK'}">
								<tr>
									<c:if test="${ rfdList.termType eq 'OFFSEASON' }">
										<c:if test="${ rfdList.rfdDate ne '0' }">
											<td height="62px;">${ rfdList.rfdDate }일전</td>
											<c:if test="${ rfdList.rfdRate eq '100' }">
												<td>전액 환불</td>
												<td>전액 환불</td>
											</c:if>
											<c:if test="${ rfdList.rfdRate eq '0' }">
												<td>100%</td>
												<td>100%</td>
											</c:if>
											<c:if test="${ rfdList.rfdRate ne '0' && rfdList.rfdRate ne '100' }">
												<td>${ 100 - rfdList.rfdRate }%</td>
												<td>${ 110 - rfdList.rfdRate }%</td>
											</c:if>
										</c:if>
										<c:if test="${ rfdList.rfdDate eq '0' }">
											<tr>
												<c:if test="${ rfdList.termType eq 'OFFSEASON' }">
													<td height="62px;">노쇼</td>
													<td>100%</td>
													<td>100%</td>
												</c:if>
											</tr>
										</c:if>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					</div>
					<div class="test">
						<h4 style="font-weight: bold;">[ 기후변화 또는 천재지변, 거짓 과장 광고 ] &emsp;&emsp;&emsp;계약금 환급
						</h4>
					</div>
					<br><br>
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
		$(function(){
			$(".reservation-cancel").click(function(){
				location.href='goRooms.hmain';
			});
			
			$(".reservation-submit").click(function(){
				var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var nameRule = /^[가-힣]/;
				
				if(!emailRule.test($("#email").val())) {
					return false;
				} else {
					if(!nameRule.test($("#userName").val())){
						return false;
					} else {
						if($("#agreement").prop("checked") == true){

							// 옵션 선택사항 값 전달
							if($("#breakfast-y").prop("checked") == true){
								$(this).attr("disabled", false);
								$("#breakfast-n").attr("disabled", true);
							} else if($("#breakfast-n").prop("checked") == true){
								$(this).attr("disabled", false);
								$("#breakfast-y").attr("disabled", true);
							};
							
							$("#reservationInfo").submit();
						} else {
							alert("환불 규정을 확인해주세요.");
						};
					};
				};
			});
		});
		
		
		// 숙박기간
		var list = ${(endDate_N - startDate_N)};
		// 체크인날짜
		var startDateD = '${sessionScope.rsv.checkIn}';
		var startDate = new Date(startDateD.substring(0, 4), (startDateD.substring(5, 7) * 1 - 1), startDateD.substring(8, 10));
		// 체크아웃날짜
		var endDateD = '${sessionScope.rsv.checkOut}';
		var endDate = new Date(endDateD.substring(0, 4), (endDateD.substring(5, 7) * 1 - 1), endDateD.substring(8, 10));
		var roomprice = JSON.parse('${roomprice}');
		console.log(roomprice);
		
		
		var feedayscnt = ${(endDate_N - startDate_N)};
		var totalFee = 0;
		for (var i = 0; i < feedayscnt; i++) {
			var feedate = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate() + i);
			totalFee = detailModalFee(feedate, totalFee); //숙박이니까 STAY
			if(i == (feedayscnt - 1)){
				$(".roomPrice-value").append(Math.floor(totalFee));
				$(".vlt-value").append(Math.floor(totalFee / 10));
				$(".total-value").append(Math.floor(totalFee * 1.1));
				$("#stayPrice").val(Math.floor(totalFee * 1.1));
			}
		}

        function detailModalFee(feedate, totalFee) {
			var week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
			var feeday = week[feedate.getDay()];
			var termType;
			if ((feedate.getMonth()) == 0
					|| (feedate.getMonth()) == 1
					|| (feedate.getMonth()) == 6
					|| (feedate.getMonth()) == 7
					|| (feedate.getMonth()) == 11) {
				termType = "SEASON";
			} else {
				termType = "OFFSEASON";
			}
			
			for (var i = 0; i < roomprice.length; i++) {
				if (roomprice[i].dayType == feeday && roomprice[i].termType == termType) {
					totalFee += roomprice[i].price;
				}
			}
			
			return totalFee;
        }
	</script>
</body>
</html>