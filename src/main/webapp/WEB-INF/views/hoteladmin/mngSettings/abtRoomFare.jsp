<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:600px;
		float:right;
	}
	.roomTitleArea{
		width:1265px; 
		padding-bottom:10px;
		border-bottom-color: lightgray;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	.roomTitleArea h2{
		margin-bottom:0;
	}
	.roomBtn:hover{
		cursor:pointer;
	}
	.roomFareBtn{
		background:#3498DB;
		color:white;
	}
	.roomTypeSelect{
		width:1250px;
		display: flex;
		margin-top:30px;
		background:#E9F3FF;
		padding-top:13px;
		padding-left:10px;
	}
	.roomTypeSelect h4{
		margin-top:4px;
	}
	.roomTypeSelect select{
		height:30px;
		margin-left:10px;
	}
	.tableArea{
		margin-top:30px;
		width:1265px;
		height:480px;
		border:1px solid black;
		overflow-x:hidden;
		overflow-y:scroll; 
	}
	.fareTable{
		width:1250px;
		text-align:center;
		border-collapse: collapse;
		border:1px solid lightgray;
	}
	th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.money{
		width:100px;
		text-align: center;
		border:0;
	}
	.saveBtn{
		width:100px;
		height:30px;
		border-radius:5px;
		border:0;
		background:#3498DB;
		color:white;
	}
	.saveBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<header>
	<jsp:include page="../common/settingMenubar.jsp"/>
	<jsp:include page="../common/menubar.jsp"/>
</header>
<section>
	<div class="mainArea">
		<div class="rightAreaRoom">
			<div class="roomTitleArea">
				<h2>객실 요금 설정</h2>
			</div>
			<div class="tableArea">
				<table class="fareTable" border="1">
					<tr>
						<th width="10%">객실타입</th>
						<th width="10%">구분</th>
						<th width="10%">타입</th>
						<th width="10%">월</th>
						<th width="10%">화</th>
						<th width="10%">수</th>
						<th width="10%">목</th>
						<th width="10%">금</th>
						<th width="10%">토</th>
						<th width="10%">일</th>
					</tr>
					<tr>
						<td rowspan="4">디럭스</td>
						<td rowspan="2">비성수기</td>
						<td>대실료</td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
					</tr>
					<tr>
						<td>숙박료</td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
					</tr>
					<tr>
					 	<td rowspan="2">성수기</td>
					 	<td>대실료</td>
					 	<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
					 	<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
					 	<td><input type="text" class="money"></td>
					</tr>
					<tr>
					 	<td>숙박료</td>
						<td><input type="text" class="money"></td>
					 	<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
				    	<td><input type="text" class="money"></td>
					 	<td><input type="text" class="money"></td>
						<td><input type="text" class="money"></td>
					</tr>
				</table>
			</div>
			<div align="right" style="margin-top:10px; margin-right:30px;">
				<button class="saveBtn">저장</button>
			</div>
		</div>
	</div>	
</section>
</body>
</html>