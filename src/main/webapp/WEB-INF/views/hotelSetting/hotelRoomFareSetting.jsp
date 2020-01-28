<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	body{
		overflow-x:hidden;
		overflow-y:hidden;
	}
	.contentArea{
		width:1600px;
		height:900px;
	}
	.menubar{
		height:900px;
	}
	.Area4{
		font-weight: bold;
	}
	.rightArea{
		float:right;
		width:1290px;
		margin-left:10px;
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
		margin-left:30px;
	}
	.fareTable{
		width:1200px;
		text-align:center;
		border-collapse: collapse;
		border: 1px solid lightgray;
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
					<h1 class="titleText">§ 객실 요금 설정</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">객실별 기본 요금을 설정해주세요.</h6>
				</div>
			</div>
			
			<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:40px; ">기본 요금 설정</h3>
			</div>
			
			<form action="goAddServicePage.set" method="post">
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
					 <c:forEach var="roomType" items="${ sessionScope.roomTypeList }">
					 <c:set var="rtName" value="${ roomType.rtName }"></c:set>
						 <tr>
						 	<td rowspan="4">${ rtName }<input type="hidden" name="rtName" value="${ rtName }"></td>
						 	<td rowspan="2">비성수기</td>
						 	<td>대실료</td>
						 	<td><input type="text" class="money" name="offRentMon"></td>
						 	<td><input type="text" class="money" name="offRentTue"></td>
						 	<td><input type="text" class="money" name="offRentWed"></td>
						 	<td><input type="text" class="money" name="offRentThu"></td>
						 	<td><input type="text" class="money" name="offRentFri"></td>
						 	<td><input type="text" class="money" name="offRentSat"></td>
						 	<td><input type="text" class="money" name="offRentSun"></td>
						 </tr>
						 <tr>
						 	<td>숙박료</td>
						 	<td><input type="text" class="money" name="offStayMon"></td>
						 	<td><input type="text" class="money" name="offStayTue"></td>
						 	<td><input type="text" class="money" name="offStayWed"></td>
						 	<td><input type="text" class="money" name="offStayThu"></td>
						 	<td><input type="text" class="money" name="offStayFri"></td>
						 	<td><input type="text" class="money" name="offStaySat"></td>
						 	<td><input type="text" class="money" name="offStaySun"></td>
						 </tr>
						 <tr>
						 	<td rowspan="2">성수기</td>
						 	<td>대실료</td>
						 	<td><input type="text" class="money" name="rentMon"></td>
						 	<td><input type="text" class="money" name="rentTue"></td>
						 	<td><input type="text" class="money" name="rentWed"></td>
						 	<td><input type="text" class="money" name="rentThu"></td>
						 	<td><input type="text" class="money" name="rentFri"></td>
						 	<td><input type="text" class="money" name="rentSat"></td>
						 	<td><input type="text" class="money" name="rentSun"></td>
						 </tr>
						 <tr>
						 	<td>숙박료</td>
						 	<td><input type="text" class="money" name="stayMon"></td>
						 	<td><input type="text" class="money" name="stayTue"></td>
						 	<td><input type="text" class="money" name="stayWed"></td>
						 	<td><input type="text" class="money" name="stayThu"></td>
						 	<td><input type="text" class="money" name="stayFri"></td>
						 	<td><input type="text" class="money" name="staySat"></td>
						 	<td><input type="text" class="money" name="staySun"></td>
						 </tr>
					 </c:forEach>
				</table>
			</div>
			<br> 
			<div align="right" style="margin-right:60px;">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button type="submit" class="nextBtn" onclick="return goHotelAddService();"><b>다음</b></button>			
			</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	
	function goHotelAddService(){
		if($(".monet").val() == ""){
			alert("객실 금액을 입력해주세요.");
			return false;
		}
		return true;
		
	}
	
	</script>
</body>
</html>