<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.reservation-check-modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 20;
}

.reservation-check-modal_content {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	max-height: 700px;
	border: 20px solid white;
	background-color: #FFFAFA;
	overflow-y: auto;
}

.reservation-check-modal_content_real {
	width:780px;
	/* border:1px solid black; */
	height: 100%;
	margin:0 auto;
	overflow:auto;
	background: white;
}

.btn_close {
position: absolute;
top:0%;
left:96.5%;
font-size:40px;
float: right;
color:darkgray;
}

.btn_close:hover {
cursor: pointer;
}

.refund-text{
	display: inline-flex;
}
.ceo-text{
	margin-left: 100px;
}
.modal-btn button{
	width: 100px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<jsp:include page="reservationCancelModal.jsp"></jsp:include>
	<div class="reservation-check-modal">
		<div class="reservation-check-modal_content">
			<h2 align="center" style="font-weight: bold; text-decoration: underline; text-underline-position: under;">예약 취소</h2>
			<a class="btn_close">×</a>
			
			<div class="reservation-check-modal_content_real" align="center">
				<div class="top-content">
					<h2 style="font-weight: bold;">예약을 취소하시겠습니까?</h2>
					<li style="font-weight: bold;">본인 확인을 위해 예약번호를 입력해주세요<br><br>
					<input type="text">
				</div>
				<div class="refund-content">
					<h2 style="font-weight: bold; text-decoration: underline; text-underline-position: under;">환불규정</h2>
					<br>
					<h4 style="font-weight: bold;">[ 성수기 주말 ]</h4>
					<div class="refund-text">
						<div class="customer-text" align="left">
							<p style="font-weight: bold;">- 소비자 책임</p>
	10일전 or 계약 당일 : 동일<br>
	7일전 : 20% 공제<br>
	5일전 : 40% 공제<br>
	3일전 :60% 공제<br>
	1일전 또는 당일 : 90% 공제
						</div>
						<div class="ceo-text" align="left">
							<p style="font-weight: bold;">- 사업자 책임</p>
	10일전 : 동일<br>
	7일전 : 계약금+20%배상<br>
	5일전 : 계약금+40%배상<br>
	3일전 : 계약금+60%배상<br>
	1일전 또는 당일 : 동일<br>
						</div>
					</div>
					<h4 style="font-weight: bold;">[ 기후변화 또는 천재지변, 거짓 과장 광고 ]</h4>
					<div class="disaster-text" align="center">
						계약금 환급
					</div>
					<label style="font-weight: 200; font-size: 16px; line-height: 21px;
						color: rgba(145, 133, 133, 0.71); float: right;">
						<input type="checkbox" id="agreement" name="agreement"
						style="width: 19px; height: 19px; vertical-align: middle; margin-top: 0px;">위 규정을 확인하였습니다.
					</label>
				</div>
			</div>
			
			<div class="modal-btn" align="right">
				<button onclick="cancel();">취소</button>
				<button onclick="goReservationCancel();">확인</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".reservation-check-modal").fadeOut();
			});
		});
		
		function cancel(){
			$(".reservation-check-modal").fadeOut();
		};
		
		function goReservationCancel(){
			$(".reservation-check-modal").fadeOut();
			$(".reservation-cancel-modal").fadeIn();
		};
	</script>
</body>
</html>