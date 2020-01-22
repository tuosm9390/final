<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.userInfo {
	width: 1200px;
	height: auto;
	margin-left: 0px;
	margin-top: -20px;
}

.addSearch {
	width: 1100px;
	height: 40px;
	color:black;
	    margin-top: 10px;
}

.searchArea {
	margin-left: -5px;
	padding: 7px;
	color:black;
	position:relative;
	top:10px;
}

#searchTxt {
	border-radius: 2px;
	border: 1px solid lightgray;
	height:25px;
}

.searchArea2 {
	
}

#subBtn {
	width: 70px;
	height: 27px;
	border: 1px solid white;
	background: white;
	border-radius: 2px;
}

#addUserBtn {
	width: 100px;
	height: 30px;
	float: right;
	border: 1px solid #3498DB;
	border-radius: 2px;
	background: #3498DB;
	color:white;
}
.tbl_wrap {
	margin-top:20px;
}
.tbl_wrap .tbl {
	
	 border-collapse: collapse;
	 width:1095px;
	 text-align: center;
	 height:120px;
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

#searchBtn {
	border-radius:2px;
	background:#3498DB;
	color:white;
	width:60px;
	height:30px;
	border:1px solid #3498DB;
}

.titArea {
margin-top:-60px;
	border-bottom:1px solid lightgray;
	width:1095px;
	height:40px;
}
select {
	height:28px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
		<jsp:include page="../../common/settingMenubar.jsp" />
		<jsp:include page="settingsModal/userInsertModal.jsp"/>
	</header>
		
	
	<!-- content start -->
	<section>
	<div class="userInfo">
	<div class="titArea">
		<h2>사용자 등록</h2>
	</div>
		<!-- search Area -->
		<div class="addSearch">
			<div class="searchArea">
			
				<select>
					<option selected disabled hidden>검색조건</option>
					<option>사용자명</option>
					<option>ID</option>
				</select>
				
				<input id="searchTxt" type="text" name="">
				<button id="searchBtn">검색</button>

				<button onclick="insertUser();" id="addUserBtn">+ 사용자 추가</button>

			</div>
		</div>
		<!-- searchArea end -->
		<div class="tbl_wrap">
			<table class="tbl">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<tr style="background: #F3F3F3;">
					<td>호텔명</td>
					<td>사용자명</td>
					<td>사용자ID</td>
					<td>권한</td>
					<td>전화</td>
					<td>이메일</td>
					<td>사용</td>
				</tr>
				<tr id="tbl_tit">
					<td>BOutique</td>
					<td>송기준</td>
					<td>A0001</td>
					<td>호텔 사용자</td>
					<td>010****6811</td>
					<td>stranze@naver.com</td>
					<td>사용</td>
				</tr>
				<tr id="tbl_tit">
					<td>asdasd</td>
					<td>송기준</td>
					<td>A0001</td>
					<td>호텔 사용자</td>
					<td>010****6811</td>
					<td>stranze@naver.com</td>
					<td>사용</td>
				</tr>
				<tr id="tbl_tit">
					<td>BOutique</td>
					<td>송기준</td>
					<td>A0001</td>
					<td>호텔 사용자</td>
					<td>010****6811</td>
					<td>stranze@naver.com</td>
					<td>사용</td>
				</tr>
			</table>
		</div>

	</div>
	</section>
	<!-- content end -->
	
	<script>
	$(function(){
		$("#tbl_tit").mouseenter(function(){
	 		$(this).css({"background":"lightgray", "cursor":"pointer"})
	 	}).mouseout(function(){
	 		$(this).css({"background":"white"})
	 	}).click(function(){
	 		
	 	});
		
		
	})
	function insertUser() {
			$(".modal").fadeIn();
		}
	
	</script>


</body>
</html>