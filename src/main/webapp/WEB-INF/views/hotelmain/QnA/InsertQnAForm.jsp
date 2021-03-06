<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels Boutique</title>
<style>
.site-outer-box {
	display: inline-flex;
	width: 100%;
}

.left-section {
	padding: 1px;
	position: fixed;
	width: 38%;
	border-right: 1px solid black;
}

.right-section {
	position: absolute;
	left: 40%;
	padding: 10px;
	padding-left: 15px;
	width: 56%;
}

.qnaDetail-table tr, .answer-table tr{
	height: 50px;
	font-size: 18px;
}

.qnaDetail-table tr td:first-child, .qnaDetail-table tr td:nth-child(3), .answer-table tr td:first-child{
	font-weight: bold;
	padding-right: 20px;
}

.qnaDetail-table tr td:nth-child(2) {
	width: 300px;
}

textarea{
	height: auto !important;
	outline-style: none;
}

.qtype{
	font-size: 14px !important;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<!-- 내용 영역 -->
		<div class="site-outer-box">
			<!-- 왼쪽 이미지 영역 -->
			<div class="left-section">
				<div class="left-section-img-item">
					<img src="${ contextPath }/resources/images/hotel.png" style="width: 100%; height: 100%;">
				</div>
			</div>
			<!-- 왼쪽 이미지 영역 끝 -->
			
			<!-- 오른쪽 내용 영역 -->
			<div class="right-section">
				<p
					style="font-style: normal; font-weight: bold; font-size: 32px; line-height: 42px; text-decoration: underline;">문의 등록</p>
				<br><br>
				
				<!-- 내용 영역 -->
				<form id="insertQnAForm" action="goQnAInsert.hmain" method="post">
					<table class="qnaDetail-table">
						<tr>
							<td><li>문의유형</li></td>
							<td>
								<select name="qtype" class="qtype">
									<option value="ROOM">객실</option>
									<option value="SERVICE">서비스</option>
									<option value="RESERVE">예약</option>
									<option value="ETC">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><li>작성자명</li></td>
							<td><input type="text" name="userName"></td>
						</tr>
						<tr>
							<td><li>제목</li></td>
							<td><input type="text" name="qtitle"></td>
							<td><label style="font-size: 16px;"><input
									type="checkbox" id="pwdCheck"
									style="width: 19px; height: 19px; vertical-align: top; margin-top: 0px;">
									비밀글 </label></td>
							<input type="hidden" id="pwdStatus" name="pwdStatus" value="N">
						</tr>
						<tr>
							<td><li>이메일</li></td>
							<td colspan="3">
								<input type="text" id="email" name="email">
							</td>
						</tr>
						<tr>
							<td><li>비밀번호</li></td>
							<td><input type="password" id="qpwd" name="qpwd" class="qpwd" style="display: none;"></td>
						</tr>
						<tr>
							<td style="vertical-align: top; padding-top: 5px;"><li>문의 내용</li></td>
							<td colspan="10" style="padding-top: 5px;"><textarea rows="7" cols="70" name="qcontent"></textarea>
						</tr>
					</table>
				</form>
				<!-- 내용 영역 끝 -->
				<br>
				<button style="float: right; width: 100px; margin-left: 20px; margin-right: 95px;" onclick="complete();">완료</button>
				<button style="float: right; width: 100px;"onclick="location.href='goQnA.hmain'">취소</button>
			</div>
			<!-- 오른쪽 내용 영역 끝 -->
		</div>
		<!-- 내용 영역 끝 -->
	</section>
	<footer>
	</footer>
	<script>
		$("#pwdCheck").click(function(){
			if($(this).prop("checked") == true){
				$("#pwdStatus").val("Y");
				$(".qpwd").css("display", "block");
			} else {
				$("#pwdStatus").val("N");
				$(".qpwd").css("display", "none").val('');
			};
		});
		
		function complete(){
			$("#insertQnAForm").submit();
// 			window.alert("작성이 완료되었습니다.");
		};
	</script>
</body>
</html>