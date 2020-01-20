<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.modalBroken {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 2;
}

.modal_content_broken {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 300px;
	height: 500px;
	max-height: 500px;
	background-color: white;
}

.modal_content_real_broken {
	width: 280px;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 20px;
	height: 420px;
	border-top: 1.5px solid dimgray;
}

.btn_close_broken {
	position: absolute;
	top: -1%;
	left: 89%;
	font-size: 40px;
	float: right;
	color: white;
}

.btn_close_broken:hover {
	cursor: pointer;
}

.brokentitle {
	background-color: dimgray;
	color: white;
	padding: 10px;
}

.modal_content_real_broken td {
	font-size: 14px;
	padding: 5px;
}

.modal_content_real_broken td:first-child {
	font-weight: bold;
}

#endBroken {
	width: 100px;
	height: 30px;
	border: 1px solid royalblue;
	border-radius: 5px;
	background-color: royalblue;
	color: white;
	font-size: 15px;
	font-weight: bold;
	float: right;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div class="modalBroken">
		<div class="modal_content_broken">
			<div class="brokentitle">
				<h1 style="margin: 0">201</h1>
				<a class="btn_close_broken">×</a>
			</div>
			
			<div class="modal_content_real_broken">
				<table>
					<tr>
						<td>고장기간</td>
						<td>01-07(화) ~ 02-12(수)</td>
					</tr>
					<tr>
						<td>고장사유</td>
						<td>관리자 / 2020-01-11 12:11:11</td>
					</tr>
					<tr>
						<td></td>
						<td>고장이 나 버렸음</td>
					</tr>
				</table>
				<button id="endBroken">고장해지</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close_broken").click(function() {
				$(".modalBroken").fadeOut();
			});
		});
	</script>
</body>
</html>