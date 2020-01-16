<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.approval {
	width: 1000px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
}



.tbl_wrap .tbl {
	width: 100%;
	border-top: 1px solid #171f57;
	border-bottom: 1px solid #555;
	text-align: center;
	margin-bottom: 200px;
}

.tbl_wrap .tbl tr:not (:last-child ) {
	border-bottom: 1px solid #aaa;
}

.tbl_wrap .tbl th {
	padding: 10px 0;
	background-color: #E5E5E5;
}

.tbl_wrap .tbl tr td {
	padding: 20px 0;
	font-size: 16px;
	text-align: center;
	border-bottom: 1px solid #D4D4D4;
}

.tbl_wrap .tbl .squ_tbl {
	padding: 4px 8px;
	background-color: #ddd;
	font-size: 13px;
}

.ui .button {
	background-color:#F7F7F7;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<div class="approval">
		<h1>결제함</h1>

			<div class="catergory">
				<button class="ui button">전체</button>
				<button class="ui button">기안중</button>
				<button class="ui button">진행중</button>
				<button class="ui button">반려</button>
				<button class="ui button">승인</button>
			</div>
		<hr>
		<div class="tbl_wrap">
			<table class="tbl">
				<colgroup>
					<col width="3%">
					<col width="10%">
					<col width="27%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>

				<tr class="tbl_tit">
					<th></th>
					<th>기안일자</th>
					<th>제목</th>
					<th>구분</th>
					<th>기안자</th>
					<th>결재자</th>
					<th>진행상태</th>
					<th>결재</th>
				</tr>
				<tr>
					<td>10</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>9</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>8</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>7</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>6</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>5</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>4</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>3</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
			</table>
		</div>


	</div>

</body>
</html>