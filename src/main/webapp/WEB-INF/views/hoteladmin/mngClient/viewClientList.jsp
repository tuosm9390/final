<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.searchSec {
	float: right;
	display: inline;
	margin-right: 301px;
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

.clientList {

	margin-top: 10px;
	width: 1000px;
	height: 520px;
	border: 1px solid darkgray;
	max-height: 520px;
	overflow-y: auto;
}

.clientList th, .clientList td {
	border: 1px solid darkgray;
	text-align: center;
	padding: 5px;
}

.clientList th {
	background-color: lightsteelblue;
}

#openClientMD {
	margin-top: 10px;
	width: 100px;
	margin-left: 20px;
	border: 1px solid royalblue;
	border-radius: 5px;
	background-color: royalblue;
	color: white;
	font-weight: bold;
} 
</style>
</head>
<body style="overflow-y: hidden;">
	<header>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
		<jsp:include page="modalInsertClient.jsp"></jsp:include>
	</header>
	<section>

		<h1 style="margin-left: 10px; margin-bottom:0px;">고객관리</h1>
		<hr style="width:100px; margin-right:1195px;"> 
		
			<button id="openClientMD">신규</button>
		<!-- searchSec -->
		<div class="searchSec">
			<label style="margin-right: 20px;">총 고객 수 : 300</label>
			<select name="searchOption">
				<option selected disabled hidden>검색조건</option>
				<option value="">고객명</option>
				<option value="">전화번호</option>
				<option value="">이메일</option>
			</select>
			<input type="text" name="searchContent" class="searchContent">
			<button id="searchBtn">검색</button>
		</div>
		<!-- searchSec end -->
			
		<div class="clientList">
			<table style="border-collapse: collapse;">
				<tr>
					<th width="50px;"><input type="checkbox"></th>
					<th width="100px;">No</th>
					<th width="150px;">고객명</th>
					<th width="150px;">고객번호</th>
					<th width="200px;">전화번호</th>
					<th width="350px;">이메일</th>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>김진호</td>
					<td>20124567</td>
					<td>010-0000-0000</td>
					<td>programmer7771@gmail.com</td>
				</tr> 
			</table>
		</div>
	</section>
	<script>
		$(function(){
			$("#openClientMD").click(function(){
				$(".modalplus").fadeIn();
			});
			
			$("td").parent().click(function(){
				$(".modalplus").fadeIn();
			});
		});
	</script>
</body>
</html>