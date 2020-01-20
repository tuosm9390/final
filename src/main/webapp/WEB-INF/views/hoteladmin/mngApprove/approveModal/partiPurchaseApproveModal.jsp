<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	height: auto;
	max-height: 500px;
	border: 20px solid white;
	background-color: white;
	overflow-y: auto;
}

.modal_content_real {
	width: 780px;
	height: 450px;
	border: 1px solid black;
	margin: 0 auto;
	overflow: auto;
}

.btn_close {
	position: absolute;
	top: -4%;
	left: 96.5%;
	font-size: 40px;
	float: right;
	color: darkgray;
}

.btn_close:hover {
	cursor: pointer;
}

.modalTbl {
	
}

#tbl_modal {
	padding-top: 10px;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
}

#tbl_modal td {
	height: 30px;
	border: 1px solid black;
}

#tbl_modal td:last-child {
	border-right: 0px;
}

#tbl_modal td:fisrt-child {
	border-left: 0px;
}

.txtArea {
	margin-left: auto;
	margin-right: auto;
	border: 1px solid lightgray;
	width: 700px;
	height: 400px;
	text-align: center;
}

.approveBtn {
	
	float: right;
	margin-bottom: 20px;
}
.approveBtn button {
	height:30px;
	width:100px;
	border-radius:5px;
	background:#E5E5E5;
	border:0px;
}


</style>
</head>
<body>
	<div class="modal">
		<div class="modal_content">
			<a class="btn_close">×</a>

			<h2 style="text-align: center;">구매 요청서</h2>
			
			
			<!-- 결재 승인/반려 버튼 -->
			<div class="approveBtn">
				<button onclick="submit();">결재승인</button>
				<button onclick="reject();">결재반려</button>
			</div>
			<!-- 결재 버튼 end -->
			
			
			<!-- content 내용 -->
			<div class="modal_content_real">
				<div class="modalTbl">
					<table id="tbl_modal">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="25%">
							<col width="15%">
							<col width="20%">
							<col width="20%">

						</colgroup>
						<tr>
							<td>문서번호</td>
							<td colspan="2">102020</td>
							<td>부서장</td>
							<td colspan="2">총지배인</td>
						</tr>
						<tr>
							<td>기안부서</td>
							<td colspan="2">구매팀</td>
							<td rowspan="2"></td>
							<td rowspan="2" colspan="2"></td>
						</tr>
						<tr>
							<td>기안자</td>
							<td colspan="2">전세환</td>

						</tr>
						<tr>
							<td>기안일</td>
							<td colspan="2">SYSDATE</td>
							<td rowspan="2" colspan="3"></td>

						</tr>
						<tr>
							<td>수신자</td>
							<td colspan="2">SYSDATE</td>



						</tr>
						<tr>
							<td>제목</td>
							<td colspan="5">구매 요청서</td>
						</tr>
						<tr style="background: lightgray;">
							<td>NO</td>
							<td>항목</td>
							<td>품목명</td>
							<td>수량</td>
							<td>공급가액</td>
							<td>금액</td>
						</tr>
						<tr>
							<td>1</td>
							<td>비품</td>
							<td>LG 36인치 TV</td>
							<td>2</td>
							<td>1000000</td>
							<td>2000000</td>
						</tr>
						<tr>
							<td colspan="2">총 금액</td>
							<td colspan="4"><a style="float: right;">2000000 원</a></td>
						</tr>
						<tr>
							<td colspan="6" rowspan="6">
								<div class="txtArea">
									<a>아래와 같이 보고 하오니 검토후 재가 바랍니다.</a> <br>
									<br>
									<br>
									<br> <a>-아 래-</a><br>
									<br>
									<br> <a>SYSDATE</a>&nbsp; <a>OOOO</a> <a>목적으로 하여</a>&nbsp;
									<a>총금액 원</a> <a>사용을 결제하고자 하오니 <br>검토후 재기하여 주시기 바랍니다.
									</a>

								</div>
							</td>
						</tr>

					</table>


				</div>
			</div>
			<!-- content end -->
		</div>
	</div>
	<br>
	<br>
	<br>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modal").fadeOut();
			});
			
		});
		function submit() {
			
			if(window.confirm("승인 하시겠습니까?") == true) {
				location.href="joinDocumentApproval.ap";
			}else {
				return false;
			}
			
		}
		function reject() {
			if(window.confirm("반려 하시겠습니까?") == true) {
				location.href="joinDocumentApproval.ap";
			}else {
				return false;
			}
		}
	</script>
</body>
</html>