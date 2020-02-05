<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.detailModal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 2;
}
.titleBarplus2 {
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	background-color: royalblue;
}

.titleBarplus2 h1 {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 10px;
}
.modal_content2 {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	width: 800px;
	height: auto;
	max-height: 1000px;
	border: 0px solid white;
	background-color: white;
	/* overflow-y: auto; */
}

.modal_content_real2 {
	width: 780px;
	height: 350px;
	margin: 0 auto;
	overflow: auto;
}

.btn_close2 {
	position: absolute;
	top: -2%;
	left: 96.5%;
	font-size: 40px;
	float: right;
}

.btn_close2:hover {
	cursor: pointer;
}

.modal_content_real2 {
	margin-top: 20px;
}

.tit_Area2 {
	background: #060E33;
	color: white;
	height: 50px;
	margin-top: -20px;
}

#tbl_modal2 {
	width: 50% px;
	margin-left: 60px;
}

#tbl_modal2 td {
	padding: 10px;
}

input[type=text] {
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 25px;
}
input[type=tel] {
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 25px;
}
input[type=email] {
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 25px;
}

.emptyDiv2 {
	width: 500px;
	height: 50px;
}

#idBtn2 {
	border-radius: 2px;
	border: 1px solid #060E33;
	background: white;
	height: 30px;
	width: 70px;
}

.secTable2 {
	width: 280px;
	height: 200px;
	float: right;
	margin-right: 50px;
	margin-top: -305px;
}

#secTbl2 {
	margin-left:5px;
	width:270px;
	border-top:1px solid lightgray;
	border-bottom:1px solid lightgray;
	text-align:center;
}

#secTbl2 td:not (:last-child) {
}
#secTbl2 td:first-child {
	border-left:1px solid lightgray;
}
.autoBtn12 {
	width:60px;
	height:18px;
	position:relative;
	border-radius:5px;
	border:1px solid black;
	
}
.autoBtn22 {
	width:60px;
	height:18px;
	border-radius:5px;
	border:1px solid black;
	color:black;
	background:white;
}
input[type=checkbox] {
	background:white;
}
#submt2 {
	border-radius:2px;
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	width:70px;
	height:30px;
	margin-top:30px;
	margin-left:70px;
}
div.autoBtn12 {
	position:relative;
	display:inline-block;
}
div.autoBtn12 span.tooltiptext {
	visibility:hidden;
	width:180px;
	background:black;
	color:white;
	text-align:center;
	border-radius:6px;
	position:absolute;
	z-index: 1;
	transform:translate(-50%, -50%);
	bottom:100%;
	left:50%;
}
div.autoBtn12 span.tooltiptext::after {
	cursor:pointer;
	content:"";
	position:absolute;
	top:90%;
	left:50%;
	cursor:pointer;
	
}
div.autoBtn12:hover span.tooltiptext {
	visibility:visible;
	cursor:pointer;
}

div.autoBtn22 {
	position:relative;
	display:inline-block;
}
div.autoBtn22 span.tooltiptext2 {
	visibility:hidden;
	width:180px;
	background:black;
	color:white;
	text-align:center;
	border-radius:6px;
	position:absolute;
	z-index: 1;
	transform:translate(-50%, -50%);
	bottom:100%;
	left:50%;
}
div.autoBtn22 span.tooltiptext2::after {
	content:"";
	position:absolute;
	top:90%;
	left:50%;
	cursor:pointer;
}
div.autoBtn22:hover span.tooltiptext2 {
	visibility:visible;
	cursor:pointer;
}
.submitBtn2{
	background:#3498DB;
	color:white;
	font-weight: bold;
}
.submitBtn2:hover{
	background:#060E33;
	color:white;
	font-weight: bold;
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="detailModal">
		<div class="modal_content2">
			<a class="btn_close2" style="color: white;">×</a>
			<div class="titleBarplus2">
				<h1 style="text-align: left;">사용자 정보</h1>
			</div>
			<div class="modal_content_real2">

				<div class="modalTbl2">
				<form action="updateStaff.st" method="post">
						<table id="tbl_modal2">
							<tr>
								<td>사용자 ID <input type="hidden" value="" class="mnoStaffDetailModal" name="mnoStaffDetailModal"></td>
								<td colspan="2"><input type="text" class="userIdStaffDetailModal" name="userIdStaffDetailModal" style="width:250px;" readonly="readonly"></td>
							</tr>
							<tr>
								<td>사용자명</td>
								<td colspan="2"><input type="text" class="userNameStaffDetailModal" name="userNameStaffDetailModal" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>전화</td>
								<td colspan="2"><input type="tel" name="phoneStaffDetailModal" class="phoneStaffDetailModal" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="2"><input type="email" name="emailStaffDetailModal" class="emailStaffDetailModal" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>부서</td>
								<td>
									<select name="deptNoStaffDetailModal" class="deptNoStaffDetailModal">
										<option value="" class="">== 선택 ==</option>
										<option value="2" class="buyerDept">구매팀</option>
										<option value="3" class="settingDept">시설/관리팀</option>
										<option value="4" class="frontDept">프론트</option>
										<option value="1" class="masterDept" style="visibility: hidden;">총지배인</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>사용</td>
								<td>
								<input type="radio" name="statusStaffDetailModal" class="useStaffDetailModal" id="yes" value="Y"><label for="yes">예</label>
								<input type="radio" name="statusStaffDetailModal" class="useStaffDetailModal" id="no" value="N"><label for="no">아니오</label></td>
							</tr>
						</table>
						<input type="hidden" class="userPwd" name="userPwd" value="0000" style="width: 250px;">
						<div class="secTable">
							<h4 style="margin-left:10px;">사용자 권한</h4>
							<table id="secTbl2">
								<colgroup>
									<col width="30%">
									<col width="35%">
									<col width="35%">
								</colgroup>
								<tr style="background:#F3F3F3;">
									<td></td>
									<td colspan="2" >권한명</td>
								</tr>
								<tr>
									<td><input type="radio" id="deptMember" name="authNoStaffDetailModal" value="AUTH1" class="authorityStaffDetailModal"></td>
									<td style="float:right"><label for="deptMember" style="border:0;">부서원</label></td>
									<td><div class="autoBtn12"><p style="margin:0;font-size:10px;">권한보기</p><span class="tooltiptext">결재신청가능<br>사용자 추가 등록 불가</span></div></td>
								</tr>
								<tr>
									<td><input type="radio" id="deptHeader" name="authNoStaffDetailModal" value="AUTH2" class="authorityStaffDetailModal"></td>
									<td style="float:right"><label for="deptHeader" style="border:0;">부서장</label></td>
									<td><div class="autoBtn22"><p style="margin:0;font-size:10px;">권한보기</p><span class="tooltiptext2">전자결재가능<br>사용자 추가 등록 불가</span></div></td>
								</tr>
							</table>
							<button type="submit" class="submitBtn2" style="margin-top:15px; margin-left:5px; width:100px;height:30px; border:0;" onclick="return updateMember();">정보 수정</button>
							<button type="button" class="submitBtn2" style="margin-top:15px; margin-left:5px; width:120px;height:30px; border:0;" onclick="return pwdReset();">비밀번호 초기화</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

<script>


	$(document).ready(function() {
		
		window.idCheckResult = false;
		
		$(".btn_close2").click(function() {
			$(".detailModal").fadeOut();
		});
	});

	function pwdReset(){
		
		var mno = $(".mnoStaffDetailModal").val();
		
		if(confirm("비밀번호를 초기화 시키시겠습니까?")){
			location.href="pwdReset.st?mno="+mno;
		}
		return false;
	}
</script>
</body>
</html>