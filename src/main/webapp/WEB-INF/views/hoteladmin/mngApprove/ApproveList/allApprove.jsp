<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.approval {
	width: 1000px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	margin-top:-20px;
}

.approval .category {
	width: auto;
	height: 30px;
	display: inline-block;
	margin: 1px;
}

.approval .category button {
	border: 2px solid #F7F7F7;
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
	font-color: #5C95BF;
	background-color: #E5E5E5;
}

.tbl_wrap .tbl tr td {
	padding: 10px 0;
	height: 5px;
	font-size: 16px;
	text-align: center;
	border-bottom: 1px solid #D4D4D4;
}

.tbl_wrap .tbl .squ_tbl {
	padding: 4px 8px;
	background-color: #ddd;
	font-size: 13px;
}

.writeDocu {
	float: right;
	margin-bottom: 10px;
	height: 30px;
}

.write {
	height: 30px;
	border: 2px solid #F7F7F7;
	border-radius: 5px;
}
</style>

</head>
<body>
<header>
<jsp:include page="../../common/menubar.jsp" />
	</header>
	<%-- <c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" /> --%>
		<section>
		<jsp:include page="../approveModal/purchaseApproveModal.jsp"></jsp:include>
	
	<div class="approval">
		<h2>결재함</h2>

		<div class="category">

			<button class="category btl">전체</button>
			<button class="category btl">기안중</button>
			<button class="category btl">진행중</button>
			<button class="category btl">반려</button>
			<button class="category btl">승인</button>
		</div>
		<div class="writeDocu">
			<button class="write" onclick="location.href='writePurchaseApprove.ap'">기안서
				작성</button>
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

				<tr>
					<th></th>
					<th>기안일자</th>
					<th>제목</th>
					<th>구분</th>
					<th>기안자</th>
					<th>결재자</th>
					<th>진행상태</th>
					<th>결재</th>
				</tr>
				<tr class="tbl_tit">
					<td>10</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td><a>보기</a></td>
				</tr>
				<tr class="tbl_tit">
					<td>9</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
					<td>8</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
					<td>7</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
					<td>6</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
					<td>5</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
					<td>4</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
					<td>3</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
					<td>2</td>
					<td>2020-01-10</td>
					<td>물품 구매 요청서</td>
					<td>품의서</td>
					<td>전세환</td>
					<td>사용자1</td>
					<td>진행중</td>
					<td>보기</td>
				</tr>
				<tr class="tbl_tit">
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
	</section>
	 <script>
		
	 	$(".tbl_tit").mouseenter(function(){
	 		$(this).css({"background":"lightgray", "cursor":"pointer"})
	 	}).mouseout(function(){
	 		$(this).css({"background":"white"})
	 	}).click(function(){
	 		$(".modal").fadeIn();
	 	});
		
	
		
		
		
	</script> 

</body>
</html>