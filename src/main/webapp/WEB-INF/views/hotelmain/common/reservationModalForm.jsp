<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

.modal_content {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	max-height: 500px;
	border: 20px solid white;
	background-color: #FFFAFA;
	overflow-y: auto;
}

.modal_content_real {
	width:780px;
	/* border:1px solid black; */
	margin:0 auto;
	overflow:auto;
	background: white;
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
</style>
</head>
<body>
	<div class="modal">
		<div class="modal_content">
			<h1 align="center">예약자 정보 입력</h1>
			<a class="btn_close">×</a>
			
			<div class="modal_content_real" align="center">
				<table class="modal-table">
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
			<div class="modal-btn" align="right">
				<button>취소</button>
				<button>확인</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modal").fadeOut();
			});
		});
	</script>
</body>
</html>