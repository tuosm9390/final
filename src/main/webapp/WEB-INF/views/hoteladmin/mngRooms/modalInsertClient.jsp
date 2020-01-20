<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.modalplus {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
}

.modal_content {
	position: absolute;
	left: 47%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 740px;
	height: 540px;
	max-height: 500px;
	background-color: white;
}

.modal_content_real {
	margin-top: 10px;
	width: 740px;
	height: 440px;
}

.btn_close_plus {
	position: absolute;
	top: -1%;
	left: 95.5%;
	font-size: 40px;
	float: right;
	color: white;
}

.btn_close_plus:hover {
	cursor: pointer;
}

.titleBarplus {
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	background-color: royalblue;
}

.titleBarplus h1 {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 10px;
}

.clientInfoPlus {
	width: 700px;
	height: 60px; 
	margin-bottom: 10px;
	margin-left: 20px;
}

.clientInfoPlus td:nth-child(2n-1), .clientSttPlus td:nth-child(2n-1) {
	width: 20%;
	text-align: right;
}

.clientInfoPlus td:nth-child(2n), .clientSttPlus td:nth-child(2n) {
	width: 30%;
}

.clientInfoPlus input, .clientSttPlus input {
	width: 170px;
	margin-left: 10px;
}

.modalplus input[readonly] {
	background-color: lightgrey;
	border: 1px solid darkgray;
}

.clientHisPlus {
	width: 700px;
	margin-left: 20px;
	height: 240px;
	max-height: 250px;
	overflow-y: auto;
	border-top: 1px solid darkgray;
	border-bottom: 1px solid darkgray;
}

.stayHisSec th {
	background-color: darkgray;
}

.stayHisSec th, .stayHisSec td {
	text-align: center;
	border: 1px solid lightgrey;
	padding-top: 3px;
	padding-bottom: 3px;
}

.stayHisSec th:nth-child(1), .stayHisSec td:nth-child(1) {
	border-left: none;
}

.stayHisSec th:last-child, .stayHisSec td:last-child {
	border-right: none;
}

.changecontent {
	margin-left: 20px;
	margin-right: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid lightgrey;
}

.changecontent span {
	font-weight: bold;
}

.clientSttPlus {
	width: 700px;
	height: 60px; 
	margin-bottom: 10px;
	margin-top: 10px;
	margin-left: 20px;
}

.btnSecPlus {
	width: 740px;
	height: 46px;
	display: inline-flex;
}

#stayHisPlus, #changeHisPlus {
	width: 246px;
	height: 46px;
	margin-right: 1px;
	font-size: 15px;
	background-color: lightgrey;
	font-weight: bold;
	border: none;
}

#saveBtnPlus {
	border: none;
	width: 246px;
	height: 46px;
	font-size: 15px;
	background-color: black;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="modalplus">
		<div class="modal_content">
			<div class="titleBarplus">
				<h1>고객정보</h1>
				<a class="btn_close_plus">×</a>
			</div>
			
			<div class="modal_content_real">
				<div class="clientInfoPlus">
					<table>
						<tr>
							<td>고객번호</td>
							<td><input type="text" value="20292030" readonly></td>
							<td>전화</td>
							<td><input type="tel"></td>
						</tr>
						<tr>
							<td>* 고객명</td>
							<td><input type="text"></td>
							<td>이메일</td>
							<td><input type="email"></td>
						</tr>
					</table>
				</div>
				
				<div class="clientHisPlus">
					<div class="stayHisSec">
						<table align="center" style="border-collapse: collapse;">
							<tr>
								<th width="6%">번호</th>
								<th width="14%">입실일자</th>
								<th width="14%">퇴실일자</th>
								<th width="6%">박수</th>
								<th width="11%">객실번호</th>
								<th width="24%">비용 (객실요금)</th>
								<th width="14%">예약일자</th>
								<th width="12%">상태</th>
							</tr>
							<tr>
								<td>1</td>
								<td>2020-01-01</td>
								<td>2020-01-02</td>
								<td>1</td>
								<td>209</td>
								<td>1,000,000 (1,000,000)</td>
								<td>2019-12-13</td>
								<td>체크아웃</td>
							</tr>
						</table>
					</div>
					
					<div class="changeHisSec">
						<div class="changecontent">
							<table>
								<tr><td colspan="2">관리자 / 2020-01-01 01:23:32</td></tr>
								<tr>
									<td style="font-weight: bold">고객명</td>
									<td>김진호 > 김호진</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div class="clientSttPlus">
					<table>
						<tr>
							<td>방문횟수</td>
							<td><input type="text" readonly></td>
							<td>매출</td>
							<td><input type="text" readonly></td>
						</tr>
						<tr>
							<td>투숙박수</td>
							<td><input type="text" readonly></td>
							<td>최종방문일자</td>
							<td><input type="text" readonly></td>
						</tr>
					</table>
				</div>
			
				<div class="btnSecPlus">
					<button id="stayHisPlus">투숙이력</button>
					<button id="changeHisPlus">변경이력</button>
					<button id="saveBtnPlus">저장</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".stayHisSec").hide();
			$(".changeHisSec").hide();
			
			$(".btn_close_plus").click(function() {
				$(".modalplus").fadeOut();
			});
		});
		
		$("#stayHisPlus").click(function(){
			$(".stayHisSec").show();
			$(".changeHisSec").hide();
		});
		$("#changeHisPlus").click(function(){
			$(".stayHisSec").hide();
			$(".changeHisSec").show();
		});
	</script>
</body>
</html>