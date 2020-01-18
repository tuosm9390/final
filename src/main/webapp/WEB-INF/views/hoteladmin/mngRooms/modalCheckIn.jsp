<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${ contextPath }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${ contextPath }/resources/js/datepicker.min.js"></script>
<!-- Korean language -->
<script src="${ contextPath }/resources/js/datepicker.kr.js"></script>
<style>
.modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 2;
}

.modal_content1 {
	position: absolute;
	left: 35%;
	top: 52%;
	transform: translate(-50%, -50%);
	width: 390px;
	height: 690px;
	background-color: white;
}

.modal_content2 {
	position: absolute;
	left: 60%;
	top: 52%;
	transform: translate(-50%, -50%);
	width: 390px;
	height: 690px;
	background-color: white;
}

.modal_content3 {
	position: absolute;
	left: 82.5%;
	top: 52%;
	transform: translate(-50%, -50%);
	width: 310px;
	height: 690px;
	background-color: white;
}

.btn_close {
	position: absolute;
	top: -2%;
	left: 70%;
	font-size: 60px;
	float: right;
	color: white;
}

.btn_close:hover {
	cursor: pointer;
}

.statusNo {
	display: inline-flex;
	margin-left:20px;
}

.statusColor {
	width: 50px;
	height: 60px;
	border-radius: 0px 0px 10px 10px;
}
h4{
margin:0 auto;}
.info{
margin-top:20px;}
.info, .infoETC {
margin-left:20px;
margin-right:20px;
}

.infoETC {
	display: inline-flex;
}

.Mred {
width:2px;
height:18px;
background-color:red;}
.Mgrey {
width:2px;
height:18px;
background-color:lightgrey;}
.infoTable td:nth-child(2) {
width:30%;}
.infoTable td {
padding-top:5px;
padding-bottom:5px;
}
input[name=clientName], input[name=checkinTime], input[name=checkoutTime] {
margin-right:10px;
width:120px;
}
#insertClient {
width:100px;
height:23px;
border:1px solid midnightblue;
border-radius:5px;
background-color:midnightblue;
color:white;
font-weight:bold;
}
input[name=clientPhone], input[name=clientEmail] {
width:230px;}
select[name=stayDay], select[name=adultSu], select[name=childSu] {
width:50px;
height:23px;
}
select[name=selRoomType], select[name=selRoomNum] {
width:215px;
height:23px;}
#openMemoMD {
width:100px;
height:23px;
border:1px solid midnightblue;
border-radius:5px;
background-color:midnightblue;
color:white;
font-weight:bold;
margin-left:180px;
}
#checkinBtn {
width:390px;
height:50px;
margin-top:180px;
}
</style>
</head>
<body>
	<div class="modal">
		<a class="btn_close">×</a>
		
		<!-- 고객정보 모달 -->
		<div class="modal_content1">
			<div class="statusNo">
				<div class="statusColor mediumseagreen"></div>
				<h1>　입실</h1>
			</div>
			<!-- 예약정보 section -->
			<div class="info">
				<h4>예약정보</h4>
				<hr>
				<table class="infoTable">
					<tr>
						<td><div class="Mred"></div></td>
						<td>고객명</td>
						<td><input type="text" name="clientName"><button id="insertClient">추가</button></td>
					</tr>
					<tr>
						<td><div class="Mgrey"></div></td> 
						<td>전화번호</td>
						<td><input type="tel" name="clientPhone"></td>
					</tr>
					<tr>
						<td><div class="Mgrey"></div></td>
						<td>이메일</td>
						<td><input type="email" name="clientEmail"></td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>입실일자</td>
						<td><input type="datetime" name="checkinTime" id="checkIn">
							<select name="stayDay">
								<c:forEach var="day" begin="1" end="10">
									<option>${ day }</option>
								</c:forEach>
							</select> 박
						</td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>퇴실일자</td>
						<td><input type="datetime" name="checkoutTime" id="checkOut"><input type="checkbox" name="rentYN" id="rentYN"><label for="rentYN">대실</label></td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>성인/소인</td>
						<td>
							성인 : <select name="adultSu">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								 </select>
							 / 소인 : <select name="childSu">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								 </select>
						</td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>객실타입</td>
						<td>
							<select name="selRoomType">
								<option>스탠다드</option>
								<option>디럭스</option>
								<option>스위트</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>객실번호</td>
						<td>
							<select name="selRoomNum">
								<option>101</option>
								<option>202</option>
								<option>303</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<!-- 예약정보 section end -->
			<!-- 기타정보 section -->
			<hr style="margin-left:20px; margin-right:20px;">
			<div class="infoETC"><h4>기타정보</h4> <button id="openMemoMD">메모</button></div>
			<br>
			<button id="checkinBtn">입실</button>
			<!-- 기타정보 section end -->
		</div>
		<!-- 고객정보 모달 end -->
		
		<div class="modal_content2">
			<h1>요금상세</h1>
			<div class="modal_content_real">
				<div><h3>객실료</h3><h3>100,000</h3></div>
				<div>
					<table>
						<tr>
							<td>01-11</td>
							<td>100,000</td>
						</tr>
					</table>
				</div>
				
				<div><h3>서비스</h3><button>+</button><h3>0</h3></div>
				<div>
					<table>
						<tr>
							<td>01-11</td>
							<td>
								<select>
									<option>1시간추가</option>
									<option>2시간추가</option>
									<option>3시간추가</option>
								</select>
							</td>
							<td><input type="number"></td>
							<td><input type="number"></td>
							<td><input type="number"></td>
							<td><button>×</button></td>
						</tr>
					</table>
				</div>
				
				<div><h3>총금액</h3><h3>123,456</h3></div>
				<div>
					<table>
						<tr>
							<td>신용카드</td>
							<td><input type="number"></td>
						</tr>
						<tr>
							<td>현금</td>
							<td><input type="number"></td>
						</tr>
						<tr>
							<td>계좌이체</td>
							<td><input type="number"></td>
						</tr>
						<tr>
							<td>환불</td>
							<td><input type="number"></td>
						</tr>
						<tr>
							<td rowspan="2">최종결제일 : </td>
						</tr>
					</table>
				</div>
				
				<div>
					<h1>잔액</h1>
					<h1>100,000</h1>
				</div>
			</div>
		</div>
		
		<!-- <div class="modal_content3">
			<h1>TITLE</h1>
			<div class="modal_content_real">
			</div>
		</div> -->
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modal").fadeOut();
			});
		});
		
		$(function() {
			checkIn = $("#checkIn").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					endNum = date;
					//종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
					$("#checkOut").datepicker({
						minDate : new Date(endNum),
					});
				}
			}).data('datepicker');

			checkOut = $("#checkOut").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					startNum = date;
					$('#checkIn').datepicker({
						//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
						maxDate : new Date(startNum),
					});
				}
			}).data('datepicker');
		});
	</script>
</body>
</html>