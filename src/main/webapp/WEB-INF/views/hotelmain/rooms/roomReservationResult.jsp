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
	padding-right: 20px;
}

.reservation label{
	margin: 0 !important;
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
			
			<!-- 우측 예약 내용 -->
			<div class="reservation-text">
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px;">예약이 완료되었습니다.</p>
				<!-- 예약자 정보 -->
				<div style="border: 1px solid black; width: 100%; height: 0; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);"></div>
				<br>
					<table class="reservation-table">
						<tr>
							<td style="font-weight: bold; font-size: 24px;">예약자 정보</td>
						</tr>
						<tr>
							<td><li>예약번호</li></td>
							<td><label>2020202020</label></td>
						</tr>
						<tr>
							<td><li>예약자명</li></td>
							<td><label>이름</label></td>
						</tr>
						<tr>
							<td><li>전화번호</li></td>
							<td><label>번호</label></td>
						</tr>
						<tr>
							<td><li>이메일</li></td>
							<td><label>이메일</label></td>
						</tr>
						<tr>
							<td><li>결제금액</li></td>
							<td><label>금액</label></td>
						</tr>
						<tr>
							<td><li>체크인일자</li></td>
							<td><label>날짜</label></td>
							<td><li>체크인 시간</li></td>
							<td colspan="4"><label>시간</label></td>
						</tr>
						<tr>
							<td><li>체크아웃일자</li></td>
							<td><label>날짜</label></td>
							<td><li>객실 인원</li></td>
							<td>성인</td>
							<td><label>인원</label></td>
							<td>어린이</td>
							<td><label>인원</label></td>
						</tr>
					</table>
				<br>
				<div style="border: 1px solid black; width: 100%; height: 0; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);"></div>
				<br>
				<!-- 객실 정보 -->
				<table class="reservation-table">
					<tr>
						<td style="font-weight: bold; font-size: 24px;">객실 정보</td>
					</tr>
					<tr>
						<td><li>객실명</li></td>
						<td colspan="4"><label>2020202020</label></td>
					</tr>
					<tr>
						<td><li>옵션</li></td>
						<td><label>더블베드</label></td>
						<td><label>비흡연</label></td>
						<td><label>반려동물 동반</label></td>
						<td><label>조식포함</label></td>
					</tr>
					<tr>
						<td><li>요청사항</li></td>
						<td><label>요청사항</label></td>
					</tr>
				</table>
				<br>
				<div class="reservation-page_btn" align="right">
					<button class="result-btn" onclick="location.href='goMain.hmain'">확인</button>
					<br><br><br>
				</div>
			</div>
			<!-- 우측 내용 끝 -->
		</div>
	</section>
	<footer>
	</footer>
</body>
</html>