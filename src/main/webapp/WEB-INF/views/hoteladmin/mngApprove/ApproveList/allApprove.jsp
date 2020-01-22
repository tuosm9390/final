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
	width: 1200px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	margin-top:-40px;
}
.title {
	margin-top:20px;
	width:80px;
	height:35px;
	border-bottom:1px solid lightgray;
}

.approval .category {
	width: auto;
	height: 30px;
	display: inline-block;
	margin: 1px;
}

.approval .category .btl {
	border: 1px solid white;
	background:white;
	color:#3498DB;
	width:70px;
	
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.tbl_wrap {
	margin-top:20px;
}
.tbl_wrap .tbl {
	
	 border-collapse: collapse;
	 width:100%;
	 text-align: center;
	 height:400px;
}

.tbl_wrap .tbl tr:not (:last-child ) {
	border-bottom: 1px solid #aaa;
}



.tbl_wrap .tbl td, th {
	border: 1px solid lightgray;
      text-align: center;
}
.tbl_wrap .tbl th{
   background-color: #f7f7f7;
   color: #005B9E;
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
	border: 2px solid royalblue;
	background:royalblue;
	color:white;
	font-weight:bold;
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
	<div class="title">
		<h2>결재함</h2>
	</div><br><br>
		<div class="category">

			<button class="category btl total">전체</button>
			<button class="category btl">기안중</button>
			<button class="category btl">진행중</button>
			<button class="category btl">반려</button>
			<button class="category btl">승인</button>
		</div>
		<div class="writeDocu">
			<button class="write" onclick="location.href='writePurchaseApprove.ap'">기안서
				작성</button>
		</div>


		
		
		
		
		<div class="tbl_wrap">
			<table class="tbl">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="27%">
					<col width="13%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>

				<tr>
					<th>No</th>
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
	 $(document).ready(function(){
		 console.log("??");
		 $(".category.btl.total").css({"background-color":"#3498DB", "box-shadow":"0px 0px 0px", "color":"white"});
	 })
		
	 	$(".tbl_tit").mouseenter(function(){
	 		$(this).css({"background":"lightgray", "cursor":"pointer"})
	 	}).mouseout(function(){
	 		$(this).css({"background":"white"})
	 	}).click(function(){
	 		$(".modal").fadeIn();
	 	});
	 	$(".category.btl").click(function(){
	 		$except = $(this);
	 		console.log("??");
	 		 $(this).css({"box-shadow":"0px 0px 0px", "border":"1px solid lightgray", "background":"#3498DB", "color":"white"});
	 		 $(".category.btl").not($except).css({"color":"#3498DB", "background":"white","border":"1px solid white", "box-shadow":"0px 4px 4px rgba(0, 0, 0, 0.25)"});
	 		 
	 		 
	 		
	 		
	 	})
		
	
		
		
		
	</script> 

</body>
</html>