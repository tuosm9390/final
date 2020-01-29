<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<style>
.qna-modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 20;
}

.qna-modal_content {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
/* 	max-height: 700px; */
	border: 20px solid white;
	background-color: #FFFAFA;
	overflow-y: auto;
}

.qna-modal_content_real {
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

.check-password{
	position: absolute;
	width: 50%;
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
	<div class="qna-modal">
		<div class="qna-modal_content">
			<h2 align="center" style="font-weight: bold; text-decoration: underline; text-underline-position: under;">비밀번호 확인</h2>
			<a class="btn_close">×</a>
			
			<div class="qna-modal_content_real" align="center">
				<form id="pwdCheckForm" action="qnadetail.hmain" method="post">
					<div class="check-password">
						<h2 style="font-weight: bold;">비밀번호를 입력해주세요</h2>
						<input type="text" name="pwd" id="pwd">
					</div>
				</form>
			</div>
			<div class="modal-btn" align="right">
				<button onclick="cancel();">취소</button>
				<button onclick="goQnADetail();">확인</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".qna-modal").fadeOut();
			});
		});
		
		function cancel(){
			$(".qna-modal").fadeOut();
		};
		
// 		function goQnADetail(){
//			location.href='qnadetail.hmain';
// 			location.href='qnadetail.hmain?qno=' + qno + "&type=lock";
// 		};
	</script>
</body>
</html>