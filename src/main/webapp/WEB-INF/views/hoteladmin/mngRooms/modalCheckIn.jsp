<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
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
	left: 32%;
	top: 52%;
	transform: translate(-50%, -50%);
	width: 390px;
	height: 690px;
	background-color: white;
}

.modal_content2 {
	position: absolute;
	left: 58.5%;
	top: 52%;
	transform: translate(-50%, -50%);
	width: 440px;
	height: 690px;
	background-color: white;
}

.modal_content3 {
	position: absolute;
	left: 82.5%;
	top: 52%;
	transform: translate(-50%, -50%);
	width: 270px;
	height: 650px;
	background-color: white;
	border: 20px solid white;
}

.btn_close {
	position: absolute;
	top: -3%;
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
	margin-left: 20px;
}

.statusColor {
	width: 50px;
	height: 60px;
	border-radius: 0px 0px 10px 10px;
}

#ciCancelBtn, #rsvCancelBtn {
	margin-top: 20px;
	margin-left: 10px;
	width: 100px;
	height: 30px;
	border: 1px solid red;
	border-radius: 5px;
	background-color: white;
	color: red;
	font-weight: bold;
	display: none;
}

h4 {
	margin: 0 auto;
}

.info {
	margin-top: 20px;
}

.info, .infoETC {
	margin-left: 20px;
	margin-right: 20px;
}

.infoETC {
	display: inline-flex;
}

.Mred {
	width: 2px;
	height: 18px;
	background-color: red;
}

.Mgrey {
	width: 2px;
	height: 18px;
	background-color: darkgray;
}

.infoTable td:nth-child(2) {
	width: 30%;
}

.infoTable td {
	padding-top: 5px;
	padding-bottom: 5px;
}

input[name=clientName], input[name=checkinTime], input[name=checkoutTime]
	{
	margin-right: 10px;
	width: 120px;
}

#insertClient {
	width: 100px;
	height: 23px;
	border: 1px solid royalblue;
	border-radius: 5px;
	background-color: royalblue;
	color: white;
	font-weight: bold;
}

input[name=clientPhone], input[name=clientEmail] {
	width: 230px;
}

select[name=stayDay], select[name=adultSu], select[name=childSu] {
	width: 50px;
	height: 23px;
}

select[name=selRoomType], select[name=selRoomNum] {
	width: 215px;
	height: 23px;
}

#openMemoMD {
	width: 100px;
	height: 23px;
	border: 1px solid royalblue;
	border-radius: 5px;
	background-color: royalblue;
	color: white;
	font-weight: bold;
	margin-left: 180px;
}

#checkinBtn {
	width: 390px;
	height: 50px;
	margin-top: 163px;
	border: none;
	background-color: black;
	color: white;
	font-weight: bold;
	font-size: 20px;
	display: hidden;
}

.infoBtnSec {
	display: inline-flex;
	width: 390px;
	height: 50px;
	margin-top: 160px;
}

#checkoutBtn, #mdSaveBtn {
	width:130px;
	height:50px;
	border: none;
	background-color: black;
	color: white;
	font-weight: bold;
	font-size: 15px;
}

#openHisMD {
	width:130px;
	height:50px;
	border: none;
	background-color: lightgrey;
	color: black;
	font-weight: bold;
	font-size: 15px;
}

.chargeBar {
	display: inline-flex;
}

#printRecipt {
	width:100px;
	height: 30px;
	border-radius: 5px;
	border: 1px solid darkgray;
	background-color: white;
	color: darkgray;
	margin-top: 20px;
	margin-left: 200px;
	font-weight: bold;
}

.charge {
	margin-left: 20px;
	margin-right: 20px;
}

.feeDetailBar {
	margin-top: 27px;
	display: inline-flex;
}

.feeDetailSec {
	width: 400px;
	height: 120px;
	max-height: 120px;
	border-top: 2px solid darkgray;
	border-bottom: 2px solid darkgray;
	overflow-y: scroll;
}

.feeDetailSec td {
	border-bottom: 1px solid darkgray;
}

.feeDetailSec td:nth-child(1) {
	border-right: 1px solid darkgray;
	text-align: center;
	width: 100px;
}

.feeDetailSec td:nth-child(2) {
	width: 265px;
	text-align: right;
}

.svcDetailBar {
	margin-top: 20px;
	display: inline-flex;
}

#svcAddBtn {
	margin-left: 10px;
	padding: 0;
	width: 20px;
	height: 20px;
	border: 1.5px solid royalblue;
	border-radius: 5px;
	background-color: white;
	color: royalblue;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.svcDetailSec {
	width: 400px;
	height: 120px;
	max-height: 120px;
	border-top: 2px solid darkgray;
	border-bottom: 2px solid darkgray;
	overflow-y: scroll;
}

.svcDetailSec td {
	border-bottom: 1px solid darkgray;
	text-align: center;
}

.svcDetailSec td:not(:first-child) {
	border-left: 1px solid darkgray;
}

select[name=selSvc] {
	width: 90px;
	border: none;
}

input[name=svcCnt] {
	width: 30px;
	border: none;
}

input[name=svcFee], input[name=svcTot] {
	width: 70px;
	text-align: right;
	border: none;
}

#svcDelBtn {
	width: 20px;
	height: 20px;
	font-size: 15px;
	padding: 0;
	border: 1px solid darkgray;
	border-radius: 5px;
	background: white;
	color: darkgray;
	font-weight: bold;
}

.totalDetailBar {
	margin-top: 27px;
	display: inline-flex;
}

.totalDetailSec {
	width: 400px;
	height: 150px;
	border-top: 2px solid darkgray;
}

.totalDetailSec tr:not(:last-child )>td:nth-child(1) {
	width: 200px;
	text-align: center;
	background-color: #E4E2E2;
	border-radius: 5px;
}

.totalDetailSec input {
	text-align: right;
	border-radius: 5px;
	border: 1px solid darkgray;
	height: 20px;
	width: 200px;
}

.totalPrice {
	display: inline-flex;
	width: 440px;
	height: 50px;
	margin-top: 20px;
}

.totalPrice h1 {
	margin-top: 8px;
	margin-bottm: 0;
}

.memoDetailBar {
	background-color: lightgrey;
	display: inline-flex;
}

.memoDetailBar h3 {
	margin-bottom: 0;
	margin-top: 5px;
}

.btn_close_sub {
	font-size: 40px;
	margin-top: -15px;
	margin-left: 201px;
}

.btn_close_sub:hover {
	cursor: pointer;
}

.memoDetailSec {
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 20px;
}

.memoInsert {
	resize: none;
	width: 240px;
	height: 100px;
}

#memoInsertBtn {
	margin-top: 10px;
	margin-left: 150px;
	margin-bottom: 10px;
	width: 100px;
	height: 30px;
	font-size: 15px;
	color: royalblue;
	background-color: white;
	border: 1.5px solid royalblue;
	border-radius: 5px;
}

.memolist {
	width: 250px;
	height: 400px;
	max-height: 400px;
	overflow-y: auto;
}

.memocontent {
	display: inline-flex;
	border-bottom: 1px solid darkgray;
	width: 240px;
}

.memoread {
	width: 85%;
	font-size: 13px;
}

.memoread>span {
	font-weight: bold;
}

#memoDelBtn {
	padding: 0;
	width: 20px;
	height: 20px;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	background-color: white;
	border-radius: 5px;
	color: darkgray;
	border: 1px solid darkgray;
}

.hisDetailBar {
	background-color: lightgrey;
	display: inline-flex;
}

.hisDetailBar h3 {
	margin-bottom: 0;
	margin-top: 5px;
}

.hisDetailSec {
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 20px;
	height: 560px;
	max-height: 560px;
	overflow-y: auto;
}

.hiscontent {
	border-bottom: 1px solid darkgray;
	padding-bottom: 10px;
}

.hiscontent td {
	font-size: 14px;
}

.hiscontent td:nth-child(1) {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="modalInsertClient.jsp"></jsp:include>
	<div class="modal">
		<a class="btn_close">×</a>

		<!-- 고객정보 모달 -->
		<div class="modal_content1">
			<div class="statusNo">
				<div class="statusColor mediumseagreen"></div>
				<h1>　입실</h1>&nbsp;<h1 class="staycode"></h1>
				<button id="ciCancelBtn">× 입실취소</button>
				<button id="rsvCancelBtn">× 예약취소</button>
			</div>
			<!-- 예약정보 section -->
			<div class="info">
				<h4>예약정보</h4>
				<hr>
				<table class="infoTable">
					<tr>
						<td><div class="Mred"></div></td>
						<td>고객명</td>
						<td style="display:inline-flex;"><input type="text" name="clientName">
						<button id="insertClient">추가</button></td>
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
								<c:forEach var="day" begin="1" end="30">
									<option>${ day }</option>
								</c:forEach>
						</select> 박</td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>퇴실일자</td>
						<td><input type="datetime" name="checkoutTime" id="checkOut">
							<input type="checkbox" name="rentYN" id="rentYN"><label for="rentYN">대실</label></td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>성인/소인</td>
						<td>성인 : <select name="adultSu">
							<c:forEach var="i" begin="1" end="10">
								<option>${ i }</option>
							</c:forEach>
						</select> / 소인 : <select name="childSu">
							<c:forEach var="i" begin="1" end="10">
								<option>${ i }</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>객실타입</td>
						<td><select name="selRoomType" id="selRoomType">
						</select></td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>객실번호</td>
						<td><select name="selRoomNum" id="selRoomNum">
						</select></td>
					</tr>
				</table>
			</div>
			<!-- 예약정보 section end -->
			<!-- 기타정보 section -->
			<hr style="margin-left: 20px; margin-right: 20px;">
			<div class="infoETC">
				<h4>기타정보</h4>
				<button id="openMemoMD">메모</button>
			</div>
			<br>
			<button id="checkinBtn">입실</button>
			<div class="infoBtnSec">
				<button id="checkoutBtn">퇴실</button>
				<button id="openHisMD">변경내역</button>
				<button id="mdSaveBtn">저장</button>
			</div>
			<!-- 기타정보 section end -->
		</div>
		<!-- 고객정보 모달 end -->

		<!-- 요금정보 모달 -->
		<div class="modal_content2">
			<div class="chargeBar"><h1 style="margin-left: 20px;">요금상세</h1><button id="printRecipt">영수증 출력</button></div>
			<div class="charge">
				<div class="feeDetailBar">
					<h4>객실료</h4>
					<h4 style="margin-left: 285px;">100,000</h4>
				</div>
				<div class="feeDetailSec">
					<table style="border-collapse: collapse;">
						<tr>
							<td>01-11</td>
							<td>100,000</td>
						</tr>
					</table>
				</div>

				<div class="svcDetailBar">
					<h4>서비스</h4>
					<button id="svcAddBtn">+</button>
					<h4 style="margin-left: 255px;">100,000</h4>
				</div>
				<div class="svcDetailSec">
					<table style="border-collapse: collapse;">
						<tr>
							<td width="20%">01-11</td>
							<td width="30%"><select name="selSvc">
									<option>1시간추가</option>
									<option>2시간추가</option>
									<option>3시간추가</option>
							</select></td>
							<td width="10%"><input type="number" name="svcCnt" min="0"></td>
							<td width="15%"><input type="number" name="svcFee" min="0"></td>
							<td width="15%"><input type="number" name="svcTot" min="0"></td>
							<td width="8%"><button id="svcDelBtn">×</button></td>
						</tr>
					</table>
				</div>

				<div class="totalDetailBar">
					<h4>총금액</h4>
					<h4 style="margin-left: 285px;">123,456</h4>
				</div>
				<div class="totalDetailSec">
					<table>
						<tr>
							<td>신용카드</td>
							<td><input type="number" name="creditCard" min="0"></td>
						</tr>
						<tr>
							<td>현금</td>
							<td><input type="number" name="cash" min="0"></td>
						</tr>
						<tr>
							<td>계좌이체</td>
							<td><input type="number" name="account" min="0"></td>
						</tr>
						<tr>
							<td>환불</td>
							<td><input type="number" name="refund" min="0"></td>
						</tr>
						<tr>
							<td colspan="2">최종결제일 :</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="totalPrice mediumseagreen">
				<h1 style="margin-left:20px;">잔액</h1>
				<h1 style="margin-left:270px; color:red;">100,000</h1>
			</div>
		</div>
		<!-- 요금정보 모델 end -->
		
		<!-- 사이드모달(메모/변경이력) -->
		<div class="modal_content3">
			<div id="viewMemo">
				<div class="memoDetailBar"><h3>메모</h3><a class="btn_close_sub">×</a></div>
				<div class="memoDetailSec">
					<textarea class="memoInsert" placeholder=" 메모를 입력하세요."></textarea>
					<button id="memoInsertBtn">+　추가</button>
					<hr>
					<div class="memolist">
						<div class="memocontent">
							<div class="memoread">
								<span>관리자 2020-01-11 22:35:17</span>
								<p>메모내용내용내용</p>
							</div>
							<button id="memoDelBtn">×</button>
						</div>
					</div>
				</div>
			</div>
			
			<div id="viewHistory">
				<div class="hisDetailBar"><h3>변경이력</h3><a class="btn_close_sub" style="margin-left:165px;">×</a></div>
				<div class="hisDetailSec">
					<div class="hiscontent">
						<table>
							<tr>
								<td colspan="2">관리자 / 2020-01-11 00:00:08</td>
							</tr>
							<tr>
								<td>입실 객실 수</td>
								<td>0 > 1</td>
							</tr>
							<tr>
								<td>도착 시간</td>
								<td>> 12:34</td>
							</tr>
							<tr>
								<td>예약 상태</td>
								<td>예약 > 입실</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 사이드모달(메모/변경이력) end -->
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modal").fadeOut();
			});
			
			$("#insertClient").click(function(){
				$(".modalplus").fadeIn();
			});
		});

		$(function() {
			$(".modal_content3").hide();
			$("#viewMemo").hide();
			$("#viewHistory").hide();
			$("#checkinBtn").hide();
			$(".infoBtnSec").hide();
			$("#printRecipt").hide();
			
			date = new Date();
			checkIn = $("#checkIn").datepicker({
				autoClose : true,
				minDate : new Date(),
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
				minDate : new Date(),
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					startNum = date;
					$('#checkIn').datepicker({
						//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
						maxDate : new Date(startNum),
					});
				}
			}).data('datepicker');
			
			
			
			$(".btn_close_sub").click(function() {
				$(".modal_content3").hide();
				$("#viewMemo").hide();
				$("#viewHistory").hide();
			});
			
			$("#openMemoMD").click(function(){
				$(".modal_content3").show();
				$("#viewMemo").show();
				//$("#viewHistory").show();
			});
		});
		
		$("#rentYN").change(function(){
			$("#checkOut").val(today);
		});

	</script>
</body>
</html>