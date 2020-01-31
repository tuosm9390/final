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

.titleBarplus h2 {
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
	background-color: #E4E2E2;
	border: 1px solid darkgray;
}

.clientHisPlus {
	width: 700px;
	margin-left: 20px;
	height: 275px;
	max-height: 275px;
	overflow-y: auto;
	border-top: 1px solid darkgray;
	border-bottom: 1px solid darkgray;
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

#deleteCBtn {
	width: 20px;
	height: 20px;
	border: 2px solid darkgray;
	border-radius: 5px;
	background-color: white;
	color: darkgray;
	font-size: 15px;
	font-weight: bold;
	padding: 0;
}
</style>
</head>
<body>
	<div class="modalplus">
		<div class="modal_content">
			<div class="titleBarplus">
				<h2>블랙리스트 상세</h2>
				<a class="btn_close_plus">×</a>
			</div>
			
			<div class="modal_content_real">
				<div class="clientInfoPlus">
					<table>
						<tr>
							<td>고객번호</td>
							<td><input type="text" class="blackListDetailMno" name="blackListDetailMno" id="blackListDetailMno"  readonly></td>
							<td>전화</td>
							<td><input type="tel" class="blackListDetailPhone" name="blackListDetailPhone" id="blackListDetailPhone"  readonly></td>
						</tr>
						<tr>
							<td>* 고객명</td>
							<td><input type="text" class="blackListDetailName" name="blackListDetailName" id="blackListDetailName"  readonly></td>
							<td>이메일</td>
							<td><input type="email" class="blackListDetailEmail" name="blackListDetailEmail" id="blackListDetailEmail"  readonly></td>
						</tr>
					</table>
				</div>
				
				<div class="clientHisPlus">
					<div class="changeHisSec">
						<div class="changecontent">
							<table class="blackListContentTable">
	
							</table>
						</div>
					</div>
				</div>
				
				<div class="blackListContentArea">
					<table align="center">
						<tr>
							<td>방문횟수</td>
							<td><input type="text" class="blackListDetailVisitCount" readonly></td>
							<td>매출</td>
							<td><input type="text" class="blackListDetailTotalPrice" readonly></td>
						</tr>
						<tr>
							<td>투숙박수</td>
							<td><input type="text" class="blackListDetailStayDay" readonly></td>
							<td>최종방문일자</td>
							<td><input type="text" class="blackListDetailLastVisit" readonly></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close_plus").click(function() {
				$(".blackListContentTable tr").remove();
				$(".modalplus").fadeOut();
			});
		});
		
	</script>
</body>
</html>