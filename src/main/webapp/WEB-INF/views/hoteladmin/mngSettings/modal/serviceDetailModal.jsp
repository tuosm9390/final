<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	.modalDetail {
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
		height: 430px;
		max-height: 500px;
		background-color: white;
	}
	
	.modal_content_real {
		width: 800px;
		height: 430px;
		/* border:1px solid black; */
		margin: 0 auto;
		overflow: auto;
	}
	
	.btn_close {
		position: absolute;
		top: 0%;
		left: 95%;
		font-size: 40px;
		float: right;
		color: darkgray;
	}
	
	.btn_close:hover {
		cursor: pointer;
	}
	.titleArea{
		padding-top:15px;
		padding-left:15px;
		width:785px;
		height:40px;
		background:royalblue;
		color:white;
	}
	.addServiceArea{
		margin-top:40px;
		text-align:center;
	}
	.addServiceArea tr{
		height:50px;
	}
	.addServiceArea select{
		margin-top:4px;
		margin-left:10px;
		width:300px;
		height:30px;
	}
	.addServiceArea input[type=text]{
		width:300px;
		height:30px;
		margin-left:10px;
		border-radius:5px;
		border:1px solid lightgray;
		
	}
	.saveServiceBtn{
		width:100px;
		height:30px;
		background:#3498DB;
		color:white;
		border:0;
		cursor:pointer;
	}
</style>
</head>
<body>
	<div class="modalDetail">
		<div class="modal_content">
			<div class="titleArea">
				<h2 style="margin:0 auto;">서비스 정보</h2>
				<a class="btn_close">×</a>
			</div>
			<div class="modal_content_real">
			<form action="updateService.st" method="post">
				<table align="center" class="addServiceArea">
					<tr>
						<td>* 서비스 코드</td>
						<td><input type="text" name="svcCode" class="serviceCodeDetailModal" readonly="readonly"></td>
					</tr>
					<tr>
						<td>* 서비스 명</td>
						<td><input type="text" name="svcName" class="serviceNameDetailModal" readonly="readonly"></td>
					</tr>
					<tr>
						<td>* 판매 금액</td>
						<td><input type="text" name="svcPrice" class="servicePriceDetailModal"></td>
					</tr>
					<tr>
						<td>* 매출 구분</td>
						<td>
							<select name="salesType" class="serviceTypeDetailModal" disabled="disabled">
								<option value="">==선택==</option>
								<option value="ADDTIME">시간추가</option>
								<option value="ETC">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>사용</td>
						<td><input type="radio" id="usedDetailModal" name="svcStatus" class="serviceUsingDetailModal" value="Y"><label for="used">사용</label><input  value="N" class="serviceUsingDetailModal" type="radio" id="noUseDetailModal" name="svcStatus"><label for="noUse">아니오</label></td>
					</tr>
					<tr>
						<td colspan="2"><button class="saveServiceBtn" onclick="return updateService();">저장</button></td>
					</tr>
				</table>
			</form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modalDetail").fadeOut();
			});
		});
	</script>
</body>
</html>