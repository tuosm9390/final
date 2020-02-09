<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.modalDetailRoomView {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
}

.modal_content2RoomView {
	position: absolute;
	left: 47%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 740px;
	height: 540px;
	max-height: 500px;
	background-color: white;
}

.modal_content_real2RoomView {
	margin-top: 10px;
	width: 740px;
	height: 440px;
}

.btn_close_plus2RoomView {
	position: absolute;
	top: -1%;
	left: 95.5%;
	font-size: 40px;
	float: right;
	color: white;
}

.btn_close_plus2RoomView:hover {
	cursor: pointer;
}

.titleBarplus2RoomView {
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	background-color: royalblue;
}

.titleBarplus2RoomView h2 {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 10px;
}

.clientInfoPlus2RoomView {
	width: 700px;
	height: 60px; 
	margin-bottom: 10px;
	margin-left: 20px;
}

.clientInfoPlus2RoomView td:nth-child(2n-1), .clientSttPlusRoomView td:nth-child(2n-1) {
	width: 20%;
	text-align: right;
}

.clientInfoPlus2RoomView td:nth-child(2n), .clientSttPlusRoomView td:nth-child(2n) {
	width: 30%;
}

.clientInfoPlus2RoomView input, .clientSttPlusRoomView input {
	width: 170px;
	margin-left: 10px;
}

.modalDetail2RoomView input[readonly] {
	background-color: #E4E2E2;
	border: 1px solid darkgray;
}

.clientHisPlus2RoomView {
	width: 700px;
	margin-left: 20px;
	height: 240px;
	max-height: 250px;
	overflow-y: auto;
	border-top: 1px solid darkgray;
	border-bottom: 1px solid darkgray;
}

.stayHisSec2RoomView th {
	background-color: #f7f7f7;
  	color: #005B9E;
}

.stayHisSec2RoomView th, .stayHisSec2RoomView td {
	text-align: center;
	border: 1px solid lightgrey;
	padding-top: 3px;
	padding-bottom: 3px;
}

.stayHisSec2RoomView th:nth-child(1), .stayHisSec2RoomView td:nth-child(1) {
	border-left: none;
}

.stayHisSec2RoomView th:last-child, .stayHisSec2RoomView td:last-child {
	border-right: none;
}

.changecontent2RoomView {
	margin-left: 20px;
	margin-right: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid lightgrey;
}

.changecontent2RoomView span {
	font-weight: bold;
}

.clientSttPlus2RoomView {
	width: 700px;
	height: 60px; 
	margin-bottom: 10px;
	margin-top: 10px;
	margin-left: 20px;
}

.btnSecPlus2RoomView {
	width: 740px;
	height: 46px;
	display: inline-flex;
}

#stayHisPlus2RoomView, #changeHisPlus2RoomView {
	width: 246px;
	height: 46px;
	margin-right: 1px;
	font-size: 15px;
	background-color: lightgrey;
	font-weight: bold;
	border: none;
}

#saveBtnPlus2RoomView {
	border: none;
	width: 246px;
	height: 46px;
	font-size: 15px;
	background-color: black;
	color: white;
	font-weight: bold;
}
.clientSttPlus2bottomRoomView input{
	text-align:center;
}
</style>
</head>
<body>
	<div class="modalDetailRoomView">
		<div class="modal_content2RoomView">
			<div class="titleBarplus2RoomView">
				<h2>고객관리</h2>
				<a class="btn_close_plus2RoomView">×</a>
			</div>
			
			<div class="modal_content_real2RoomView">
				<div class="clientInfoPlus2RoomView">
				<form action="clientInfoUpdate.cl" method="post" class="clientInfoFormRoomView">
					<table>
						<tr>
							<td>고객번호</td>
							<td><input type="text" class="clientDetailMnoRoomView" name="clientDetailMno" id="clientDetailMnoRoomView" readonly></td>
							<td>전화</td>
							<td><input type="tel" class="clientDetailPhoneRoomView" name="clientDetailPhone" id="clientDetailPhoneRoomView"></td>
						</tr>
						<tr>
							<td>* 고객명</td>
							<td><input type="text" class="clientDetailNameRoomView" name="clientDetailName" id="clientDetailNameRoomView"></td>
							<td>이메일</td>
							<td><input type="email" class="clientDetailEmailRoomView" name="clientDetailEmail" id="clientDetailEmailRoomView"></td>
						</tr>
					</table>
				</form>
				</div>
				
				<div class="clientHisPlus2RoomView">
					<div class="stayHisSec2RoomView">
						<table align="center" style="border-collapse: collapse; margin:0; width:700px;" class="stayAndRsvTabelRoomView">
							<tr>
								<th width="14%">입실일자</th>
								<th width="14%">퇴실일자</th>
								<th width="6%">박수</th>
								<th width="11%">객실번호</th>
								<th width="20%">비용 (객실요금)</th>
								<th width="14%">예약일자</th>
								<th width="16%">상태</th>
							</tr>
						</table>
					</div>
					
					<div class="changeHisSec2RoomView">
						<div class="changecontent2RoomView">
							<table class="clientDetailQueTableRoomView">
							</table>
						</div>
					</div>
				</div>
				
				<div class="clientSttPlus2RoomView">
					<table align="center" class="clientSttPlus2bottomRoomView">
						<tr>
							<td>방문횟수</td>
							<td><input type="text" class="clientDetailVisitCountRoomView" readonly></td>
							<td>매출</td>
							<td><input type="text" class="clientDetailTotalPriceRoomView" readonly></td>
						</tr>
						<tr>
							<td>투숙박수</td>
							<td><input type="text" class="clientDetailStayDayRoomView"  readonly></td>
							<td>최종방문일자</td>
							<td><input type="text" class="clientDetailLastVisitRoomView" readonly></td>
						</tr>
					</table>
				</div>
			
				<div class="btnSecPlus2RoomView">
					<button id="stayHisPlus2RoomView">예약 및 투숙이력</button>
					<button id="changeHisPlus2RoomView">문의이력</button>
					<button id="saveBtnPlus2RoomView" onclick="return clientUpdate();">저장</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	
		$(document).ready(function() {
			
			clientMno = $("#clientDetailMnoRoomView").val();
			clientName = $("#clientDetailNameRoomView").val();
			clientPhone = $("#clientDetailPhoneRoomView").val();
			clientEmail = $("#clientDetailEmailRoomView").val();
		
			
			$(".stayHisSec2RoomView").hide();
			$(".changeHisSec2RoomView").hide();
			
			$(".btn_close_plus2RoomView").click(function() {
				$(".clientDetailQueTableRoomView").children().remove();
				$(".stayAndRsvTabelRoomView tr:not(th)").siblings("tr").remove();
				$(".modalDetailRoomView").fadeOut();
			});
		});
		
		
		$("#stayHisPlus2RoomView").click(function(){
			$(".stayHisSec2RoomView").show();
			$(".changeHisSec2RoomView").hide();
		});
		$("#changeHisPlus2RoomView").click(function(){
			$(".stayHisSec2RoomView").hide();
			$(".changeHisSec2RoomView").show();
		});
		
	</script>
</body>
</html>