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
	margin-left: auto;
	margin-top: auto;
}

.addSearch {
	width: 1100px;
	height: 40px;
	background: #060E33;
	display: inline-block;
}

.searchArea {
	line-height: 5px;
	margin-left: 20px;
	padding: 7px;
}

.searchArea a {
	color: white;
}

#searchTxt {
	border-radius: 2px;
	border: 1px solid white;
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
	height: 27px;
	float: right;
	border: 1px solid white;
	border-radius: 2px;
	background: white;
}

.tblArea {
	width: 1100px;
	height: auto;
	margin-top: 20px;
}

.contentTbl {
	width: 1100px;
	border: 1px solid lightgray;
	text-align: center;
}

.contentTbl td {
	border: 1px solid lightgray;
	border-top: 0px;
}

.contentTbl td:last-child {
	border-right: 0px;
}

.contentTbl td:first-child {
	border-left: 0px;
}

tr:last-child {
	border-bottom: 10px solid lightgray;
}

.contentTbl td:nth-child(7) {
	border-right: 0;
}

.contentTbl td {
	border-right: 0px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
		<jsp:include page="../../common/settingMenubar.jsp" />
	</header>
		<jsp:include page="settingsModal/userInsertModal.jsp"/>
	
	<!-- content start -->
	<div class="userInfo">
		<h2>사용자 등록</h2>

		<!-- search Area -->
		<div class="addSearch">
			<div class="searchArea">
				<a>사용자명 / ID</a>&nbsp; <input id="searchTxt" type="text" name="">
				&nbsp; <input type="checkbox" id="chkbox"> <a>미사용 포함</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<button id="subBtn">조회</button>
				<button onclick="insertUser();" id="addUserBtn">+ 사용자 추가</button>

			</div>
		</div>
		<!-- searchArea end -->
		<div class="tblArea">
			<table class="contentTbl">
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
	<!-- content end -->
	
	<script>
	$("#tbl_tit").mouseenter(function(){
 		$(this).css({"background":"lightgray", "cursor":"pointer"})
 	}).mouseout(function(){
 		$(this).css({"background":"white"})
 	}).click(function(){
 		
 	});
	function insertUser() {
		$(".modal").fadeIn();
	}
	</script>


</body>
</html>