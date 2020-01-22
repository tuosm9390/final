<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.queModal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 16;
}

.modal_content {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	width: 800px;
	height:500px;
	max-height: 500px;
	background-color: white;
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
.modal_title{
	background:#060E33;
	color:white;
	height:35px;
	padding-top:5px;
}
.btn_close:hover {
cursor: pointer;
}
.modalTitleArea td{
	padding-right:30px;
}
.modalTitleArea{
	width:600px;
	margin-top:50px;
	border-bottom-color: black;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	padding-bottom:10px;
}
.modalContentArea{
	margin-top:10px;
	width:600px;
	height:200px;
	border-bottom-color: black;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	padding-bottom:10px;
}
.modalContentArea tr{
	height:30px;
}
.modalAnwArea{
	width:600px;
}
</style>
</head>
<body>
	<div class="queModal">
		<div class="modal_content">
			<div class="modal_title">
				<h2 style="margin-top:0px;margin-left:10px;">고객문의</h2>
				<a style="padding-top:5px;margin-right:10px;" class="btn_close">×</a>
			</div>
			<div class="modal_content_real" align="center">
				<div class="modalTitleArea">
					<table align="center">
						<tr>
							<td><b>문의자 명</b> :  송기준</td>
							<td><b>이메일</b> : mrSong@naver.com</td>
							<td><b>문의 유형</b> : 기타</td>
						</tr>
					</table>
				</div>
				<div class="modalContentArea">
					<table align="center">
						<tr>
							<td>
								<b>문의 일자 : </b>
							</td>
							<td>
								2020-10-10
							</td>
						</tr>
						<tr>
							<td>
								<b>문의 제목 : </b>
							</td>
							<td>
								송기준을 짤라주세요
							</td>
						</tr>
						<tr>
							<td>
								<b>문의 내용 : </b>
							</td>
							<td>
								송기준을짜라라라라라라짤짜라어라ㅣ먼;이러민아ㅓㄹ 짤라주세요
							</td>
						</tr>
					</table>
				</div>
				<div class="modalAnwArea">
					<table align="left" style="margin-left:20px;">
						<tr>
							<td><b>답변 : </b></td>							
							<td>전화주시면 친절하게 답변 해드립니다.</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".queModal").fadeOut();
			});
		});
	</script>
</body>
</html>