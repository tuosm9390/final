<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.site-outer-box {
	display: inline-flex;
	width: 100%;
}

.left-section {
	padding: 1px;
	position: fixed;
	width: 38%;
	border-right: 1px solid black;
}

.right-section {
	position: absolute;
	left: 40%;
	padding: 10px;
	padding-left: 15px;
	width: 51%;
}

.qnaDetail-table tr, .answer-table tr{
	height: 40px;
	font-size: 18px;
}

.qnaDetail-table tr td:first-child, .qnaDetail-table tr td:nth-child(3), .answer-table tr td:first-child{
	font-weight: bold;
	padding-right: 20px;
}

.qnaDetail-table tr td:nth-child(2) {
	width: 350px;
}

textarea{
	height: auto !important;
}

textarea:focus{
	outline-style: none;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<!-- 내용 영역 -->
		<div class="site-outer-box">
			<!-- 왼쪽 이미지 영역 -->
			<div class="left-section">
				<div class="left-section-img-item">
					<img src="${ contextPath }/resources/images/hotel.png" style="width: 100%; height: 100%;">
				</div>
			</div>
			<!-- 왼쪽 이미지 영역 끝 -->
			
			<!-- 오른쪽 내용 영역 -->
			<div class="right-section">
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px; text-decoration: underline;">문의 상세</p>
				<br><br>
				
				<!-- 내용 영역 -->
				<table class="qnaDetail-table">
					<tr>
						<td><li>문의유형</li></td>
						<td>
						<c:if test="${ q.qtype eq 'ROOM'}">
						객실
						</c:if>
						<c:if test="${ q.qtype eq 'SERVICE'}">
						서비스
						</c:if>
						<c:if test="${ q.qtype eq 'RESERV'}">
						예약
						</c:if>
						<c:if test="${ q.qtype eq 'ETC'}">
						기타
						</c:if>
						</td>
					</tr>
					<tr>
						<td><li>제목</li></td>
						<td>${ q.qtitle }</td>
					</tr>
					<tr>
						<td><li>작성자명</li></td>
						<td>${ q.userName }</td>
						<td><li>문의날짜</li></td>
						<td>${ q.qdate }</td>
					</tr>
					<tr>
						<td style="vertical-align: top; padding-top: 5px;"><li>문의 내용</li></td>
						<td style="padding-top: 5px;" colspan="4">
						<textarea rows="6" cols="70" readonly>${ q.qcontent }</textarea></td>
					</tr>
				</table>
				<!-- 내용 영역 끝 -->
				<br>
				<c:if test="${ q.ansStatus eq 'Y'}">
				<div style="border: 0.5px solid black; width: 100%; height: 0;"></div>
				<br>
				<!-- 답변 영역 -->
				<table class="answer-table">
					<tr>
						<td style="vertical-align: top; padding-top: 5px;"><li>답변 내용</li></td>
						<td style="padding-top: 5px;">
						<textarea rows="5" cols="70" readonly>${ a.acontent }</textarea></td>
					</tr>
				</table>
				<!-- 답변 영역 끝 -->
				</c:if>
				<br>
				<button style="float: right; width: 100px; margin-right: 2%;" onclick="location.href='goQnA.hmain'">뒤로</button>
			</div>
			<!-- 오른쪽 내용 영역 끝 -->
		</div>
		<!-- 내용 영역 끝 -->
	</section>
	<footer>
	</footer>
</body>
</html>