<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* 모달 */
.qna-modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 20;
}

.qna-modal_content {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
/* 	max-height: 700px; */
	border: 20px solid white;
	background-color: #FFFAFA;
	overflow-y: auto;
}

.qna-modal_content_real {
	width:780px;
	height:270px;
	/* border:1px solid black; */
	margin:0 auto;
	overflow:auto;
}

.btn_close {
position: absolute;
top:0%;
left:96.5%;
font-size:40px;
float: right;
color:darkgray;
}

.btn_close:hover {
cursor: pointer;
}

.check-password{
	position: absolute;
	width: 50%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%)
}

.modal-btn button{
	width: 100px;
	margin-left: 20px;
}

.qtype{
	display: none;
	margin-left: 10px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" flush="true"/>
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
					<form id="searchQnAForm" action="searchQnA.hmain" method="post">
					<div style="width: 50%; display: inline-flex;">
					<select class="searchCondition" name="searchCondition">
						<option value="qtitle">제목</option>
						<option value="qtype">유형</option>
					</select>
					<input type="text" class="searchValue" name="searchValue">
					
					<select name="searchValue" class="qtype" disabled>
						<option value="ROOM">객실</option>
						<option value="SERVICE">환불</option>
						<option value="RESERVE">예약</option>
						<option value="ETC">기타</option>
					</select>
					
					<button type="submit" class="search-btn">검색</button>
					</div>
					<button type="button" class="insert-btn" onclick="location.href='qnaInsertForm.hmain'">등록</button>
					</form>
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
							<img src="${contextPath}/resources/images/password.png" style="width: 15px;">
							</c:if>
							</label>
						</div>
					</c:forEach>
				</div>
				<br>
				<!-- 페이징 영역 -->
				<div class="pagingArea" align="center">
				
					<c:if test="${ !empty qnaList }">
						<c:if test="${ pi.currentPage eq 1 }">
							<button onclick="javascript: void(0);"><<</button>
							<button disabled><</button>
						</c:if>
											
						<c:if test="${ pi.currentPage ne 1 }">
							<c:url var="firstpath" value="${ path }">
								<c:if test="${ path.equals('goQnA.hmain') }">
									<c:param name="currentPage" value="1"/>
								</c:if>
								<c:if test="${ path.equals('searchQnA.hmain') }">
									<c:param name="currentPage" value="1"/>
									<c:param name="searchCondition" value="${ searchCondition }"/>
									<c:param name="searchValue" value="${ searchValue }"/>
								</c:if>
							</c:url>
							<button onclick="location.href='${ firstpath }'"><<</button>
						</c:if>
						<c:if test="${ pi.currentPage ne 1 }">
							<c:url var="prevPath" value="${ path }">
								<c:if test="${ path.equals('goQnA.hmain') }">
									<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
								</c:if>
								<c:if test="${ path.equals('searchQnA.hmain') }">
									<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
									<c:param name="searchCondition" value="${ searchCondition }"/>
									<c:param name="searchValue" value="${ searchValue }"/>
								</c:if>
							</c:url>
							<button onclick="location.href='${ prevPath }'"><</button>
						</c:if>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<button disabled>${ p }</button>
							</c:if>
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="movePath" value="${ path }">
									<c:if test="${ path.equals('goQnA.hmain') }">
										<c:param name="currentPage" value="${ p }"/>
									</c:if>
									<c:if test="${ path.equals('searchQnA.hmain') }">
										<c:param name="currentPage" value="${ p }"/>
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
								</c:url>
								<button onclick="location.href='${ movePath }'">${ p }</button>
							</c:if>
						</c:forEach>
						
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="nextPath" value="${ path }">
								<c:if test="${ path.equals('goQnA.hmain') }">
									<c:param name="currentPage" value="${ pi.currentPage + 1}"/>
								</c:if>
								<c:if test="${ path.equals('searchQnA.hmain') }">
									<c:param name="currentPage" value="${ pi.currentPage + 1}"/>
									<c:param name="searchCondition" value="${ searchCondition }"/>
									<c:param name="searchValue" value="${ searchValue }"/>
								</c:if>
							</c:url>
						<button onclick="location.href='${ nextPath }'">></button>
						</c:if>
						<c:if test="${ pi.currentPage ne pi.maxPage }">
							<c:url var="lastPath" value="${ path }">
								<c:if test="${ path.equals('goQnA.hmain') }">
									<c:param name="currentPage" value="${ pi.maxPage }"/>
								</c:if>
								<c:if test="${ path.equals('searchQnA.hmain') }">
									<c:param name="currentPage" value="${ pi.maxPage }"/>
									<c:param name="searchCondition" value="${ searchCondition }"/>
									<c:param name="searchValue" value="${ searchValue }"/>
								</c:if>
							</c:url>
							<button onclick="location.href='${ lastPath }'">>></button>
						</c:if>
						
						<c:if test="${ pi.currentPage eq pi.maxPage }">
							<c:url var="lastPath" value="${ path }">
								<c:if test="${ path.equals('goQnA.hmain') }">
								</c:if>
								<c:if test="${ path.equals('searchQnA.hmain') }">
									<c:param name="searchCondition" value="${ searchCondition }"/>
									<c:param name="searchValue" value="${ searchValue }"/>
								</c:if>
							</c:url>
							<button disabled>></button>
							<button disabled>>></button>
						</c:if>
					</c:if>
				</div>
				<!-- 페이징 영역 끝 -->
			</div>
			<!-- 오른쪽 리스트 영역 끝 -->
		</div>
		<!-- 내용 영역 끝 -->
		
		<!-- 모~달 -->
		<div class="qna-modal">
		<div class="qna-modal_content">
			<h2 align="center" style="font-weight: bold; text-decoration: underline; text-underline-position: under;">비밀번호 확인</h2>
			<a class="btn_close">×</a>
			
			<div class="qna-modal_content_real" align="center">
				<form id="pwdCheckForm" method="post">
					<div class="check-password">
						<h2 style="font-weight: bold;">비밀번호를 입력해주세요</h2>
						<input type="text" name="pwd" id="pwd">
					</div>
				</form>
			</div>
			<div class="modal-btn" align="right">
				<button onclick="cancel();">취소</button>
				<button onclick="goQnADetail();">확인</button>
			</div>
		</div>
	</div>
	</section>
	<footer></footer>
	
	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".qna-modal").fadeOut();
			});
			pwdCheckForm = $("#pwdCheckForm");
			searchCondition = $(".searchCondition").val();
			searchValue = null;
		});
		
		$(document).on("change", ".searchCondition", function() {
			if($(this).val() == 'qtype'){
				$(".searchValue").attr("disabled", true).css("display", "none");
				$(".qtype").attr("disabled", false).css("display", "block");
				searchValue = $(".qtype").val();
			} else {
				$(".searchValue").attr("disabled", false).css("display", "block");
				$(".qtype").attr("disabled", true).css("display", "none");
				searchValue = $(".searchValue").val();
			};
		});
		
		function cancel(){
			$(".qna-modal").fadeOut();
		};
		
		$(".qnalist-item").mouseenter(function(){
			$(this).css({"background":"rgba(211, 211, 211, .4)", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).css({"background":"none"});
		}).click(function(){
			qno = $(this).children("#qno").val();
			
			if($(this).children("#status").val() == "Y"){
				$(".qna-modal").fadeIn();
			} else {
				location.href='qnadetail.hmain?qno=' + qno + "&type=unlock";
			}
		});
		
// 		$(".search-btn").click(function(){
// 			$("#searchQnAForm").attr("action", "searchQnA.hmain");
// 			$("#searchQnAForm").submit();
// 		});
		
		function goQnADetail(){
			console.log(qno);
			pwdCheckForm.attr("action", "qnadetail.hmain?qno=" + qno + "&type=lock");
			pwdCheckForm.submit();
		};
	</script>
</body>
</html>