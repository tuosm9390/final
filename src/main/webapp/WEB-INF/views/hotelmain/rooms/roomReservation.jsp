<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.reservation {
	display: inline-flex;
	margin-top: 30px;
	width: 100%;
	height: 600px;
}

.reservation-img {
	border-right: 1px solid black;
	width: 39%;
	padding-top: 5px;
}

.reservation-img-item {
	height: 43%;
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
	padding: 10px;
	padding-left: 15px;
	width: 55%;
}

.reservation-table td{
	font-weight: bold;
	font-size: 18px;
	line-height: 21px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<div class="reservation">
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
					style="font-style: normal; font-weight: bold; font-size: 36px; line-height: 42px; text-decoration-line: underline;">예약</p>
				<br>
				<form action="" method="post">
					<table class="reservation-table">
						<tr>
							<td>· 숙박일정</td>
						</tr>
						<tr>
							<td><div id="datepicker"></div><div id="datepicker2"></div></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 우측 내용 끝 -->
		</div>	
	
	</section>
	<footer></footer>
	<script>
		$(function() {
			$("#datepicker").datepicker();
			$("#datepicker2").datepicker();
		});
	</script>
</body>
</html>