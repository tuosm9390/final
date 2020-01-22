<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.blackListArea{
		width: 1000px;
		height: 461px;
		border: 1px solid darkgray;
		margin-left: 10px;
	}
	.blackListArea table{
		width: 1000px;
		text-align:center;
		border:1px solid lightgray;
	}
	.blackListArea th{
		background-color: #f7f7f7;
    	color: #005B9E;
	}
	
	.blackListArea th, .blackListArea td {
		border: 1px solid darkgray;
		text-align: center;
		padding: 10px;
	}
	.searchSec {
		float: right;
		display: inline;
		margin-top: 10px;
		margin-right: 300px;
	}  
	
	.searchSec select {
		height: 25px;
		width: 80px;
		border: 1px solid lightgrey;
		border-radius: 2px;
	}
	
	.searchContent {
		height: 19px;
		width: 200px;
		border: 1px solid lightgrey;
		border-radius: 2px;
	}
	
	#searchBtn {
		height: 25px;
		width: 50px;
		border: 1px solid #3498DB;
		background-color: #3498DB;
		color: white;
		font-weight: bold;
		border-radius: 2px;
	}
	.newBlackList, .deleteBlackList{
		width:100px;
		height:25px;
		border-radius:2px;
		background:#E9F3FF;
		cursor:pointer;
		font-weight: bold;
	}
	
	.newBlackList {
		border:1px solid #3498DB;
		background-color: #3498DB;
		color: white;
	}
	
	.deleteBlackList {
		border:1px solid lightgrey;
		background-color: lightgrey;
	}
	
	.btnGroup {
		margin-top: 20px;
		margin-bottom: 10px;
		margin-left: 10px;
	}
	
	.pagingSec {
	text-align: center;
	width: 400px;
	height: 30px;
	border: 1px solid black;
	margin-left: 350px;
	margin-top: 20px;
}
	
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
		<jsp:include page="blackListAddModal.jsp"></jsp:include>
		<jsp:include page="modalBlackListDetail.jsp"></jsp:include>
	</header>
	<section>
		<h1 style="margin-left:10px; margin-bottom:0px;">블랙리스트</h1>
		<hr style="width:125px; margin-right:1170px;"> 
		
		<!-- searchSec -->
		<div class="searchSec">
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
		<div class="btnGroup">
				<button class="newBlackList" onclick="openBlackListModal();">등록</button>
				<button class="deleteBlackList">삭제</button>
			</div>
			
		<div class="blackListArea">
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
		<div class="pagingSec">
			<label>페이징 영역</label>		
		</div>
	</section>
	<script>
	$(function(){
		
		$("td").parent().click(function(){
			$(".blackListDetailModal").fadeIn();
		});
		
	});
	function openBlackListModal(){
		$(".modalBlackListAdd").fadeIn();
	}
	
	$(function(){
		$("td").parent().click(function(){
			$(".modalplus").fadeIn();
		});
	})
	</script>
</body>
</html>