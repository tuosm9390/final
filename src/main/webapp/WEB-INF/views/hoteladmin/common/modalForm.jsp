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
	width: 800px;
	height:500px;
	max-height: 500px;
	border: 20px solid white;
	background-color: white;
	overflow-y: auto;
}

.modal_content_real {
	width:780px;
	height:450px;
	/* border:1px solid black; */
	margin:0 auto;
	overflow:auto;
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
			<h1 style="margin:0 auto;">TITLE</h1>
			<a class="btn_close">×</a>
			
			<div class="modal_content_real">
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
			dfdfdfdfadfa6d5fa4df65a4df654ad6f456ds4f56asd4f5as4df5asd4f564df56d4s56f4as56df4a56sf456
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