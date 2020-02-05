<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	.modalRoomDetail {
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
		height:500px;
		background-color: white;
	}
	
	.modal_content_real {
		width: 800px;
		height:500px;
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
	input[type=text]{
		width:130px;
		height:20px;
		margin-left:10px;
		border-radius:5px;
		border:1px solid lightgray;
	}
	input[type=number]{
		width:100px;
		height:20px;
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
	.addRoomTypeTable input{
		text-align:center;
	}
	.addBtn{
		width:60px;
		margin-top:2px;
		background:#DDEBFF;
		border:0;
	}
	.addBtn:hover{
		background:#060E33;
		color:white;
	}
	.roomArea{
		width:70px;
		text-align:center;
		height:auto;
	}
	.roomMainPhotoArea{
		margin-left:10px;
		width:120px;
		height:120px;
		border:5px dashed darkgray;
		background:lightgray;
		text-align: center;
	}
	.roomSubPhotoArea{
		margin-left:10px;
		width:120px;
		height:120px;
		border:5px dashed darkgray;
		background:lightgray;
		text-align: center;
	}
	.roomMainPhotoArea h3{
		margin-top:5px;
		margin-bottom:5px;
	}
	.roomSubPhotoArea h3{
		margin-top:5px;
		margin-bottom:5px;
	}
	.roomModal{
		margin-top:10px;
		display: flex;
	}
	.mainPhoto{
		width:75px; 
	}
	.subPhoto{
		width:75px; 
	}
	.roomTitleAreaModal{
		width:70px;
		text-align:center;
		border-bottom-width: 4px;
		border-bottom-color: black;
		border-bottom-style: solid;
	}
	.roomTitleAreaModal h3{
		margin-bottom:5px;
	}
	.area{
		margin-top:20px;
		margin-left:20px;
	}
	.addRoomTypeTable td{
		padding-left:50px;
	}
	.fareTable{
		width:760px;
		border-collapse: collapse;
		text-align:center;
		border: 1px solid lightgray;
	}
	.fareTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.roomFareTableArea{
		margin-top:10px;
		width:760px;
	}
	.fareTable input{
		width:60px;
		border:0;
	}
	.roomTypeAddBtn{
		cursor:pointer;
		width:150px;
		height:30px;
		border:0;
		background-color: #3498DB;
   		color: white;
	}
</style>
</head>
<body>
	<div class="modalRoomDetail">
		<div class="modal_content">
			<div class="titleArea">
				<h2 style="margin:0 auto;">객실 타입 추가</h2>
				<a class="btn_close">×</a>
			</div>
			<div>
				<div>
					<table class="addRoomTypeTable" align="center">
						<tr>
							<td>· 객실 타입<input type="text" name="rtName" class="rtName"></td>
							<td>· 하한 가격<input type="text" name="limitprc" class="limitprc"></td>
						</tr>
						<tr>
							<td>· 객실 기준 인원<input type="number" name="minPer" class="minPer"></td>
							<td>· 객실 최대 인원<input type="number" name="maxPer" class="maxPer"></td>
						</tr>
					</table>
				</div>
				<div class="area" id="">
					<div class="roomModal">
						<div class="roomArea">
							<div class="roomTitleAreaModal">
								<h3>객실사진</h3>
							</div>
							<button type="button" class="addImageBtn" onclick="addImages();" value="">+ 추가</button>
						</div>
						<div class="roomMainPhotoArea">
							<img alt="" src="" name="" width="110" height="50">
							<h3>대표이미지</h3>
							<input type="file" name="mainPhoto" class="mainPhoto" onchange="loadImg(this);">
						</div>
					</div>
						<div class="roomFareTableArea">
							<table class="fareTable" border="1">
								<tr>
									<th width="10%">구분</th>
									<th width="10%">타입</th>
									<th width="10%">월</th>
									<th width="10%">화</th>
									<th width="10%">수</th>
									<th width="10%">목</th>
									<th width="10%">금</th>
									<th width="10%">토</th>
									<th width="10%">일</th>
								</tr>
								<tr>
									<td rowspan="2">비성수기</td>
									<td>대실료</td>
									<td><input type="text" class="money" name="offRentMon"></td>
									<td><input type="text" class="money" name="offRentTue"></td>
									<td><input type="text" class="money" name="offRentWed"></td>
									<td><input type="text" class="money" name="offRentThu"></td>
									<td><input type="text" class="money" name="offRentFri"></td>
									<td><input type="text" class="money" name="offRentSat"></td>
									<td><input type="text" class="money" name="offRentSun"></td>
								</tr>
								<tr>
									<td>숙박료</td>
									<td><input type="text" class="money" name="offStayMon"></td>
									<td><input type="text" class="money" name="offStayTue"></td>
									<td><input type="text" class="money" name="offStayWed"></td>
									<td><input type="text" class="money" name="offStayThu"></td>
									<td><input type="text" class="money" name="offStayFri"></td>
									<td><input type="text" class="money" name="offStaySat"></td>
									<td><input type="text" class="money" name="offStaySun"></td>
								</tr>
								<tr>
									<td rowspan="2">성수기</td>
									<td>대실료</td>
									<td><input type="text" class="money" name="rentMon"></td>
									<td><input type="text" class="money" name="rentTue"></td>
									<td><input type="text" class="money" name="rentWed"></td>
									<td><input type="text" class="money" name="rentThu"></td>
									<td><input type="text" class="money" name="rentFri"></td>
									<td><input type="text" class="money" name="rentSat"></td>
									<td><input type="text" class="money" name="rentSun"></td>
								</tr>
								<tr>
									<td>숙박료</td>
									<td><input type="text" class="money" name="stayMon"></td>
									<td><input type="text" class="money" name="stayTue"></td>
									<td><input type="text" class="money" name="stayWed"></td>
									<td><input type="text" class="money" name="stayThu"></td>
									<td><input type="text" class="money" name="stayFri"></td>
									<td><input type="text" class="money" name="staySat"></td>
									<td><input type="text" class="money" name="staySun"></td>
								</tr>
							</table>
						</div>
					<div>
						<button class="roomTypeAddBtn" style="float:right; margin-right:30px; margin-top:20px;">등록하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function(){
			$(".btn_close").click(function() {
				$(".roomSubPhotoArea").remove();
				$(".fareTable td input").val("");
				$(".addRoomTypeTable td input").val("");
				$(".modalRoomDetail").fadeOut();
				
				
			});
			
			$(".minPer").each(function(){
			$(this).change(function(){
				$(this).parent().siblings().children(".maxPer").attr("min", $(this).val());
				$(this).parent().siblings().children(".maxPer").attr("value", $(this).val());
			});
		}) 
		});
		function addImages(){
			
			$(".roomMainPhotoArea:last").after("<div class='roomSubPhotoArea'><img alt='' src='' name='' width='110' height='50'><h3>객실이미지</h3><input type='file' name='subPhoto' class='subPhoto' onchange='loadImg(this);'><input type='hidden' value='' name='subPhotoRoomTypeName'><button onclick='deleteArea(this);'>삭제</button>");
			
			$(".roomSubPhotoArea").each(function(){
				if($(".roomSubPhotoArea").length >= 4){
					$(".addImageBtn").attr("onclick", null);
				}			
			});
			
			console.log($(".roomSubPhotoArea").length);
		}
		
		function deleteArea(debtn){
			
			$(debtn).parent().remove();
			
		}
		function loadImg(obj){
			
			console.log("ddd");
			/* 
			console.log($(obj).siblings("img"));
			
			var reader = new FileReader();
				
			reader.onload = function(e){
				$(obj).siblings("img").attr("src", e.target.result);
			}
			reader.readAsDataURL(e);
			 */
			if(obj.files && obj.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(e){
					$(obj).siblings("img").attr("src", e.target.result);
				};
				
				reader.readAsDataURL(obj.files[0]);
			}
		}
	</script>
</body>
</html>