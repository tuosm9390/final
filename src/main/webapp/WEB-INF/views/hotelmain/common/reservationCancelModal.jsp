<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.reservation-cancel-modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 20;
}

.cancel-modal_content {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	max-height: 700px;
	border: 20px solid white;
	background-color: #FFFAFA;
	overflow-y: auto;
}

.cancel-modal_content_real {
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
.reservation-cancel-modal button{
	width: 100px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<div class="reservation-cancel-modal">
		<div class="cancel-modal_content">
			<h2 align="center" style="font-weight: bold; text-decoration: underline; text-underline-position: under;">예약 취소 완료</h2>
			<a class="btn_close">×</a>
			<div class="cancel-modal_content_real" align="center">
				<div class="cancel-text">
					<h2 style="font-weight: bold;">예약이 정상적으로 취소되었습니다.</h2>
					<p style="font-weight: bold;">예약정보는 삭제되며,<br>
					환불처리는 카드사 영업일 2~5일내에 진행됩니다.</p>
				</div>
				<div class="cancel-btn" align="right">
					<button onclick="gomain();">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".reservation-cancel-modal").fadeOut();
			});
		});
		function gomain(){
			location.href='goMain.hmain';
		};
	</script>
</body>
</html>