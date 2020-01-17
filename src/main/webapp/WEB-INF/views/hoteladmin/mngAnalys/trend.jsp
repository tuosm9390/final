<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.site-outer{
	width: 82%;
	float: right;
	margin-right: 1%;
}

.searchArea{
	background: #F3F3F3;
	width: 100%;
	height: 50px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp"/>
		<jsp:include page="../common/analysMenubar.jsp"/>
	</header>
	<section>
		<div class="site-outer">
			<div class="excelArea" align="right">
				<button>엑셀</button>
			</div>
			<br>
			<!-- 검색 영역 -->
			<div class="searchArea" align="right">
				<select class="searchCondition">
					<option value="sales">매출일자</option>
					<option value="checkIn">입실일자</option>
					<option value="checkOut">퇴실일자</option>
				</select>
				
				<input type="text" id="datepicker"> - 
				<input type="text" id="datepicker">
			</div>
			<!-- 검색 영역 끝 -->
			<br>
			<!-- 테이블 영역 -->
			<table class="list-table" style="width: 100%;">
				<tr>
					<th>객실번호</th>
					<th>예약번호</th>
					<th>고객명</th>
					<th>입실일자</th>
					<th>퇴실일자</th>
					<th>매출 금액</th>
					<th>매출 일자</th>
					<th>비고</th>
				</tr>
			</table>
			<!-- 테이블 영역 끝 -->
		</div>
	</section>
	<footer>
	</footer>
</body>
</html>