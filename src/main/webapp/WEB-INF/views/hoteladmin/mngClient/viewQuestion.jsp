<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.topSec {
	display: inline-flex;
}

.topSec select {
	height: 25px;
	width: 100px;
	margin-top: 25px;
	margin-left: 20px;
	border: 1px solid lightgrey;
}

.searchSec {
	float: right;
	display: inline;
	margin-right: 30px;
}

.searchSec select {
	height: 25px;
	width: 80px;
	border: 1px solid lightgrey;
}

.searchContent {
	height: 19px;
	width: 200px;
	border: 1px solid lightgrey;
}

#searchBtn {
	height: 25px;
	width: 60px;
	border: 1px solid lightgrey;
}

#openNewMD {
	margin-top: 10px;
	width: 100px;
	margin-left: 20px;
	border: 1px solid royalblue;
	border-radius: 5px;
	background-color: royalblue;
	color: white;
	font-weight: bold;
} 

.qList {
	margin-left: 20px;
	margin-top: 10px;
	width: 1250px;
	height: 520px;
	border: 1px solid darkgray;
	max-height: 520px;
	overflow-y: auto;
}

.qList th, .qList td {
	border: 1px solid darkgray;
	text-align: center;
	padding: 5px;
}

.qList th {
	background-color: #f7f7f7;
	color: #005B9E;
	border: 1px solid lightgray;
	height:30px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="viewQuestionNewModal.jsp"></jsp:include>
		<jsp:include page="viewQuestionNewModal2.jsp"></jsp:include>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
	</header>
	<section>
		<div class="topSec">
			<h1 style="margin-left: 10px; margin-bottom:0px;">고객문의</h1>
			<select name="filterOption">
				<option>전체 문의</option>
				<option>온라인 문의</option>
				<option>오프라인 문의</option>
				<option>미답변 문의</option>
			</select>
		</div>
		<hr style="width:100px; margin-right:1195px;"> 
		
		<button id="openNewMD">신규</button>
		<!-- searchSec -->
		<div class="searchSec">
			<select name="searchOption">
				<option selected disabled hidden>검색조건</option>
				<option value="">고객명</option>
				<option value="">전화번호</option>
				<option value="">이메일</option>
				<option value="">문의제목</option>
				<option value="">문의유형</option>
				<option value="">문의내용</option>
			</select>
			<input type="text" name="searchContent" class="searchContent">
			<button id="searchBtn">검색</button>
		</div>
		<!-- searchSec end -->
		
		<div class="qList">
			<table style="border-collapse: collapse;">
				<tr>
					<th width="50px">No</th>
					<th width="550px">문의제목</th>
					<th width="100px">문의유형</th>
					<th width="100px">문의고객명</th>
					<th width="200px">연락처</th>
					<th width="150px">문의일자</th>
					<th width="100px">답상태</th>
				</tr>
				<tr>
					<td>1</td>
					<td>강아지 동반 질문있어요!</td>
					<td>객실</td>
					<td>전세환</td>
					<td>010-0000-0000</td>
					<td>2020-01-20</td>
					<td>미답변</td>
				</tr>
				<tr>
					<td>2</td>
					<td>고양이 동반 질문있어요!</td>
					<td>객실</td>
					<td>송기준</td>
					<td>abc@de.fg</td>
					<td>2020-01-18</td>
					<td>답변</td>
				</tr>
			</table>
		</div>
			
	</section>
	<script>
		$(function(){
			$("#openNewMD").click(function(){
				$(".queNewModal").fadeIn();
			});
			
			$("td").parent().click(function(){
				$(".queModal").fadeIn();
			});
		});
	</script>
</body>
</html>