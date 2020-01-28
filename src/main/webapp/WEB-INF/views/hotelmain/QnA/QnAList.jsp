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
	width: 100px;
}

.search-btn{
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
	color: black;
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
	<header>
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../common/qnaModalForm.jsp"></jsp:include>
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
					<button class="insert-btn" onclick="location.href='qnaInsertForm.hmain'">등록</button>
				</div>
				<!-- 검색 영역 끝 -->
				
				<!-- 문의 리스트 영역 -->
				<div class="qnalist">
					<br>
					<c:set var="status" value="Y"></c:set>
					<c:forEach var="list" items="${ qnaList }" varStatus="st">
						<div class="qnalist-item">
							<label class="title">${ list.qtitle }</label><br>
							<input type="hidden" id="qno" value="${ list.qno }">
							<input type="hidden" id="status" value="${ list.pwdStatus }" name="${ list.pwdStatus }">
							<label>${ list.userName }</label>
							<label>${ list.qdate }</label>
							<label>
							<c:if test="${ list.qtype eq 'ROOM'}">
							객실
							</c:if>
							<c:if test="${ list.qtype eq 'SERVICE'}">
							서비스
							</c:if>
							<c:if test="${ list.qtype eq 'RESERV'}">
							예약
							</c:if>
							<c:if test="${ list.qtype eq 'ETC'}">
							기타
							</c:if>
							</label>
							<label>
							<c:if test="${ list.ansStatus eq 'Y'}">
							완료
							</c:if>
							<c:if test="${ list.ansStatus eq 'N'}">
							대기
							</c:if>
							</label>
							<label>
							<c:if test="${ list.pwdStatus eq 'Y'}">
							비밀글
							</c:if>
							<c:if test="${ list.pwdStatus eq 'N'}">
							안비밀글
							</c:if>
							</label>
						</div>
					</c:forEach>
				</div>
				<br>
				<!-- 페이징 영역 -->
				<div class="pagingArea" align="center">
					<button onclick="location.href='goQnA.hmain?currentPage=1'"><<</button>
					
					<c:if test="${ pi.currentPage <= 1 }">
					<button disabled><</button>
					</c:if>
					
					<c:if test="${ pi.currentPage > 1 }">
					<button onclick="location.href='goQnA.hmain?currentPage=${ pi.currentPage - 1 }'"><</button>
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p == pi.currentPage }">
							<button disabled>${ p }</button>
						</c:if>
						
						<c:if test="${ p != pi.currentPage }">
							<button onclick="location.href='goQnA.hmain?currentPage=${ p }'">${ p }</button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<button disabled>></button>
					</c:if>
					
					<c:if test="${ pi.currentPage < pi.maxPage }">
					<button onclick="location.href='goQnA.hmain?currentPage=${ pi.currentPage + 1}'">></button>
					</c:if>
					<button onclick="location.href='goQnA.hmain?currentPage=${ pi.maxPage }'">>></button>
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
			var qno = $(this).children("#qno").val();
			
			if($(this).children("#status").val() == "Y"){
				$(".qna-modal").fadeIn();
			} else {
				location.href='qnadetail.hmain?qno=' + qno;
			}
		});
	</script>
</body>
</html>