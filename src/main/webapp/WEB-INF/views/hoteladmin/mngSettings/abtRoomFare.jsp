<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:600px;
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
<title>HotelsCompile</title>
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
				<h2>객실 요금</h2>
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
					<c:forEach var="roomFareList" items="${ roomFareList }">
						<tr>
							<td rowspan="4">${ roomFareList.rtName }</td>
							<td rowspan="2">비성수기</td>
							<td>대실료</td>
							<td><input type="text" class="money" name="offRentMon" value="${ roomFareList.offRentMon }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offRentTue" value="${ roomFareList.offRentTue }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offRentWed" value="${ roomFareList.offRentWed }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offRentThu" value="${ roomFareList.offRentThu }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offRentFri" value="${ roomFareList.offRentFri }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offRentSat" value="${ roomFareList.offRentSat }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offRentSun" value="${ roomFareList.offRentSun }" readonly="readonly">원</td>
						</tr>
						<tr>
							<td>숙박료</td>
							<td><input type="text" class="money" name="offStayMon" value="${ roomFareList.offStayMon }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offStayTue" value="${ roomFareList.offStayTue }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offStayWed" value="${ roomFareList.offStayWed }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offStayThu" value="${ roomFareList.offStayThu }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offStayFri" value="${ roomFareList.offStayFri }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offStaySat" value="${ roomFareList.offStaySat }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="offStaySun" value="${ roomFareList.offStaySun }" readonly="readonly">원</td>
						</tr>
						<tr>
						 	<td rowspan="2">성수기</td>
						 	<td>대실료</td>
						 	<td><input type="text" class="money" name="rentMon" value="${ roomFareList.rentMon }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="rentTue" value="${ roomFareList.rentTue }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="rentWed" value="${ roomFareList.rentWed }" readonly="readonly">원</td>
						 	<td><input type="text" class="money" name="rentThu" value="${ roomFareList.rentThu }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="rentFri" value="${ roomFareList.rentFri }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="rentSat" value="${ roomFareList.rentSat }" readonly="readonly">원</td>
						 	<td><input type="text" class="money" name="rentSun" value="${ roomFareList.rentSun }" readonly="readonly">원</td>
						</tr>
						<tr>
						 	<td>숙박료</td>
							<td><input type="text" class="money" name="stayMon" value="${ roomFareList.stayMon }" readonly="readonly">원</td>
						 	<td><input type="text" class="money" name="stayTue" value="${ roomFareList.stayTue }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="stayWed" value="${ roomFareList.stayWed }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="stayThu" value="${ roomFareList.stayThu }" readonly="readonly">원</td>
					    	<td><input type="text" class="money" name="stayFri" value="${ roomFareList.stayFri }" readonly="readonly">원</td>
						 	<td><input type="text" class="money" name="staySat" value="${ roomFareList.staySat }" readonly="readonly">원</td>
							<td><input type="text" class="money" name="staySun" value="${ roomFareList.staySun }" readonly="readonly">원</td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
	</div>	
</section>
<script type="text/javascript">

	function saveRoomFare(){
		
		$(".money").each(function(){
			if($(this).val() == ""){
				alert("객실 가격을 입력해주세요.");
				return false;
			}
			var regex= /[^0-9]/g
			if(regex.test($(this).val())){
				alert("숫자만 입력해주세요.");
				return false;
			}
			
		});
	}
	
</script>
</body>
</html>