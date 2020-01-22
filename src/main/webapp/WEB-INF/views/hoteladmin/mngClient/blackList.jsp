<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.blackListArea{
		width:1200px;
		height:500px;
		border:1px solid lightgray;
	}
	.blackListArea table{
		width:1200px;
		text-align:center;
		border:1px solid lightgray;
	}
	.blackListArea th{
		height:30px;
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
	}
	.blackListArea tr{
		height:30px;
	}
	.searchSec{
		display: flex;
		margin-bottom: 10px;
	}
	.btnGroup{
		margin-left:705px; 
	}
	.newBlackList, .deleteBlackList{
		width:100px;
		height:30px;
		border:0;
		background:#E9F3FF;
		cursor:pointer;
	}
	
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
		<jsp:include page="blackListAddModal.jsp"></jsp:include>
	</header>
	<section>
		<h1>블랙리스트</h1>
		
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
			<div class="btnGroup">
				<button class="newBlackList" onclick="openBlackListModal();">등록</button>
				<button class="deleteBlackList">삭제</button>
			</div>
		</div>
		<!-- searchSec end -->
			
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
	</script>
</body>
</html>