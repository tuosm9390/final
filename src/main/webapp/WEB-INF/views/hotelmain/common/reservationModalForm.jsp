<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.reservation-modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 20;
}

.reservation-modal_content {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	max-height: 500px;
	border: 20px solid white;
	background-color: #FFFAFA;
	overflow-y: auto;
}

.reservation-modal_content_real {
	width:780px;
	height: 300px;
	/* border:1px solid black; */
	margin:0 auto;
	overflow:auto;
	background: white;
	vertical-align: middle;
}

.btn_close {
position: absolute;
top:-4%;
left:96.5%;
font-size:40px;
float: right;
color:darkgray;
}

.btn_close:hover {
cursor: pointer;
}

.tableArea{
	position: absolute;
	width: 50%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%)
}
.reservation-modal-table{
	width: 100%;
}

.reservation-modal button{
	width: 100px;
	margin-left: 20px;
}

.reservation-modal-table tr{
	height: 50px;
	font-weight: bold;
	font-size: 18px;
	line-height: 21px;
}

.reservation-modal-table td:nth-child(2){
	text-align: right;
}
</style>
</head>
<body>
	<div class="reservation-modal">
		<div class="reservation-modal_content">
			<h1 align="center">예약자 정보 입력</h1>
			<a class="btn_close">×</a>
			
			<div class="reservation-modal_content_real" align="center">
				<div class="tableArea">
					<table class="reservation-modal-table">
						<tr>
							<td>예약자명</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>예약번호</td>
							<td><input type="text"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-btn" align="right">
				<button onclick="cancel();">취소</button>
				<button onclick="goReservationResult();">확인</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".reservation-modal").fadeOut();
			});
		});
		
		function cancel(){
			$(".reservation-modal").fadeOut();
		};
		
		function goReservationResult(){
			location.href='ReservationCheck.hmain';
		};
	</script>
</body>
</html>