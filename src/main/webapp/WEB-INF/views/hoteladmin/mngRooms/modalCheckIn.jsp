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
	margin-top: 25px;
	margin-left: 20px;
	width: 100px;
	height: 30px;
	border: 1px solid red;
	border-radius: 5px;
	background-color: white;
	color: red;
	font-weight: bold;
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

.findClientList {
	width: 234px;
	height: 85px;
	position: fixed;
	background-color: #E4E2E2;
	margin-top: 23px;
	max-height: 85px;
	overflow-y: auto;
	overflow-x: hidden;
}

.findClientPer {
	font-size: 14px;
	margin-left: 10px;
	width: 220px;
	overflow-x: hidden;
	background-color: none;
}

.findClientPer:hover {
	cursor: pointer;
	background-color: darkgray;
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

select[name=stayDay] {
	width: 50px;
	height: 23px;
}

select[name=personCnt] {
	width: 120px;
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
	margin-top: 165px;
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

.feeDetailBar table {
	margin-top: 22px;
	width: 400px;
}
.vfeeDetailBar table {
	margin-top: 0px;
	width: 400px;
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

.svcDetailBar table {
	margin-top: 4px;
	width: 400px;
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

.svcDelBtn {
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

.totalDetailBar table {
	margin-top: 10px;
	width: 400px;
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
	margin-top: 10px;
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

input[type=number]:disabled {
	background-color: white;
}

.totalPrice table {
	width: 430px;
}

.redText{display: block; color: red; font-size: 12px;}
.greenText{display: block; color: green; font-size: 12px;}

</style>
</head>
<body>
	<jsp:include page="modalInsertClient.jsp"></jsp:include>
	<div class="modal">
		<a class="btn_close">×</a>
		
		<form id="checkinModal" method="post">
		<!-- 고객정보 모달 -->
		<div class="modal_content1">
			<div class="statusNo">
				<div class="statusColor"></div>
				<h1 id="modalStt">　입실</h1>&nbsp;<h3 class="staycode" id="staycode" style="margin-top:25px;"></h3>
				<button type="button" id="ciCancelBtn">× NO-SHOW</button>
				<button type="button" id="rsvCancelBtn">× 예약취소</button>
			</div>
			<!-- 예약정보 section -->
			<div class="info">
				<h4>예약정보</h4>
				<hr>
				<table class="infoTable">
					<tr>
						<td><div class="Mred"></div></td>
						<td>고객명</td>
						<td style="display:inline-flex;"><input type="text" name="clientName" id="clientName">
						<input type="hidden" name="clientNo" value="0" id="clientNo">
						<div class="findClientList"></div>
						<button id="insertClient" type="button">추가</button></td>
					</tr>
					<tr>
						<td><div class="Mgrey"></div></td>
						<td>전화번호</td>
						<td><input type="tel" name="clientPhone" id="clientPhone" maxlength="11" placeholder=" '-'를 제외하고 입력"></td>
					</tr>
					<tr>
						<td><div class="Mgrey"></div></td>
						<td>이메일</td>
						<td><input type="email" name="clientEmail" id="clientEmail"><span id="emailSpan"></span></td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>입실일자</td>
						<td><!-- <input type="text" name="checkinTime" id="checkIn"> -->
							<select name="stayDay">
								<c:forEach var="day" begin="0" end="365">
									<option value="${ day }">${ day }</option>
								</c:forEach>
						</select> 박</td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>퇴실일자</td>
						<td><!-- <input type="text" name="checkoutTime" id="checkOut"> -->
							<input type="checkbox" name="rentYN" id="rentYN"><label for="rentYN">대실</label></td>
					</tr>
					<tr>
						<td><div class="Mred"></div></td>
						<td>투숙인원</td>
						<td><select name="personCnt" id="personCnt"></select><span> 명</span></td>
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
				<button id="openMemoMD" type="button">메모</button>
			</div>
			<br>
			<button id="checkinBtn" onclick="doCheckIn()" type="button">입실</button>
			<div class="infoBtnSec">
				<button id="checkoutBtn" type="button">퇴실</button>
				<button id="openHisMD" type="button">변경내역</button>
				<button id="mdSaveBtn" type="button">저장</button>
			</div>
			<!-- 기타정보 section end -->
		</div>
		<!-- 고객정보 모달 end -->

		<!-- 요금정보 모달 -->
		<div class="modal_content2">
			<div class="chargeBar"><h1 style="margin-left: 20px;">요금상세</h1><button id="printRecipt" type="button">영수증 출력</button></div>
			<div class="charge">
				<div class="feeDetailBar">
					<table>
						<tr>
							<td width="20%"><h4>객실료</h4></td>
							<td style="text-align:right;" width="80%"><h4 id="totalRoom"></h4></td>
							<input type="hidden" name="totalRoom" id="iptTotalRoom" value="0">
						</tr>
					</table>
				</div>
				<div class="feeDetailSec">
					<table style="border-collapse: collapse;">
					</table>
				</div>
				
				<div class="vfeeDetailBar">
					<table>
						<tr>
							<td width="20%"><h4>봉사료</h4></td>
							<td style="text-align:right;" width="80%"><h4 id="totalVlt"></h4></td>
							<input type="hidden" name="totalVlt" id="iptTotalVlt" value="0">
						</tr>
					</table>
				</div>

				<div class="svcDetailBar">
					<table>
						<tr>
							<td width="15%"><h4>서비스</h4></td>
							<td width="5%"><button id="svcAddBtn" style="margin-left:0;" type="button">+</button></td>
							<td style="text-align:right;" width="80%"><h4 id="totalSvc">0</h4></td>
							<input type="hidden" id="iptTotalSvc" name="totalSvc" value="0">
						</tr>
					</table>
				</div>
				<div class="svcDetailSec">
					<table style="border-collapse: collapse;">
						<tr class="svcTR">
							<td width="20%"></td>
							<td width="30%"><select name="selSvc" onchange="selSvcName(this.id, this.value);">
								<option selected hidden>서비스 선택</option>
								<c:forEach var="s" items="${ svcList }">
									<option value="${ s.svcCode }">${ s.svcName }</option>
								</c:forEach>
							</select></td>
							<td width="10%"><input type="number" name="svcCnt" min="0" placeholder="수량" onchange="selSvcCnt(this.id)"></td>
							<td width="15%"><input type="number" name="svcFee" placeholder="가격" disabled></td>
							<td width="15%"><input type="number" name="svcTot" placeholder="합계" disabled></td>
							<td width="8%"><button class="svcDelBtn" onclick="doSvcDelBtn(this);" type="button">×</button></td>
						</tr>
					</table>
				</div>

				<div class="totalDetailBar">
					<table>
						<tr>
							<td width="20%"><h4>총금액</h4></td>
							<td style="text-align:right;" width="80%"><h4 id="totalPrc">0</h4></td>
							<input type="hidden" name="totalPrc" id="iptTotalPrc" value="0">
						</tr>
					</table>
				</div>
				<div class="totalDetailSec">
					<table>
						<tr>
							<td>신용카드</td>
							<td><input type="number" name="creditCard" id="payCard" min="0" onchange="payMoney()" value="0"></td>
						</tr>
						<tr>
							<td>현금</td>
							<td><input type="number" name="cash" min="0" id="payCash" onchange="payMoney()" value="0"></td>
						</tr>
						<tr>
							<td>계좌이체</td>
							<td><input type="number" name="account" min="0" id="payAcc" onchange="payMoney()" value="0"></td>
						</tr>
						<tr>
							<td>환불</td>
							<td><input type="number" name="refund" min="0" id="payRfd" onchange="payMoney()" value="0"></td>
						</tr>
						<tr>
							<td colspan="2">최종결제일 : <span id="lastPayDay"></span></td>
							<input type="hidden" name="lastPayDay" value="0" id="iptLastPayDay">
						</tr>
					</table>
				</div>
			</div>

			<div class="totalPrice">
				<table>
					<tr>
						<td width="20%"><h1 style="margin-left:20px;">잔액</h1></td>
						<td style="text-align:right;" width="80%"><h1 style="color:red;" id="chargePrc">0</h1></td>
					</tr>
				</table>
				
				
			</div>
		</div>
		<!-- 요금정보 모델 end -->
		
		<!-- 사이드모달(메모/변경이력) -->
		<div class="modal_content3">
			<div id="viewMemo">
				<div class="memoDetailBar"><h3>메모</h3><a class="btn_close_sub">×</a></div>
				<div class="memoDetailSec">
					<textarea class="memoInsert" placeholder=" 메모를 입력하세요."></textarea>
					<button id="memoInsertBtn" type="button">+　추가</button>
					<hr>
					<div class="memolist">
						<div class="memocontent">
							<div class="memoread">
								<span>관리자 2020-01-11 22:35:17</span>
								<p>메모내용내용내용</p>
							</div>
							<button id="memoDelBtn" type="button">×</button>
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
	</form>

	<script>
		//총금액 변경 함수
		function changeTotalPrcTxt() {
			var prc1 = parseInt($("#totalRoom").text().replace(/,/g , '')); 
			var prc3 = parseInt($("#totalVlt").text().replace(/,/g , '')); 
			var prc2 = parseInt($("#totalSvc").text().replace(/,/g , '')); 
			var sum = prc1 + prc2 + prc3;
			$("#totalPrc").text(sum.toLocaleString()); 
			changeChargePrcTxt();
			changePrcIH();
		}
		
		//input hidden 값 변경 함수
		function changePrcIH() {
			$("#iptTotalRoom").val(parseInt($("#totalRoom").text().replace(/,/g , '')));
			$("#iptTotalVlt").val(parseInt($("#totalVlt").text().replace(/,/g , '')));
			$("#iptTotalSvc").val(parseInt($("#totalSvc").text().replace(/,/g , '')));
			$("#iptTotalPrc").val(parseInt($("#totalPrc").text().replace(/,/g , '')));
		}
		
		//잔액 변경 함수
		function changeChargePrcTxt() {
			var totPrc = parseInt($("#totalPrc").text().replace(/,/g , ''));
			var card = $("#payCard").val();
			var cash = $("#payCash").val();
			var acc = $("#payAcc").val();
			var refundPrc = $("#payRfd").val() * 1;
			var charge = totPrc - card - cash - acc + refundPrc;
			$("#chargePrc").text(charge.toLocaleString());
		}
		
		$(document).ready(function() {
			$("#ciCancelBtn").hide();
			$("#rsvCancelBtn").hide();
			
			$(".btn_close").click(function() {
				$(".modal input").val('');
				$("#checkIn").remove();
				$("#checkOut").remove();
				$(".feeDetailSec tr").remove();
				$(".svcDetailSec tr:not(:first)").remove();
				$("#personCnt option").remove();
				$("#insertClient").text('추가');
				$(".findClientList").hide();
				$("#payRfd").prop("disabled", false).css("background-color", "white");
				
				$("#totalRoom").text('0');
				$("#totalSvc").text('0');
				$("#totalPrc").text('0');
				$("#chargePrc").text('0');
				$("#totalVlt").text('0');
				$("#payCard").val(0);
				$("#payCash").val(0);
				$("#payAcc").val(0);
				$("#payRfd").val(0);
				
				$("#checkinBtn").hide();
				$(".infoBtnSec").hide();
				$("#ciCancelBtn").hide();
				$("#rsvCancelBtn").hide();
				
				$(".statusColor").removeClass('mediumseagreen');
				$(".totalPrice").removeClass('mediumseagreen');
				$(".statusColor").removeClass('lightsteelblue');
				$(".totalPrice").removeClass('lightsteelblue');
				$(".statusColor").removeClass('mediumseagreen');
				$(".totalPrice").removeClass('mediumseagreen');
				$(".statusColor").removeClass('gold');
				$(".totalPrice").removeClass('gold');
				
				$("#rentYN").prop('checked', false);
				
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
			$(".svcTR").css('display', 'none');
			$(".findClientList").hide();
			
			
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
			$("select[name=stayDay]").val('0').prop('selected', true);
		});
		
		$("select[name=stayDay]").change(function(){
			var plusDay = $(this).val() * 1;
			var coDay = new Date(today); coDay.setDate(coDay.getDate() + plusDay); coDay = coDay.format("yyyy-MM-dd");
			$("#checkOut").val(coDay);
		});

		var tempsvccnt = 0;
		$("#svcAddBtn").click(function(){
			var cloneSvc = $(".svcTR").clone();
			cloneSvc.attr('class', 'svcTRc').css({'display':'table-row', 'width':'100%'});
			cloneSvc.find('select').attr('id', 'selSvc' + tempsvccnt);
			cloneSvc.find('input[type=number]').eq(0).attr('id', 'svcCnt' + tempsvccnt);
			$(".svcDetailSec table").append(cloneSvc);
			$(".svcDetailSec tr:last-child").children().eq(0).text(new Date().format('MM-dd'));
			tempsvccnt++;
		});
		
		var svctotprc = 0;
		function doSvcDelBtn(data) {
			svctotprc -= $(data).parent().parent().children().eq(4).children().val();
			$(data).parent().parent().remove();
			$("#totalSvc").text(svctotprc.toLocaleString());
			changeTotalPrcTxt();
		}
		
		function selSvcName(thisEl, svcCode){
			svctotprc -= $("#" + thisEl).parent().parent().children().eq(4).children().val();
			for(var i = 0; i < svclist.length; i++) {
				if(svclist[i].svcCode == svcCode) {
					var svcPrc = svclist[i].svcPrice;
				}
			}
			var thisElparent = $("#" + thisEl).parent().parent();
			thisElparent.children().eq(2).children().val('1');
			thisElparent.children().eq(3).children().val(svcPrc);
			thisElparent.children().eq(4).children().val(svcPrc);
			
			svctotprc += svcPrc;
			$("#totalSvc").text(svctotprc.toLocaleString());
			changeTotalPrcTxt();
		}
		
		function selSvcCnt(thisEl) {
			var thisElparent = $("#" + thisEl).parent().parent();
			
			svctotprc -= thisElparent.children().eq(4).children().val();
			
			var cnt = $("#" + thisEl).val();
			var prc = thisElparent.children().eq(3).children().val();
			thisElparent.children().eq(4).children().val(cnt * prc);
			
			svctotprc += cnt * prc;
			$("#totalSvc").text(svctotprc.toLocaleString());
			changeTotalPrcTxt();
		}
		
		function payMoney() {
			$("#lastPayDay").text(new Date().format('yyyy-MM-dd HH:mm:ss'));
			$("#iptLastPayDay").val($("#lastPayDay").text());
			changeChargePrcTxt();
		}
		
		var clientList;
		$("#clientName").keyup(function(){
			var searchName = $(this).val();
			$.ajax({
				url:"ajxFindClient.ro",
				data:{searchName:searchName},
				type:"post",
				success:function(data){
					clientList = data.clientList;
					if(clientList.length == 0) {
						$(".findClientList").hide();
						$(".findClientList div").remove();
					} else {
						$(".findClientList div").remove();
						for(var i = 0; i < clientList.length; i++) {
							$infoClient = "<div class='findClientPer' id='per" + clientList[i].mno + "' onclick='findClientClk(this.id)'>" + clientList[i].userName + " | " + clientList[i].phone + "</div>";
							$(".findClientList").append($infoClient);
						}
						$(".findClientList").show();
					}
				},
				error:function(error, status){
					alert("SYSTEM ERROR!");
				}
			});

		}).keydown(function(){
			$(".findClientList").hide();
			$(".findClientList div").remove();
		});
//		.focusout(function(){
//			$(".findClientList").hide();
//			$(".findClientList div").remove();
//		});
		
		function findClientClk(thisEl) {
			$(".findClientList").hide();
			var mno = thisEl.substring(3);
			for(var i = 0; i < clientList.length; i++) {
				if(clientList[i].mno == mno) {
					$("#clientName").val(clientList[i].userName);
					$("#clientPhone").val(clientList[i].phone);
					$("#clientEmail").val(clientList[i].email);
					$("#clientNo").val(mno);
					$("#insertClient").text(mno);
				}
			}
		}
		
		$("#selRoomType").change(function(){
			var rmType = $(this).val();
			var cnt = 0;
			var stdPer = 0;
			var rtNo;
			for(var i = 0; i < roomlist.length; i++) {
				if(roomlist[i].rtName != rmType) {
					$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").hide();
				} else {
					rtNo = roomlist[i].rtNo;
					$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").show();
					stdPer = roomlist[i].stdPer;
					if($("#selRoomNum option[value=" + roomlist[i].rmNo + "]").prop('disabled')) {
					} else {
						cnt++;
					}
				}
				
				if(cnt == 1) {
					$("#selRoomNum option[value=" + roomlist[i].rmNo + "]").prop("selected", true);
					cnt++;
				}
			}
			
			$("#personCnt option").remove();
			for(var i = 1; i <= stdPer; i++) {
				$("#personCnt").append("<option value='" + i + "'>" + i + "</option>");
			}
			
			var sttday = new Date($("#checkIn").val().substring(0,4), $("#checkIn").val().substring(5,7) - 1, $("#checkIn").val().substring(8,10));
			var endday = new Date($("#checkOut").val().substring(0,4), $("#checkOut").val().substring(5,7) - 1, $("#checkOut").val().substring(8,10));
			if($("#checkOut").val() == '') {
				endday = sttday;
			}
			var perday = (endday - sttday) / 1000 / 60 / 60 / 24;
			changeModalFee(rtNo, sttday, endday, perday);
		});
		
		$("#clientEmail").keyup(function(event){
			var email = $("#clientEmail").val();
			var check = /(\w{4,})@(\w{1,})\.(\w{1,3})/ig;
			if(check.test(email)){
				$("#emailSpan").removeClass('redText').addClass('greenText');
				$("#emailSpan").text("");
			} else {
				$("#emailSpan").removeClass('greenText').addClass('redText');
				$("#emailSpan").text("부적합한 Email 입니다. 다시 입력해 주세요!");
			}
		});

		//체크인 등록 함수
		function doCheckIn() {
			$("#checkinModal").attr("action", "insertCI.ro");
			$("#checkinModal").submit();
		}
		
		//예약취소 버튼
		$("#rsvCancelBtn").click(function(){
			var rsvNo = $("#staycode").text();
			if(window.confirm("[ " + rsvNo + " ] 해당 예약을 취소하시겠습니까?")) {
				location.href = "cancelReserv.ro?rsvNo=" + rsvNo;
			}
		});
	</script>
</body>
</html>