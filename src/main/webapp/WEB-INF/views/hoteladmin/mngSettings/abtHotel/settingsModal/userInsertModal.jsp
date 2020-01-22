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
	z-index:2;
}

.modal_content {
	position: absolute;
    left: 50%;
    top: 45%;
    transform: translate(-50%, -50%);
    width: 865px;
    height: 459px;
    background-color: white;
    margin-top: 24px;
}

.modal_content_real {
	width: 870px;
	height: 100%;
	margin: 0 auto;
	margin-top: 20px;
	max-height: 500px;
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

/* .modalTbl {
	height: 600px;
	max-height: 500px;
	height:100%;
} */
#tbl_modal {
	padding-top: 10px;
	border: 1px solid black;
	text-align: center;
	width: 100%;
	height: auto;
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
#leftArea {
	height: 10px;
    margin-left: 30px;
    margin-top: 24px;
}
#leftArea td {
	height:20px;
	padding:10px;
}
input[type=text] {
	border:1px solid lightgray;
}

#rightTbl {
   background: white;
    width: 279px;
    height: 60px;
    margin-left: 511px;
    margin-top: -342px;
}
#rightTbl td {
	border-right:1px solid lightgray;
	border-bottom:1px solid lightgray;
}
#rightTbl td:firt-chile {
	boder-right:0px;
	border-bottom:0px solid white;
}
.rightAuth {
	margin-left:0px;
	position:relative;
	top:50px;
}
#submit {
	margin-left: 750px;
    margin-top: 211px;
    border-radius:2px;
    background:#3498DB;
    border:1px solid #3498DB;
    color:white;
    height:30px;
    width:70px;
}

</style>
</head>
<body>
	<div class="modal">
		<div class="modal_content">
			<div class="titleBarplus">
				<h1 style="text-align: left;">사용자 추가</h1>
			</div>
			<a class="btn_close_plus">×</a>
			<div class="modal_content_real">
				<div class="modalTbl">
					<div class="leftTbl">
						<table id="leftArea">
							<tr>
								<td>사용자 ID</td>
								<td><input type="text" name="" id=""></td>
								<td><button type="button" onclick="" id="overlap">중복확인</button></td>
							</tr>
							<tr>
								<td>사용자명</td>
								<td colspan="2"><input type="text" name="" id="" style="width:250px;"></td>
							</tr>
							<tr>
								<td>전화</td>
								<td colspan="2"><input type="text" name="" id="" style="width:250px;"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="2"><input type="text" name="" id="" style="width:250px;"></td>
							</tr>
							<tr>
								<td>부서</td>
								<td colspan="2">
									<select>
										<option selected disabled hidden>==선택==</option>
										<option>프론트</option>
										<option>구매팀</option>
										<option>시설/관리팀</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>사용</td>
								<td>
									<input type="radio" id="" name="use"><label> 예</label>
									<input type="radio" id="" name="use"><label> 아니오</label>
								</td>
							</tr>
						</table>
						<div class="rightAuth">
						
							<table id="rightTbl">
							<tr>
								<td colspan="3" style="border-right:0px; border-bottom:0px;"><h4>사용자 권한</h4></td>
							</tr>
							<tr style="text-align:center;">
								<td colspan="3"></td>
							</tr>
								<tr style="background:lightgray; text-align:center;">
									<td></td>
									<td colspan="2" style="border-right:0px;">권한명</td>
								</tr>
								<tr style="text-align:center;">
									<td><input type="radio" name="auto" id=""></td>
									<td>부서원</td>
									<td style="border-right:0px;">권한보기</td>
								</tr>
								<tr style="text-align:center;">
									<td>
										<input type="radio" name="auto" id="">
									</td>
									<td>
										부서원
									</td>
									<td style="border-right:0px;">권한보기</td>
								</tr>
							</table>
							</div>
							<button id="submit" onclick="">저장</button>
							</div>
							
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<script>
		$(document).ready(function() {
			$(".btn_close_plus").click(function() {
				$(".modal").fadeOut();
			});
		});
	</script>
</body>
</html>