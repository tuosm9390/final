<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.roomMainPhotoArea h3{
		margin-top:85px;
	}
	.room{
		margin-top:10px;
		display: flex;
	}
	.imageBtn{
		width:75px; 
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>HotelsCompile</title>
</head>
<body>
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
			<div class="room">
				<div class="roomArea">
					<div class="roomTitleArea">
						<h3>디럭스</h3>
					</div>
					<button class="addBtn" onclick="addImages();">+ 추가</button>
				</div>
				<div class="roomMainPhotoArea">
					<h3>대표이미지</h3>
					<input type="file" class="imageBtn">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function addImages(){
			
			$(".roomMainPhotoArea:last").after("<div class='roomMainPhotoArea'> <h3>객실이미지</h3> <input type='file' class='imageBtn'>");
			
		}
	</script>
</body>
</html>