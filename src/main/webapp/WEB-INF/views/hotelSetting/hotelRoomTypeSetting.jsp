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
	.contentArea{
		width:1600px;
		height:800px;
	}
	.menubar{
		height:800px;
	}
	.Area2{
		font-weight: bold;
	}
	.rightArea{
		float:right;
		width:1290px;
		margin-left:10px;
	}
	.titleArea{
		width:1230px;
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
	.noticeTextArea{
		float:left;
		margin-left:10px;
	}
	.btnGroupArea{
		float:right;
	}
	.tableArea{
		width:1200px;
		height:450px;
		text-align:center;
		border:1px solid black;
		overflow-y: scroll;
		overflow-x: hidden;
	}
	.roomTable{
		width:1200px;
	}
	.contentArea2{
		width:1200px;
		margin-left:30px;
	}
	th{
		background-color: #f7f7f7;
		color: #005B9E;
	}
	tr{
		height:40px;
		border: 1px solid lightgray;
		text-align: center;
	}
	input{
		border:none;
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
	.tableBtn{
		width:100px;
		height:30px;
		border-radius:5px;
		border:0;
		background-color: #3498DB;
   		color: white;
	}
</style>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">§ 객실 타입 설정</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">전체 객실의 타입을 설정해주세요.</h6>
				</div>
			</div>
			
			<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:10px; ">객실 타입</h3>
				<div style="margin-top:-9px;">
					<div class="noticeTextArea">
						<label>※ 객실 타입은 추후 수정 및 삭제가 불가능 합니다.</label>
					</div>
					<div class="btnGroupArea">
						<button class="tableBtn" onclick="addRoomType();">+ 추가</button>
						<button class="tableBtn" onclick="deleteRoomType();">- 삭제</button>
					</div>
				</div>
				<!-- 위끝 -->
				<br>
				<br>
				<div class="tableArea">
					<table border="1" class="roomTable" style="border-collapse: collapse;">
						<tr class="thArea">
							<th width="5%"><input type="checkbox"></th>
							<th width="40%">객실 타입</th>
							<th width="15%">최소 인원</th>
							<th width="15%">최대 인원</th>
							<th width="15%">객실 요금</th>
						</tr>
					</table>
				</div>
				<br>
			<div align="right">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick=""><b>다음</b></button>			
			</div>
			</div>
		</div><!-- 오른쪽영역 끝 -->
	</div>
	<script type="text/javascript">
		function addRoomType(){
			$("tbody:last").append("<tr><td><input type='checkbox'></td><td><input type='text' style='width:400px;height:30px;'></td><td><input type='number' min='1' value='1' max='20' style='text-align:center;'></td><td><input type='number' min='1' value='1' max='20' style='text-align:center;'></td><td><input type='text' style='width:100px;height:30px;'></td></tr>");
		};
		function deleteRoomType(){
			
		};
	</script>
</body>
</html>