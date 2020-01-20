<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.abtHotel {
	width: 1000px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	padding-top: 20px;
}

.title {
	margin-left: 20px;
	display: inline-block;
}

.txt {
	height: 30px;
}

.tblInfo {
	border-collapse: separate;
	border-spacing: 0 10px;
}
.tblInfo td {
	width:120px;
}

.txt2 {
	width: 631px;
	height:30px;
}
input[type=text] {
	border:1px solid lightgray;
	border-radius:3px;
}

h4 {
	color: #3498DB;
}
#plBtn {
	width:70px;
	height:36px;
	border:1px solid #3E9EFB;
	background:white;
}
#submitBtn {
	border:1px solid #3498DB;
	width:75px;
	height:35px;
	border-radius:3px;
	background:#060E33;
	color:white;
}
</style>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />
	<jsp:include page="../../common/settingMenubar.jsp" />

	<div class="abtHotel">
		<div class="title">
			<h2>호텔 정보</h2>


			<hr>
			<h4>기본정보</h4>
			<form action="" method="post">
			<table class="tblInfo">
				<tr>
					<td>호텔명</td>
					<td style="width: 400px">
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
					<td>대표자</td>
					<td style="width: 400px">
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td style="width: 400px">
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
					<td>전화번호</td>
					<td>
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
				</tr>
				<tr>
					<td>사업자명</td>

					<td style="width: 400px">
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
					<td>사업자번호</td>
					<td>
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 20px;">주소</td>
					<td colspan="3" style="padding-top: 20px;">
						<div class="ui input title">
							<input class="txt2" type="text">
						</div>
					</td>

				</tr>
				<tr>
					<td style="padding-top: 20px;">
						<h4>시스템정보</h4>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 20px;">입실시간</td>
					<td style="padding-top: 20px;" style="width:400px;">
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
					<td style="padding-top: 20px;">퇴실시간</td>
					<td style="padding-top: 20px;">
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
				</tr>
				<tr>
					<td>대실시간</td>
					<td style="width: 400px;">
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
					<td>봉사료</td>
					<td>
						<div class="ui input title">
							<input class="txt" type="text">
						</div>
					</td>
				</tr>
				<tr>
					<td>정산/역산</td>
					<td style="width: 400px;">
						<div class="ui input title">
							<input class="txt" type="text" placeholder="부가세 포함">
						</div>
					</td>
					<td>자동마감시간</td>
					<td>
						<div class="ui input title">
							<input class="txt" type="text" placeholder="12:00AM">
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 30px; width:200px;">챗봇 연동 여부</td>
					<td style="padding-top: 32px;" colspan="2">
						<div class="ui input title">
							<input type="radio" name="chatBot"><label>예</label>
						</div>
						<div class="ui input title">
							<input type="radio" name="chatBot"><label>아니오</label>
						</div>
					</td>
					

				</tr>
				<tr>
					<td style="padding-top: 20px;">호텔정책</td>
					<td colspan="3" style="padding-top: 20px;">
						<div class="ui input title">
							<input class="txt2" type="text">
						</div>
					</td>

				</tr>
				<tr>
					<td style="padding-top: 20px;">노쇼정책</td>
					<td colspan="3" style="padding-top: 20px;">
						<div class="ui input title">
							<input class="txt2" type="text">
						</div>
					</td>

				</tr>
				<tr>
					<td style="padding-top: 20px;">취소정책</td>
					<td colspan="3" style="padding-top: 20px;">
						<div class="ui input title">
							<input class="txt2" type="text">
						</div>
						<button type="button" style="margin-left:20px;" id="plBtn">+ 추가</button>
					</td>
					

				</tr>

			</table>
			<button id="submitBtn">저장</button>
			</form>

			<!-- second table -->


		</div>
	</div>
	<br><br><br><br><br><br><br><br>
<script>
	$(function(){
		$("#plBtn").click(function(){
		
			var plusTable = "<tr>";
			plusTable += "<td style='padding-top: 20px;'>취소정책</td>"
			plusTable += "<td colspan='3' style='padding-top: 20px;'> <div class='ui input title'> <input class='txt2' type='text'></div></td>"
			plusTable += "</tr>"
			var n = $(".tblInfo");
			
			
			n.append(plusTable);
		});
		
		$("#submitBtn").click(function(){
			window.confirm("저장 되었습니다.");
		});
	});
</script>

</body>
</html>