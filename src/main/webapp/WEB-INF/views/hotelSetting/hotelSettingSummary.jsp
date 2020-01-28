<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	body{
		overflow-x:hidden;
	}
	.menubar{
		height:1030px; 
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
		width:90px;
		border:0;
		text-align:center;
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
		width:1115px;
		height:150px;
		border:1px solid lightgray;
		overflow-y:scroll;
		overflow-x:hidden;
	}
</style>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
	<c:set var="info" value="${ sessionScope.info }"/>
	<c:set var="basic" value="${ sessionScope.basic }"/>
	<c:set var="prcList" value="${ sessionScope.roomPrcList }"/>
	<c:set var="svcList" value="${ sessionScope.svcList }"/>
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
							<input type="text" name="hotelName" class="inputBox" value="${ info.hname }" disabled="disabled">
						</td>
						<td>
							<label>* 대표자</label>
						</td>
						<td>
							<input type="text" name="hotelOwner" class="inputBox" value="${ info.owner }" disabled="disabled">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 이메일</label>
						</td>
						<td class="secondBox">
							<input type="email" name="hotelEmail" class="inputBox" value="${ info.hemail }" disabled="disabled">
						</td>
						<td>
							<label>* 휴대폰</label>
						</td>
						<td>
							<input type="tel" name="ownerPhone" class="inputBox" value="${ info.hphone }" disabled="disabled">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 입실시간</label>
						</td>
						<td class="secondBox">
							<input type="text" name="companyName" class="inputBox" value="${ basic.chkIn }" disabled="disabled">
						</td>
						<td>
							<label>* 퇴실시간</label>
						</td>
						<td>
							<input type="text" name="companyNumber" class="inputBox" value="${ basic.chkOut }" disabled="disabled">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 대실시간</label>
						</td>
						<td class="secondBox">
							<input type="tel" name="hotelPhone" class="inputBox" value="${ basic.lentUnit }" disabled="disabled">
						</td>
						<td>
							<label>&nbsp; 호텔전화</label>
						</td>
						<td class="secondBox">
							<input type="tel" name="hotelPhone" class="inputBox" value="${ info.htel }" disabled="disabled">
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
					 <c:forEach var="roomType" items="${ sessionScope.roomTypeList }" varStatus="status">
					 <c:set var="prc" value="${ sessionScope.roomPrcList }"/>
					 <c:set var="rtName" value="${ roomType.rtName }"></c:set>
						 <tr>
						 	<td rowspan="4">${ rtName }<input type="hidden" name="rtName" value="${ rtName }"></td>
						 	<td rowspan="2">비성수기</td>
						 	<td>대실료</td>
						 	<td><input type="text" class="money" name="offRentMon" value="${ prc[status.index].offRentMon }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offRentTue" value="${ prc[status.index].offRentTue }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offRentWed" value="${ prc[status.index].offRentWed }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offRentThu" value="${ prc[status.index].offRentThu }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offRentFri" value="${ prc[status.index].offRentFri }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offRentSat" value="${ prc[status.index].offRentSat }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offRentSun" value="${ prc[status.index].offRentSun }" readonly="readonly"></td>
						 </tr>
						 <tr>
						 	<td>숙박료</td>
						 	<td><input type="text" class="money" name="offStayMon" value="${ prc[status.index].offStayMon }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offStayTue" value="${ prc[status.index].offStayTue }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offStayWed" value="${ prc[status.index].offStayWed }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offStayThu" value="${ prc[status.index].offStayThu }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offStayFri" value="${ prc[status.index].offStayFri }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offStaySat" value="${ prc[status.index].offStaySat }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="offStaySun" value="${ prc[status.index].offStaySun }" readonly="readonly"></td>
						 </tr>
						 <tr>
						 	<td rowspan="2">성수기</td>
						 	<td>대실료</td>
						 	<td><input type="text" class="money" name="rentMon" value="${ prc[status.index].rentMon }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="rentTue" value="${ prc[status.index].rentTue }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="rentWed" value="${ prc[status.index].rentWed }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="rentThu" value="${ prc[status.index].rentThu }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="rentFri" value="${ prc[status.index].rentFri }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="rentSat" value="${ prc[status.index].rentSat }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="rentSun" value="${ prc[status.index].rentSun }" readonly="readonly"></td>
						 </tr>
						 <tr>
						 	<td>숙박료</td>
						 	<td><input type="text" class="money" name="stayMon" value="${ prc[status.index].stayMon }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="stayTue" value="${ prc[status.index].stayTue }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="stayWed" value="${ prc[status.index].stayWed }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="stayThu" value="${ prc[status.index].stayThu }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="stayFri" value="${ prc[status.index].stayFri }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="staySat" value="${ prc[status.index].staySat }" readonly="readonly"></td>
						 	<td><input type="text" class="money" name="staySun" value="${ prc[status.index].staySun }" readonly="readonly"></td>
						 </tr>
					 </c:forEach>
				</table>
			</div>
			<br>
			<h3 style="margin-left:40px;">서비스 정보</h3>
			<div class="serviceInfoArea">
				<table class="serviceTable" border="1">
					<c:forEach var="svcList" items="${ svcList }">
						<tr>
							<td>${ svcList.svcCode }</td>
							<td>${ svcList.svcName }</td>
							<td>${ svcList.svcPrice }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br>
			<br>
			<div align="right" class="btnGroup">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick="location.href='goHotelAddImages.set'"><b>다음</b></button>			
			</div>
		</div>
	</div>
</body>
</html>