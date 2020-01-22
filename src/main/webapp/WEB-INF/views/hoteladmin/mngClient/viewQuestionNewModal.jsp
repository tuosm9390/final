<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
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

.modal_content2 {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	width: 800px;
	height:500px;
	max-height: 500px;
	background-color: white;
}

.modal_content_real2 {
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
.modal_title2{
	background:royalblue;
	color:white;
	height:35px;
	padding-top:5px;
}
.btn_close:hover {
cursor: pointer;
}
.modalTitleArea2 td{
	padding-right:30px;
}
.modalTitleArea2{
	width:600px;
	margin-top:20px;
	border-bottom-color: black;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	padding-bottom:10px;
}
.modalContentArea2{
	margin-top:10px;
	width:600px;
	height:200px;
	border-bottom-color: black;
	border-bottom-width: 1px;
	border-bottom-style: solid;
}
.modalContentArea2 tr{
	height:30px;
}
.modalAnwArea{
	width:600px;
}
</style>
</head>
<body>
	<div class="queModal">
		<div class="modal_content2">
			<div class="modal_title2">
				<h2 style="margin-top:0px;margin-left:10px;">고객문의</h2>
				<a style="padding-top:5px;margin-right:10px;" class="btn_close">×</a>
			</div>
			<div class="modal_content_real2" align="center">
				<div class="modalTitleArea2">
					<table align="center" style="margin-top:10px;">
						<tr>
							<td><b>문의자 명</b> :  송기준</td>
							<td><b>연락처</b> : mrSong@naver.com</td>
							<td><b>문의 유형</b> : 기타</td>
						</tr>
					</table>
				</div>
				<div class="modalContentArea2">
					<table align="left">
						<tr>
							<td style="width:100px;">
								<b>문의 일자 : </b>
							</td>
							<td>
								2020-10-10
							</td>
							<td colspan="3">
							</td>
						</tr>
						<tr>
							<td style="width:100px;">
								<b>문의 제목 : </b>
							</td>
							<td>
								송기준을 짤라주세요
							</td>
							<td colspan="3">
							</td>
						</tr>
						<tr>
							<td>
								<b>문의 내용</b>
							</td>
							<td colspan="4"></td>
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="5" cols="82" style="resize: none;"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="modalAnwArea">
					<table align="left">
						<tr>
							<td><b>답변 내용</b></td>							
							<td colspan="3"></td>
						</tr>
						<tr>
							<td colspan="4"><textarea rows="5" cols="82" style="resize: none;"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><button style="float:right;">저장</button></td>
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