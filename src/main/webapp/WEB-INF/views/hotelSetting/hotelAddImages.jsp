<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.contentArea{
		width:1600px;
		height:900px;
	}
	.menubar{
		height:1000px;
	}
	.Area8{
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
	.roomTitleArea{
		width:70px;
		text-align:center;
		border-bottom-width: 4px;
		border-bottom-color: black;
		border-bottom-style: solid;
	}
	.roomTitleArea h3{
		margin-bottom:5px;
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
	}
	.roomMainPhotoArea{
		margin-left:10px;
		width:200px;
		height:200px;
		border:5px dashed darkgray;
		background:lightgray;
		text-align: center;
	}
	.roomSubPhotoArea{
		margin-left:10px;
		width:200px;
		height:200px;
		border:5px dashed darkgray;
		background:lightgray;
		text-align: center;
	}
	.roomMainPhotoArea h3{
		margin-top:15px;
	}
	.roomSubPhotoArea h3{
		margin-top:15px;
	}
	.room{
		margin-top:10px;
		display: flex;
	}
	.mainPhoto{
		width:75px; 
	}
	.subPhoto{
		width:75px; 
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
	}
	.btnGroup{
		padding-top:10px;
		border-top-color:lightgray;
		border-top-width:1px;
		border-top-style:solid;
		margin-top:30px;
		vertical-align: middle;
		margin-right:50px;
	}	
</style>
<title>HotelsCompile</title>
</head>
<body>
	<c:set var="roomType" value="${ sessionScope.roomTypeList }" />
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">객실 이미지 등록</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">객실 이미지를 등록할 수 있습니다. (대표이미지는 꼭 등록해주세요.)</h6>
				</div>
			</div>
			<form action="endHotelSetting.set" method="post" enctype="multipart/form-data">
			<c:forEach var="roomType" items="${ roomType }">
			<div class="area" id="${ roomType.rtName }">
				<div class="room">
					<div class="roomArea">
						<div class="roomTitleArea">
							<h3>${ roomType.rtName }</h3>
						</div>
						<button type="button" class="addBtn" onclick="addImages(this);" value="${ roomType.rtName }">+ 추가</button>
					</div>
					<div class="roomMainPhotoArea">
						<input type="hidden" value="${ roomType.rtName }" name="mainPhotoRoomTypeName">
						<img alt="" src="" name="" width="190" height="100">
						<h3>대표이미지</h3>
						<input type="file" name="mainPhoto" class="mainPhoto" onchange="loadImg(this);">
					</div>
				</div>
			</div>
			</c:forEach>
			<div align="right" class="btnGroup">
				<button type="button" class="backBtn" onclick=""><b>이전</b></button>			
				<button type="submit" class="nextBtn" onclick="return saveHotel();"><b>완료</b></button>			
			</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">

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
	
		function addImages(obj){
			
			roomType = obj.value;
			
			
			$("#"+roomType+" .roomMainPhotoArea:last").after("<div class='roomSubPhotoArea'><img alt='' src='' name='' width='190' height='100'><h3>객실이미지</h3><input type='file' name='subPhoto' class='subPhoto' onchange='loadImg(this);'><input type='hidden' value='"+roomType+"' name='subPhotoRoomTypeName'><button onclick='deleteArea(this);'>삭제</button>");
			
			$("#"+roomType+" .roomSubPhotoArea").each(function(){
				if($("#"+roomType+" .roomSubPhotoArea").length >= 4){
					$("#"+roomType+" .addBtn").attr("onclick", null);
				}
			});
			
		}
		
		function deleteArea(debtn){
			
			$(debtn).parent().remove();
			
		}
		function saveHotel(){
			
				$(".mainPhoto").each(function(){
					if($(this).val() == ""){
						alert("대표이미지를 등록해주세요");
						return false;
					}
				})
				$(".subPhoto").each(function(){
					if($(this).val() == ""){
						alert("객실이미지를 등록해주세요");
						return false;
					}
				})
			
			return true;
		}
	</script>
</body>
</html>