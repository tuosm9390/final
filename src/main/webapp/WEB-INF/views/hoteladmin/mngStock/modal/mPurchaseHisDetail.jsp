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
	width:1220px;
	height:500px;
	max-height: 500px;
	border: 20px solid white;
	background-color: white;
	overflow-y: auto;
}

.modal_content_real {
	width:100%;
	height:100%;
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
			<h1 style="margin:0 auto;">구매상세</h1>
			<a class="btn_close">×</a>
			
			<div class="modal_content_real">
				<jsp:include page="../stock/purchaseHisDetail.jsp"/>
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