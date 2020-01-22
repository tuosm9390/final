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
	margin-left:-100px;
}

.tblInfo td {
	padding:10px;
}

.txt2 {
	width: 590px;
	height: 30px;
}

input[type=text] {
	border: 1px solid lightgray;
	border-radius: 3px;
	height:23px;
}

h4 {
	color: #3498DB;
}

#plBtn {
	width: 70px;
	height: 25px;
	border: 1px solid #3E9EFB;
	background: white;
	color:#3E9EFB;
}

#submitBtn {
	border: 1px solid #3498DB;
	width: 85px;
	height: 30px;
	border-radius: 2px;
	background: #3498DB;
	color: white;
	
}
h2 {
	margin-top:-15px;
}

header {
	position: fixed;
}
.settingMenubarArea{
	margin-top:100px;
}
.hotelInfo {
	margin-top:10px;
	margin-left:-100px;
}
#plz {
	width:100px;
}
.btn {
	width:100px;
	margin-left:760px;
	margin-top:30px;
	
}
.tblInfo .plz {
	margin-top:-50px;
	padding:10px;
}
</style>

</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
			<jsp:include page="../../common/settingMenubar.jsp" />
	</header>

	<section>


		<div class="abtHotel">
			<div class="hotelInfo">
				<h2>호텔 정보</h2>


				<hr>
				<h4>기본정보</h4>
				<form action="" method="post">
					<table class="tblInfo">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="5%">
						<col width="20%">
						

					</colgroup>
					
						<tr>
							<td style="text-align:right;">* 호텔명</td>
							<td >
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
							
							<td style="width:30px;">* 대표자</td>
							<td >
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
							
							
						</tr>
						<tr>
							<td style="text-align:right;">* 이메일</td>
							<td >
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
							
							<td>* 전화번호</td>
							<td>
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
							
						</tr>
						<tr>
							<td style="text-align:right;">사업자명</td>

							<td >
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
							<td style="text-align:right;">주소</td>
							<td colspan="3">
								<div class="ui input title">
									<input class="txt2" type="text">
								</div>
							</td>

						</tr>
						</table>
						
						<h4 >시스템정보</h4>
						
						<table class="tblInfo plz">
						<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="5%">
						<col width="20%">
						

					</colgroup>
						<tr>
							<td style="padding-top: 20px; text-align:right;">* 입실시간</td>
							<td style="padding-top: 20px;" style="width:400px;">
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
							<td style="padding-top: 20px;">* 퇴실시간</td>
							<td style="padding-top: 20px;">
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align:right;">* 대실시간</td>
							<td >
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
							<td>* 봉사료</td>
							<td>
								<div class="ui input title">
									<input class="txt" type="text">
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align:right;">* 정산/역산</td>
							<td >
								<div class="ui input title">
									<input class="txt" type="text" placeholder="부가세 포함">
								</div>
							</td>
							<td>* 자동마감시간</td>
							<td>
								<div class="ui input title">
									<input class="txt" type="text" placeholder="12:00AM">
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align:right;" id="plz">* 챗봇 여부</td>
							<td style="colspan='2'">
								<div class="ui input title">
									<input type="radio" name="chatBot"><label>예</label>
								</div>
								<div class="ui input title">
									<input type="radio" name="chatBot"><label>아니오</label>
								</div>
							</td>


						</tr>
						<tr>
							<td style="text-align:right;">* 호텔정책</td>
							<td colspan="3" style="padding-top: 20px;">
								<div class="ui input title">
									<input class="txt2" type="text">
								</div>
							</td>

						</tr>
						<tr>
							<td style="text-align:right;">* 노쇼정책</td>
							<td colspan="3" style="padding-top: 20px;">
								<div class="ui input title">
									<input class="txt2" type="text">
								</div>
							</td>

						</tr>
						<tr>
							<td style="text-align:right;">* 취소정책</td>
							<td colspan="3" style="padding-top: 20px;">
								<div class="ui input title">
									<input class="txt2" type="text">
								</div>
								<button type="button" style="margin-left: 20px;" id="plBtn">+
									추가</button>
							</td>


						</tr>

					</table>
					<div class="btn">
					<button id="submitBtn">저장</button>
					</div>
				</form>

				<!-- second table -->


			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
		$(function() {
			$("#plBtn")
					.click(
							function() {

								var plusTable = "<tr>";
								plusTable += "<td style='padding-top: 20px;'>취소정책</td>"
								plusTable += "<td colspan='3' style='padding-top: 20px;'> <div class='ui input title'> <input class='txt2' type='text'></div></td>"
								plusTable += "</tr>"
								var n = $(".tblInfo");

								n.append(plusTable);
							});

			$("#submitBtn").click(function() {
				window.confirm("저장 되었습니다.");
			});
		});
	</script>

</body>
</html>