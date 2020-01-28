<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modal_repair {
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
	width: 1000px;
	height: 670px;
	background-color: white;
	margin-top:50px;
}

.modal_content_real {
	width: 870px;
	height: 100%;
	margin: 0 auto;
	margin-top:20px;
	overflow-y:scroll;
	max-height:500px;
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
	height: 600px;
	max-height: 500px;
	height:100%;
}

#tbl_modal_repair {
	padding-top: 10px;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	height:auto;
}

#tbl_modal_repair td {
	height: 30px;
	border: 1px solid black;
}

#tbl_modal_repair td:last-child {
	border-right: 0px;
}

#tbl_modal_repair td:fisrt-child {
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


.approveBtn button {
	height:30px;
	width:100px;
	border-radius:5px;
	background:#E5E5E5;
	border:0px;
}
.btn_close_plus {
   position: absolute;
   top: -1%;
   left: 95.5%;
   font-size: 40px;
   float: right;
   color: white;
}

.btn_close_plus:hover {
   cursor: pointer;
}

.titleBarplus {
   padding-top: 10px;
   padding-bottom: 10px;
   color: white;
   background-color: royalblue;
}

.titleBarplus h1 {
   margin-top: 0;
   margin-bottom: 0;
   margin-left: 10px;
}

</style>
</head>
<body>
	<div class="modal_repair">
		<div class="modal_content">
			<div class="titleBarplus">
				<h1 style="text-align: left;">수리 요청서</h1>
			</div>
			<a class="btn_close_plus">×</a>
			<div class="modal_content_real">
			<div class="totalDiv">
					<div class="modal_tbl">
						<table id="tbl_modal_repair">
							<colgroup>
								<col width="10%">
								<col width="12%">
								<col width="25%">
								<col width="27%">
								<col width="13%">
								<col width="13%">

							</colgroup>
							<tr>
								<td>문서번호</td>
								<td colspan="2"></td>
								<td>부서장</td>
								<td colspan="2">총지배인</td>
							</tr>
							<tr>
								<td>기안부서</td>
								<td colspan="2"></td>
								<td rowspan="2"></td>
								<td rowspan="2" colspan="2"></td>
							</tr>
							<tr>
								<td>기안자</td>
								<td colspan="2"></td>

							</tr>
							<tr>
								<td>기안일</td>
								<td colspan="2"></td>
								<td rowspan="2" colspan="3"></td>

							</tr>
							<tr>
								<td>수신자</td>
								<td colspan="2"></td>



							</tr>
							<tr>
								<td>제목</td>
								<td colspan="5">수리 요청서</td>
							</tr>
							<tr style="background: lightgray;">
								<td>NO</td>
								<td>제품코드</td>
								<td>제품 명</td>
								<td>수리 업체명</td>
								<td>금액</td>
								<td>수리사유</td>
							</tr>
							<tr id="repeatRepair">
								<td>1</td>
								<td></td>
								<td>LG 36인치 TV</td>
								<td>2</td>
								<td>1000000</td>
								<td>2000000</td>
							</tr>
							<tr>
								<td colspan="2">총 금액</td>
								<td colspan="4" id="totalPrice" style="text-align:right;"></td>
							</tr>
							<tr id="content_repair">
								<td colspan="6" rowspan="6">
									<div class="txtArea">
										<!-- <a>아래와 같이 보고 하오니 검토후 재가 바랍니다.</a> <br> <br> <br>
										<br> <a>-아 래-</a><br> <br> <br> <a>SYSDATE</a>&nbsp;
										<a>OOOO</a> <a>목적으로 하여</a>&nbsp; <a>총금액 원</a> <a>사용을 결제하고자
											하오니 <br>검토후 재기하여 주시기 바랍니다.
										</a> -->

									</div>
								</td>
							</tr>

						</table>
			
				</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>

	<script>
		$(document).ready(function() {
			$(".btn_close_plus").click(function() {
				$(".modal_repair").fadeOut();
			});
		});
	</script>
</body>
</html>