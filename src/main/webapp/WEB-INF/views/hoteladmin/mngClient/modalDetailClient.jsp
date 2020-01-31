<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.modalDetail {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
}

.modal_content2 {
	position: absolute;
	left: 47%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 740px;
	height: 540px;
	max-height: 500px;
	background-color: white;
}

.modal_content_real2 {
	margin-top: 10px;
	width: 740px;
	height: 440px;
}

.btn_close_plus2 {
	position: absolute;
	top: -1%;
	left: 95.5%;
	font-size: 40px;
	float: right;
	color: white;
}

.btn_close_plus2:hover {
	cursor: pointer;
}

.titleBarplus2 {
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	background-color: royalblue;
}

.titleBarplus2 h2 {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 10px;
}

.clientInfoPlus2 {
	width: 700px;
	height: 60px; 
	margin-bottom: 10px;
	margin-left: 20px;
}

.clientInfoPlus2 td:nth-child(2n-1), .clientSttPlus td:nth-child(2n-1) {
	width: 20%;
	text-align: right;
}

.clientInfoPlus2 td:nth-child(2n), .clientSttPlus td:nth-child(2n) {
	width: 30%;
}

.clientInfoPlus2 input, .clientSttPlus input {
	width: 170px;
	margin-left: 10px;
}

.modalDetail2 input[readonly] {
	background-color: #E4E2E2;
	border: 1px solid darkgray;
}

.clientHisPlus2 {
	width: 700px;
	margin-left: 20px;
	height: 240px;
	max-height: 250px;
	overflow-y: auto;
	border-top: 1px solid darkgray;
	border-bottom: 1px solid darkgray;
}

.stayHisSec2 th {
	background-color: #f7f7f7;
  	color: #005B9E;
}

.stayHisSec2 th, .stayHisSec2 td {
	text-align: center;
	border: 1px solid lightgrey;
	padding-top: 3px;
	padding-bottom: 3px;
}

.stayHisSec2 th:nth-child(1), .stayHisSec2 td:nth-child(1) {
	border-left: none;
}

.stayHisSec2 th:last-child, .stayHisSec2 td:last-child {
	border-right: none;
}

.changecontent2 {
	margin-left: 20px;
	margin-right: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid lightgrey;
}

.changecontent2 span {
	font-weight: bold;
}

.clientSttPlus2 {
	width: 700px;
	height: 60px; 
	margin-bottom: 10px;
	margin-top: 10px;
	margin-left: 20px;
}

.btnSecPlus2 {
	width: 740px;
	height: 46px;
	display: inline-flex;
}

#stayHisPlus2, #changeHisPlus2 {
	width: 246px;
	height: 46px;
	margin-right: 1px;
	font-size: 15px;
	background-color: lightgrey;
	font-weight: bold;
	border: none;
}

#saveBtnPlus2 {
	border: none;
	width: 246px;
	height: 46px;
	font-size: 15px;
	background-color: black;
	color: white;
	font-weight: bold;
}
.clientSttPlus2bottom input{
	text-align:center;
}
</style>
</head>
<body>
	<div class="modalDetail">
		<div class="modal_content2">
			<div class="titleBarplus2">
				<h2>고객관리</h2>
				<a class="btn_close_plus2">×</a>
			</div>
			
			<div class="modal_content_real2">
				<div class="clientInfoPlus2">
				<form action="clientInfoUpdate.cl" method="post" class="clientInfoForm">
					<table>
						<tr>
							<td>고객번호</td>
							<td><input type="text" class="clientDetailMno" name="clientDetailMno" id="clientDetailMno" readonly></td>
							<td>전화</td>
							<td><input type="tel" class="clientDetailPhone" name="clientDetailPhone" id="clientDetailPhone"></td>
						</tr>
						<tr>
							<td>* 고객명</td>
							<td><input type="text" class="clientDetailName" name="clientDetailName" id="clientDetailName"></td>
							<td>이메일</td>
							<td><input type="email" class="clientDetailEmail" name="clientDetailEmail" id="clientDetailEmail"></td>
						</tr>
					</table>
				</form>
				</div>
				
				<div class="clientHisPlus2">
					<div class="stayHisSec2">
						<table align="center" style="border-collapse: collapse; margin:0; width:700px;" class="stayAndRsvTabel">
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
					
					<div class="changeHisSec2">
						<div class="changecontent2">
							<table class="clientDetailQueTable">
							</table>
						</div>
					</div>
				</div>
				
				<div class="clientSttPlus2">
					<table align="center" class="clientSttPlus2bottom">
						<tr>
							<td>방문횟수</td>
							<td><input type="text" class="clientDetailVisitCount" readonly></td>
							<td>매출</td>
							<td><input type="text" class="clientDetailTotalPrice" readonly></td>
						</tr>
						<tr>
							<td>투숙박수</td>
							<td><input type="text" class="clientDetailStayDay"  readonly></td>
							<td>최종방문일자</td>
							<td><input type="text" class="clientDetailLastVisit" readonly></td>
						</tr>
					</table>
				</div>
			
				<div class="btnSecPlus2">
					<button id="stayHisPlus2">예약 및 투숙이력</button>
					<button id="changeHisPlus2">문의이력</button>
					<button id="saveBtnPlus2" onclick="return clientUpdate();">저장</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	
		$(document).ready(function() {
			
			clientMno = $("#clientDetailMno").val();
			clientName = $("#clientDetailName").val();
			clientPhone = $("#clientDetailPhone").val();
			clientEmail = $("#clientDetailEmail").val();
		
			
			$(".stayHisSec2").hide();
			$(".changeHisSec2").hide();
			
			$(".btn_close_plus2").click(function() {
				$(".clientDetailQueTable").children().remove();
				$(".stayAndRsvTabel tr:not(th)").siblings("tr").remove();
				$(".modalDetail").fadeOut();
			});
		});
		
		
		$("#stayHisPlus2").click(function(){
			$(".stayHisSec2").show();
			$(".changeHisSec2").hide();
		});
		$("#changeHisPlus2").click(function(){
			$(".stayHisSec2").hide();
			$(".changeHisSec2").show();
		});
		
	</script>
</body>
</html>