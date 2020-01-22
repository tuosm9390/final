<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modalBlackListAdd {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
}

.modal_content {
	position: absolute;
	left: 47%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 740px;
	height: 540px;
	max-height: 500px;
	background-color: white;
}

.modal_content_real {
	margin-top: 10px;
	width: 740px;
	height: 440px;
}

.titleBarplus {
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	background-color: royalblue;
}

.titleBarplus h2 {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 10px;
}

.btn_close {
	position: absolute;
	top: -1%;
	left: 95.5%;
	font-size: 40px;
	float: right;
	color: white;
}

.btn_close:hover {
	cursor: pointer;
}

.modalLeftArea {
	text-align: center;
}

.blackListInfo {
	padding-top: 10px;
	padding-left: 30px;
}

.modalRightArea {
	margin-top: 45px;
	width: 400px;
	height: 220px;
	padding-top: 40px;
}

.blackListInfoList {
	width: 400px;
}

.blackListInfoListArea {
	width: 400px;
	height: 220px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.blackListInfoList th {
	height: 30px;
	background-color: rgba(85, 115, 255, 0.24);
	color: black;
	font-size: 10px;
}

.blackListModalTableArea {
	width: 740px;
	height: 380px;
}

.blackBtnGroup {
	margin-left: 350px;
}
#cancelBtn {
	width: 100px;
	height: 25px;
	border: 0;
	border-radius: 2px;
	background-color: darkgray;
}
#okBtn {
	width: 100px;
	height: 25px;
	border: 0;
	border-radius: 2px;
	background-color: royalblue;
	color: white;
}

.blackListInfo td {
	padding: 10px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="modalBlackListAdd">
		<div class="modal_content">
			<div class="titleBarplus">
				<h2>블랙리스트 등록</h2>
				<a class="btn_close">×</a>
			</div>
			
			<div class="modal_content_real">
			<div class="blackListModalTableArea">
				<table>
					<tr>
						<td>
							<div class="modalLeftArea">
								<table class="blackListInfo">
									<tr>
										<td>고객명</td>
										<td><input type="text" style="width:210px;"></td> 
										<td>연락처</td>
										<td><input type="text" style="width:210px;"></td> 
									</tr>
									<tr>
										<td>사유</td>
										<td colspan="3"><textarea rows="8" cols="70" style="resize: none;"></textarea></td>
									</tr>
									<tr>
										<td>대응내용</td>
										<td colspan="3"><textarea rows="8" cols="70" style="resize: none;"></textarea></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
				<div align="center" class="blackBtnGroup">
					<button id="cancelBtn">취소</button>
					<button id="okBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modalBlackListAdd").fadeOut();
			});
		});
	</script>
</body>
</html>