<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.left-section {
	padding: 10px;
	position: fixed;
	width: 38%;
	border-right: 1px solid black;
}

.right-section {
	position: absolute;
	left: 40%;
	padding: 10px;
	padding-left: 15px;
	width: 56%;
}

.searchArea {
	width: 100%;
}

.searchArea input, .searchArea button {
	margin-left: 10px;
}

.insert-btn {
	float: right;
	width: 60px;
}

.qnalist-item {
	border: none;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px;
}

.qnalist-item:not(:last-child){
	border-bottom: none;
}

.qnalist-item .title {
	font-weight: bold;
	font-size: 24px;
}

.qnalist-item label:not(:first-child) {
	color: #828282;
}

.pagingArea{
	height: 50px;
}

.paging-item{
	display: inline-flex;
}
</style>
</head>
<body>
	<c:set var="listCount" value="5"></c:set>
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
			
			<!-- 오른쪽 리스트 영역 -->
			<div class="right-section">
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px; text-decoration: underline;">1:1 문의</p>
				<br><br>
				<!-- 검색 영역 -->
				<div class="searchArea">
					<select class="searchCondition" name="searchValue">
						<option value="title">제목</option>
						<option value="author">작성자</option>
					</select>
					<input type="text" class="searchValue" name="searchValue">
					<button class="search-btn" onclick="">검색</button>
					<button class="insert-btn" onclick="location.href='qnaInsert.hmain'">등록</button>
				</div>
				<!-- 검색 영역 끝 -->
				
				<!-- 문의 리스트 영역 -->
				<div class="qnalist">
					<br>
					<c:forEach var="i" begin="1" end="${ listCount }">
						<div class="qnalist-item">
							<label class="title">타이틀</label><br>
							<input type="hidden" value="" name="">
							<label>작성자명</label>
							<label>날짜</label>
							<label>분류</label>
							<label>상태</label>
							<label>비밀글여부</label>
						</div>
					</c:forEach>
				</div>
				<br>
				<!-- 페이징 영역 -->
				<div align="center" class="pagingArea">
					<div class="paging-item">
						<p>페이징 영역</p>
					</div>
				</div>
				<!-- 페이징 영역 끝 -->
			</div>
			<!-- 오른쪽 리스트 영역 끝 -->
		</div>
		<!-- 내용 영역 끝 -->
	</section>
	<footer></footer>
	
	<script>
		$(".qnalist-item").mouseenter(function(){
			$(this).css({"background":"rgba(211, 211, 211, .4)", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).css({"background":"none"});
		}).click(function(){
			location.href='qnadetail.hmain';
		});
	</script>
</body>
</html>