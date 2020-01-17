<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.contentArea{
		width:1600px;
		height:900px;
	}
	.Area4{
		font-weight: bold;
	}
	.rightArea{
		float:right;
		width:1300px;
	}
	.titleArea{
		width:1300px;
		height:50px;
		border-bottom-style:solid;
		border-bottom-width:1px;
		border-bottom-color:black;
		margin-right:0;
	}
	.title{
		display:inline-block;
		text-align: center;
		height:30px;
		margin-left:10px;
	}
	.titleContent{
		display:inline-block;
		text-align: center;
		height:30px;
	}
	.titleText{
		margin:0;
	}
	.titleContentText{
		margin-bottom:0px;
	}
	.tableArea{
		width:1200px;
		height:500px;
		border:1px solid black;
		overflow-x:hidden;
		overflow-y:scroll; 
	}
	.fareTable{
		width:1200px;
		text-align:center;
		border-collapse: collapse;
	}
	th{
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
		height:30px;
	}
	.money{
		width:100px;
		text-align: center;
		border:0;
	}
	.nextBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border:0;
		color:#EAC064;
	}
	.nextBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
	.backBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border:0;
		color:#EAC064;
	}
	.backBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">객실 요금 설정</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">객실별 기본 요금을 설정해주세요.</h6>
				</div>
			</div>
			
			<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:10px; ">기본 요금 설정</h3>
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
			<br>
			<div align="center">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick=""><b>다음</b></button>			
			</div>
		</div>
	</div>
</body>
</html>