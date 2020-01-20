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
	width: 800px;
	height: auto;
	max-height: 1000px;
	border: 0px solid white;
	background-color: white;
	/* overflow-y: auto; */
}

.modal_content_real {
	width: 780px;
	height: 450px;
	margin: 0 auto;
	overflow: auto;
}

.btn_close {
	position: absolute;
	top: -2%;
	left: 96.5%;
	font-size: 40px;
	float: right;
}

.btn_close:hover {
	cursor: pointer;
}

.modal_content_real {
	margin-top: 20px;
}

.tit_Area {
	background: #060E33;
	color: white;
	height: 50px;
	margin-top: -20px;
}

#tbl_modal {
	width: 50% px;
	margin-left: 60px;
}

#tbl_modal td {
	padding: 10px;
}

input[type=text] {
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 25px;
}

.emptyDiv {
	width: 500px;
	height: 50px;
}

#idBtn {
	border-radius: 2px;
	border: 1px solid #060E33;
	background: white;
	height: 30px;
	width: 70px;
}

.secTable {
	border: 1px solid black;
	width: 280px;
	height: 200px;
	float: right;
	margin-right: 10px;
	margin-top: -377px;
}

#secTbl {
	margin-left:5px;
	width:270px;
	border-top:1px solid lightgray;
	border-bottom:1px solid lightgray;
	text-align:center;
}

#secTbl td:not (:last-child) {
}
#secTbl td {
	border-right:1px solid lightgray;
	border-bottom:1px solid lightgray;
}
#secTbl td:first-child {
	border-left:1px solid lightgray;
}
.autoBtn1 {
	position:relative;
	border-radius:5px;
	border:1px solid black;
	
}
.autoBtn2  {
	border-radius:5px;
	border:1px solid gray;
	color:black;
	background:white;
}
input[type=checkbox] {
	background:white;
}
#submt {
	border-radius:2px;
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	width:70px;
	height:30px;
	margin-top:30px;
	margin-left:70px;
}
div.autoBtn1 {
	position:relative;
	display:inline-block;
}
div.autoBtn1 span.tooltiptext {
	visibility:hidden;
	width:120px;
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
div.autoBtn1 span.tooltiptext::after {
	content:"";
	position:absolute;
	top:100%;
	left:50%;
	
}
div.autoBtn1:hover span.tooltiptext {
	visibility:visible;
}

div.autoBtn2 {
	position:relative;
	display:inline-block;
}
div.autoBtn2 span.tooltiptext2 {
	visibility:hidden;
	width:120px;
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
div.autoBtn2 span.tooltiptext2::after {
	content:"";
	position:absolute;
	top:100%;
	left:50%;
	
}
div.autoBtn2:hover span.tooltiptext2 {
	visibility:visible;
}
</style>
</head>
<body>
	<div class="modal">
		<div class="modal_content">
			<a class="btn_close" style="color: white;">×</a>
			<div class="tit_Area">
				<h2>사용자 추가</h2>
			</div>
			<div class="modal_content_real">

				<div class="modalTbl">
				<form action="insertMember.me" method="post">
						<table id="tbl_modal">
							<tr>
								<td>사용자 ID</td>
								<td><input type="text" class="userId" name="userId"></td>
								<td><button type="button" onclick="idCheck();" id="idBtn">중복확인</button></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td colspan="2"><input type="password" class="userPwd" name="userPwd" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td colspan="2"><input type="password" class="userPwd2" name="userPwd2" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>사용자명</td>
								<td colspan="2"><input type="text" class="userNames" name="userName" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>전화</td>
								<td colspan="2"><input type="tel" name="phone" class="phone" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="2"><input type="email" name="email" class="email" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>부서</td>
								<td>
									<select name="deptNo" class="deptNo">
										<option value="">== 선택 ==</option>
										<option value="2">구매팀</option>
										<option value="3">시설/관리팀</option>
										<option value="4">프론트</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>사용</td>
								<td>
								<input type="radio" name="status" class="use" id="yes" value="Y"><label for="yes">예</label>
								<input type="radio" name="status" class="use" id="no" value="N"><label for="no">아니오</label></td>
							</tr>
						</table>
						<button type="submit" onclick="return insertMember();">저장</button>
						<div class="secTable">
							<h4 style="margin-left:10px;">사용자 권한</h4>
							<table id="secTbl">
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
									<td><input type="radio" id="deptMember" name="authNo" value="AUTH1" class="authority"></td>
									<td style="float:right"><label for="deptMember">부서원</label></td>
									<td><div class="autoBtn1">권한보기<span class="tooltiptext">결재신청가능<br>사용자 추가 등록 불가</span></div></td>
								</tr>
								<tr>
									<td><input type="radio" id="deptHeader" name="authNo" value="AUTH2" class="authority"></td>
									<td style="float:right"><label for="deptHeader">부서장</label></td>
									<td><div class="autoBtn2">권한보기<span class="tooltiptext2">전자결재가능<br>사용자 추가 등록 불가</span></div></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<div class="emptyDiv"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

<script>


	$(document).ready(function() {
		
		window.idCheckResult = false;
		
		$(".btn_close").click(function() {
			$(".modal").fadeOut();
		});
	});
	
	function idCheck() {

		var userId = $(".userId").val();

		if($(".userId").val() == ""){
			
			alert("아이디를 입력해주세요.");
			
		}else{
			$.ajax({
				url : "idCheck.me",
				type : "post",
				data : {
					userId : userId
				},
				success : function(data) {
					console.log(data);
	
					if (data === "success") {
						alert("중복된 아이디입니다.");
					} else {
						alert("사용가능한 아이디 입니다.");
						idCheckResult = true;
					}
				},
				error : function(data) {
	
				}
	
			});
		}
	}
	function insertMember() {

		if (idCheckResult == false) {
			alert("아이디 중복확인을 해주세요");
			return false;
		}

		var pwd1 = $(".userPwd").val();
		var pwd2 = $(".userPwd2").val();
		
		
		if (pwd1 != pwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}

		if ( $(".userNames").val() == "" ) {
			alert("이름을 입력해주세요");
			console.log($(".userNames").val());
			$(".userNames").focus();
			return false;
		}
		var regExpName = /^[가-힣]{2,}/;
		if (!regExpName.test($(".userNames").val())) {
			alert("이름을 다시 입력해주세요");
			$(".userName").focus();
			$(".userName").select();
			return false;
		}

		if ($(".phone").val() == "") {
			alert("전화번호를 입력해주세요.");
			$(".phone").focus();
			return false;
		}
		var regExpName = /^[0-9]{9,}/;
		if (!regExpName.test($(".phone").val())) {
			alert("전화번호를 다시 입력해주세요.");
			$(".phone").focus();
			$(".phone").select();
			return false;
		}
		if ($(".email").val() == "") {
			alert("이메일을 입력해주세요");
			$(".email").focus();
			return false;
		}
		var regExpEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		if (!regExpEmail.test($(".email").val())) {
			alert("이메일을 다시 입력해주세요");
			$(".email").focus();
			$(".email").select();
			return false;
		}
		if ($(".dept").val() == "") {
			alert("부서를 선택해주세요");
			return false;
		}
		if($(".use").prop("checked") == false){
			alert("사용여부를 선택해주세요.");
			return false;
		}

		if($(".authority").prop("checked") == false){
			alert("권한을 선택해주세요.");
			return false;
		}
		
		return true;
	}
</script>
</body>
</html>