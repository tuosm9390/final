<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	body{
		overflow-x:hidden;
		overflow-y:hidden;
	}
	.menubar{
		height:900px;
	}
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
 		width:1260px;
		height:50px;
		border-bottom-style:solid;
		border-bottom-width:1px;
		border-bottom-color:black;
		margin-right:0;
		margin-left:10px;
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
		height:500px;
		border:1px solid black;
		overflow-x:hidden;
		overflow-y:scroll;
		margin-left:40px;
	}
	.serviceTable{
		width:1100px;
		border-collapse: collapse;
		text-align:center;
		border: 1px solid lightgray;
	}
	th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
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
	.addServiceBtn{
		width:100px;
		height:30px;
		border-radius:5px;
		border:0;
		background-color: #3498DB;
   		color: white;
   		margin-bottom:10px;
   		cursor:pointer;
   		margin-left:40px;
	}
	select{
		border:0;
	}
</style>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">§ 서비스 등록</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">객실에 제공하는 추가 서비스 품목과 요금을 등록하고 관리하세요.</h6>
				</div>
			</div>
			
			<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:40px; ">서비스 관리</h3>
			</div>
			
			<button class="addServiceBtn" onclick="return addService();">+ 서비스추가</button>
			<form action="goFormSettingPage.set" method="post">
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
						<td><input type="text" class="svcCode" name="svcCode" value="1HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="한시간추가"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">선택구분</option>
								<option value="ADDTIME" selected>시간추가</option>
								<option value="ETC">기타</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="2HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="두시간추가"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">선택구분</option>
								<option value="ADDTIME" selected>시간추가</option>
								<option value="ETC">기타</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="3HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="세시간추가"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">선택구분</option>
								<option value="ADDTIME" selected>시간추가</option>
								<option value="ETC">기타</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="4HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="네시간추가"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">선택구분</option>
								<option value="ADDTIME" selected>시간추가</option>
								<option value="ETC">기타</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="5HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="다섯시간추가"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">선택구분</option>
								<option value="ADDTIME" selected>시간추가</option>
								<option value="ETC">기타</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="6HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="여섯시간추가"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">선택구분</option>
								<option value="ADDTIME" selected>시간추가</option>
								<option value="ETC">기타</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
				</table>
			</div>
			<br>
			<div align="right" style="margin-right:160px;"> 
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick="return goHotelFormSetting();"><b>다음</b></button>			
			</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function addService(){
			
			$("tbody:last").append("<tr><td><input type='text' class='svcCode' name='svcCode'></td><td><input type='text' class='svcName' name='svcName'></td><td><select class='salesType' name='salesType'><option value=''>선택구분</option><option value='ADDTIME' selected>시간추가</option><option value='ETC'>기타</option></select></td><td><input type='text' class='svcPrice' name='svcPrice' value=''></td><td><button onclick='deleteService(this);'>x</button></td></tr>");
			
		}
		function deleteService(obj){
			
			$(obj).parent().parent().remove();
			
		}
		function goHotelFormSetting(){
			
			var temp = 0;
			
			$(".svcCode").each(function(){
				if($(this).val() == ""){
					alert("서비스 코드를 입력해주세요.")
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			$(".svcName").each(function(){
				if($(this).val() == ""){
					alert("서비스 명을 입력해주세요.")
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			$(".salesType").each(function(){
				if($(this).val() == ""){
					alert("서비스 타입을 선택해주세요");
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			$(".svcPrice").each(function(){
				if($(this).val() == ""){
					alert("서비스 금액을 입력해주세요");
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			
			var regExpPrice = /^[0-9]{1,}/;
			if (!regExpPrice.test($(".svcPrice").val())) {
				alert("숫자만 입력해주세요.");
				$(".svcPrice").focus();
				$(".svcPrice").select();
				return false;
			}
			
			
			if(temp == 0){
				return true;
			}else{
				return false;
			}
			
		}
	</script>
</body>
</html>