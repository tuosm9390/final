<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	.menubar{
		height:930px; 
	}
	.contentArea{
		width:1600px;
		height:900px;
	}
	.Area7{
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
	input{
		border-radius:5px 5px 5px 5px;
		border:1px solid lightgray;
		width:200px;
		height:25px;
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
	.contentArea3{
		text-align:center;
	}
	.hotelInfoArea td{
		padding-right:100px;
	}
	.hotelInfoArea{
		margin-left:130px;
		font-weight: bold;
	}
	.hotelInfoArea table tr{
		height:40px;
	}
	.hotelInfoArea input{
		border-radius:10px;
		width:200px;
		height:30px;
	}
	.roomFareArea{
		width:1115px;
		height:300px;
		margin-top:20px;
		margin-left:40px;
		overflow-x:hidden;
		overflow-y:scroll;
		border:1px solid darkgray;
		/* margin-left:110px; */
	}
	.roomFareTable{
		width:1100px;
		text-align:center;
		border:1px solid darkgray;
		border-collapse: collapse;
	}
	th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.roomFareTable input{
		width:60px;
		border:0;
	}
	.serviceTable{
		border-collapse: collapse;
		width:1115px;
		border:1px solid darkgray;
		text-align:center;
		/* margin-left:70px; */
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
	.btnGroup{
		margin-right:150px;
	}
	.serviceInfoArea{
		margin-left:40px;
	}
</style>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">§ 설정 요약</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">호텔스 컴파일로 설정한 내용입니다.</h6>
				</div>
			</div>
			
			<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:40px;">호텔 정보</h3>
			</div>
			<div class="hotelInfoArea">
				<table>
					<tr>
						<td>
							<label>* 호텔명</label>
						</td>
						<td class="secondBox">
							<input type="text" name="hotelName" class="inputBox">
						</td>
						<td>
							<label>* 대표자</label>
						</td>
						<td>
							<input type="text" name="hotelOwner" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 이메일</label>
						</td>
						<td class="secondBox">
							<input type="email" name="hotelEmail" class="inputBox">
						</td>
						<td>
							<label>* 휴대폰</label>
						</td>
						<td>
							<input type="tel" name="ownerPhone" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 입실시간</label>
						</td>
						<td class="secondBox">
							<input type="text" name="companyName" class="inputBox">
						</td>
						<td>
							<label>* 퇴실시간</label>
						</td>
						<td>
							<input type="text" name="companyNumber" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 대실시간</label>
						</td>
						<td class="secondBox">
							<input type="tel" name="hotelPhone" class="inputBox">
						</td>
						<td>
							<label>&nbsp; 호텔전화</label>
						</td>
						<td class="secondBox">
							<input type="tel" name="hotelPhone" class="inputBox">
						</td>
					</tr>
				</table>
			</div>
			<br>
			<h3 style="margin-left:40px;">객실정보</h3>
			<div class="roomFareArea">
				<table class="roomFareTable" border="1">
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
					 	<td rowspan="4"><b>디럭스</b></td>
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
					 <tr>
					 	<td rowspan="4"><b>디럭스</b></td>
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
					 <tr>
					 	<td rowspan="4"><b>디럭스</b></td>
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
			<h3 style="margin-left:40px;">서비스 정보</h3>
			<div class="serviceInfoArea">
				<table class="serviceTable" border="1">
					<tr>
						<td>
							1HH 1시간추가 10,000
						</td>
						<td>
							2HH 2시간추가 20,000
						</td>
						<td>
							3HH 3시간추가 30,000
						</td>
						<td>
							4HH 4시간추가 40,000
						</td>
						<td>
							5HH 5시간추가 50,000
						</td>
					</tr>
					<tr>
						<td>
							6HH 1시간추가 10,000
						</td>
						<td>
							BB 조식 20,000
						</td>
						<td>
							BPERSON 대인추가 30,000
						</td>
						<td>
							CPERSON 소인추가 40,000
						</td>
						<td>
							OTH 기타 50,000
						</td>
					</tr>
				</table>
			</div>
			<br>
			<br>
			<div align="right" class="btnGroup">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick=""><b>다음</b></button>			
			</div>
		</div>
	</div>
</body>
</html>