<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.sur-modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 20;
}

.sur-modal_content {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
/* 	max-height: 700px; */
	border: 20px solid white;
	background-color: #FFFAFA;
	overflow-y: auto;
}

.sur-modal_content_real {
	width:780px;
	height:270px;
	/* border:1px solid black; */
	margin:0 auto;
	overflow:auto;
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

.sur-modal_content_real_text{
	position: absolute;
	width: 100%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%)
}

.modal-btn button{
	width: 100px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<div class="sur-modal">
		<div class="sur-modal_content">
			<h2 align="center" style="font-weight: bold; text-decoration: underline; text-underline-position: under;">오픈 예정</h2>
			<a class="btn_close">×</a>
			
			<div class="sur-modal_content_real" align="center">
				<div class="sur-modal_content_real_text">
					<p style="font-size: 36px;">
					2월 32일에 오픈될 예정입니다.<br>
					조금만 더 기다려주세요.^^</p>
				</div>
			</div>
			<div class="modal-btn" align="right">
				<button onclick="cancel();">확인</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".sur-modal").fadeOut();
			});
		});
		
		function cancel(){
			$(".sur-modal").fadeOut();
		};
	</script>
</body>
</html>