<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.queNewModal {
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
	height:550px;
	max-height: 550px;
	background-color: white;
}

.modal_content_real {
	width:780px;
	height:500px;
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
	background:royalblue;
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
.modalUpArea{
	width:770px;
	height:250px;
	margin-top:10px;
}
.modalLeftArea{
	float:left;
	padding-left:20px;
	padding-top:20px;
}
.modalLeftArea tr{
	height:55px;
}
.modal_content_real table{
	margin-top:30px;
}
.modal_content_real table tr{
	height:50px;
}

input{
	width:200px;
	height:20px; 
	border-radius: 5px;
	border:1px solid lightgray;
}
textarea{
	border-radius: 5px;
	border:1px solid lightgray;
}
input[type=search]{
	height:30px;
}
select{
	width:200px;
	height:30px; 
	border-radius: 5px;
	border:1px solid lightgray;
}
.modalRightArea{
	float:right;
}
.tableArea{
	border:1px solid lightgray;
	width:450px;
	height:250px;
	border-radius: 10px;
}
th{
	background-color: #f7f7f7;
	color: #005B9E;
	border: 1px solid lightgray;
	height:30px;
}
button{
	width:50px;
	height:25px;
	cursor:pointer;
	border-radius:5px;
	border:0;
	background-color: #3498DB;
   	color: white;
}
.modalDownArea{
	margin-left:20px;
}

</style>
</head>
<body>
	<div class="queNewModal">
		<div class="modal_content">
			<div class="modal_title">
				<h2 style="margin-top: 0px; margin-left: 10px;">고객문의</h2>
				<a style="padding-top: 5px; margin-right: 10px;" class="btn_close">×</a>
			</div>
			<div class="modal_content_real" align="center">
				<table align="center">
					<tr>
						<td><b>문의유형</b></td>
						<td colspan="3">
							<select>
								<option value="">====선택====</option>
								<option value="">기타</option>
								<option value="">예약</option>
								<option value="">숙박</option>
								<option value="">객실</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><b>문의자명</b></td>
						<td><input type="text"></td>
						<td><b>연락처</b></td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td><b>문의제목</b></td>
						<td colspan="3"><input type="text" style="width:572px;"></td>
					</tr>
					<tr>
						<td><b>문의 내용</b></td>
						<td colspan="3"><textarea rows="5" cols="79" style="resize: none;"></textarea></td>
					</tr>
					<tr>
						<td style="margin-top:30px;"><b>답변 내용</b></td>
						<td colspan="3"><textarea rows="5" cols="79" style="resize: none;margin-top:30px;"></textarea></td>
					</tr>
				</table>
				<div class="btnGroup" align="right" style="margin-right: 65px;margin-top:65px;">
					<button style="width: 100px; height: 30px; background:gray;">취소</button>
					<button style="width: 100px; height: 30px;">등록</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".queNewModal").fadeOut();
			});
		});
	</script>
</body>
</html>