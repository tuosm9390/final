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
.writeApprove {
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
	</header>
	<section>
	<jsp:include page="../approveModal/purchaseApproveModal.jsp"></jsp:include>
		<div class="writeApprove">
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


		</div>
	</section>
	<script>
		$(function() {
			$("#writeCategory").change(function() {
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
			})

		})
	</script>



</body>
</html>