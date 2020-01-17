<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.contentArea{
		width:1600px;
		height:900px;
	}
	.Area5{
		font-weight: bold;
	}
	.rightArea{
		float:right;
		width:1300px;
	}
	.titleArea{
		width:1300px;
		height:50px;
		border-bottom-style:solid;
		border-bottom-width:1px;
		border-bottom-color:black;
		margin-right:0;
	}
	.title{
		display:inline-block;
		text-align: center;
		height:30px;
		margin-left:10px;
	}
	.titleContent{
		display:inline-block;
		text-align: center;
		height:30px;
	}
	.titleText{
		margin:0;
	}
	.titleContentText{
		margin-bottom:0px;
	}
	.tableArea{
		width:1100px;
		height:700px;
		border:1px solid black;
		overflow-x:hidden;
		overflow-y:scroll;
	}
	.serviceTable{
		width:1100px;
		border-collapse: collapse;
		text-align:center;
	}
	.serviceTable th{
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
		height:30px;
	}
	.serviceCode{
		width:150px; 
	}
	.serviceName{
		width:300px;
	}
	input{
		border:none;
		text-align:center;
	}
	.nextBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border:0;
		color:#EAC064;
	}
	.nextBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
	.backBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border:0;
		color:#EAC064;
	}
	.backBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
</style>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">서비스 등록</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">객실에 제공하는 추가 서비스 품목과 요금을 등록하고 관리하세요.</h6>
				</div>
			</div>
			
			<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:10px; ">서비스 관리</h3>
			</div>
			
			<button onclick="return addService();">+ 서비스추가</button>
			<div class="tableArea">
				<table class="serviceTable" border="1">
					<tr>
						<th width="15%">서비스 코드</th>
						<th width="30%">서비스 명</th>
						<th width="20%">매출 구분</th>
						<th width="25%">금액</th>
						<th width="10%">삭제</th>
					</tr>
					<tr>
						<td><input type="text" class="serviceCode" value="1HH"></td>
						<td><input type="text" class="serviceName" value="한시간추가"></td>
						<td><input type="text" class="fareType" value="객실매출"></td>
						<td><input type="text" class="servicePrice" value="0"></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="serviceCode" value="2HH"></td>
						<td><input type="text" class="serviceName" value="두시간추가"></td>
						<td><input type="text" class="fareType" value="객실매출"></td>
						<td><input type="text" class="servicePrice" value="0"></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="serviceCode" value="3HH"></td>
						<td><input type="text" class="serviceName" value="세시간추가"></td>
						<td><input type="text" class="fareType" value="객실매출"></td>
						<td><input type="text" class="servicePrice" value="0"></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="serviceCode" value="4HH"></td>
						<td><input type="text" class="serviceName" value="네시간추가"></td>
						<td><input type="text" class="fareType" value="객실매출"></td>
						<td><input type="text" class="servicePrice" value="0"></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="serviceCode" value="5HH"></td>
						<td><input type="text" class="serviceName" value="다섯시간추가"></td>
						<td><input type="text" class="fareType" value="객실매출"></td>
						<td><input type="text" class="servicePrice" value="0"></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="serviceCode" value="6HH"></td>
						<td><input type="text" class="serviceName" value="여섯시간추가"></td>
						<td><input type="text" class="fareType" value="객실매출"></td>
						<td><input type="text" class="servicePrice" value="0"></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
				</table>
			</div>
			<br>
			<div align="center" style="margin-left:-100px;">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick=""><b>다음</b></button>			
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function addService(){
			
			$("tbody:last").append("<tr><td><input type='text' class='serviceCode' value=''></td><td><input type='text' class='serviceName' value=''></td><td><input type='text' class='fareType' value='객실매출'></td><td><input type='text' class='servicePrice' value='0'></td><td><button onclick='deleteService(this);'>x</button></td></tr>");
			
		}
		function deleteService(obj){
			
			$(obj).parent().parent().remove();
			
		}
	</script>
</body>
</html>