<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
/*  .writeApprove {
	width: 1200px;
	height: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: -24px;
	text-align: center;
}

#writeCategory {
	margin-top: 20px;
	width: 80px;
	height: 40px;
	margin-left: auto;
}

.tbl_wrap {
	
}

.formsArea {
	margin-top: -70px;
}
.emptyArea {
	width:1000px;
	height:400px;
	background:#F7F7F7;
	margin-left:133px;
	margin-top:50px;
	border-style:dashed;
}  */
.mainArea {
	width: 1200px;
	border: 1px sold black;
	border: 1px solid black;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}

.div {
	display: inline-block;
	height: 500px;
	width: 400px;
	border-right: 1px solid black;
}

.div:last-child {
	border-right: 0px;
}

.docuTitle {
	text-align: center;
}

#img1 {
	width: 400px;
	height: 500px;
}
#docuTblArea {
	border-collapse:collapse;
	border:1px solid lightgray;
	width:1200px;
	height:500px;
	margin-left:auto;
	margin-right:auto;
}
#docuTblArea th, td {
	border-right:1px solid lightgray;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>

<title>HotelsCompile</title>
</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
		<jsp:include page="../approveModal/purchaseApproveModal.jsp"></jsp:include>
	</header>
	<section>
		<!-- <div class="docuTitle">
		<h2>문서 작성하기</h2>
	</div>
	 <div class="mainArea">
		<div class="div">	
			
		</div>
		<div class="div"></div>
		<div class="div"></div>
	</div>   -->

		<div class="docuTitle">
		<h2>기안서 작성</h2>
			<table id="docuTblArea">
				<colgroup>
					<col width="33%">
					<col width="33%">
					<col width="33%">
				</colgroup>
				<tr style="border-bottom:1px solid lightgray; height:70px;">
				<input type="hidden" value="${sessionScope.loginUser.deptNo }" id="deptNo">
				<input type="hidden" value="${sessionScope.loginUser.authNo }" id="authNo">
				<input type="hidden" value="${sessionScope.loginUser.mno }" id="userMno">
					<th>구매 요청서</th>
					<th>발주 요청서</th>
					<th>수리 요청서</th>
				</tr>
				<tr id="docuTit">
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>

		<%-- <div class="writeApprove">
			<div>
				<label>문서 유형을 선택해주세요.</label> <br>
				 <select id="writeCategory">
					<option selected disabled hidden>문서 선택</option>
					<option value="purchase">구매 요청서</option>
					<option value="order">발주 요청서</option>
					<option value="fix">수리 요청서</option>
				</select>
				<div class="emptyArea">
					
				</div>
			</div>
			
			
			 <div class="formsArea">
			
				<div id="formFix" style="display: none;">
					<jsp:include page="writerFixApprove.jsp" />
				</div>
				<div id="formPurchase" style="display: none;">
					<jsp:include page="writerPurchaseApprove.jsp" />
				</div>
				<div id="formOrder" style="display: none;">
					<jsp:include page="writerOrderApprove.jsp" />
				</div>


			</div> 


		</div>   --%>
	</section>
	<script>
		$(function() {
			/* $("#writeCategory").change(function() {
				var va = $(this).val();
				if (va == 'purchase') {
					console.log("??");
					$("#formPurchase").show();
					$("#formFix").hide();
					$("#formOrder").hide();
					$(".emptyArea").hide();

				} else if (va == 'order') {
					$("#formPurchase").hide();
					$("#formFix").hide();
					$("#formOrder").show();
					$(".emptyArea").hide();
				} else {
					$("#formPurchase").hide();
					$("#formFix").show();
					$("#formOrder").hide();
					$(".emptyArea").hide();
				}
			}) */
				
					$("#docuTit").children().eq(0).click(function(){
						if($("#deptNo").val() == 2 && $("#authNo").val() == "AUTH1") {
							
							console.log($("#deptNo").val());
							
							location.href="writePurchaseApprove.ap";
							
						}else {
							alert("작성하실 수 없습니다.");
							return false;
						}
					});
					$("#docuTit").children().eq(1).click(function(){
						
						if($("#deptNo").val() == 2 && $("#authNo").val() == "AUTH2") {
							
						location.href="writeOrderApprove.ap"
						}else {
							alert("작성하실 수 없습니다.");
							return false;
						}
						
					});
					$("#docuTit").children().eq(2).click(function(){
						
						if($("#deptNo").val() == 3 && $("#authNo").val() == "AUTH2") {
							
						location.href="writeFixApprove.ap"
						}else {
							alert("작성하실 수 없습니다.");
							return false;
						}
						
					});
				
				

		})
	</script>



</body>
</html>