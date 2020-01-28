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
		height:900px;
	}
	.menubar{
		height:950px;
	}
	.Area6{
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
	.contentArea3{
		text-align: center;
	}
	.reservation{
		display: inline-block;
		text-align: center;
		width:300px;
		height:500px;
		background:lightgray;
		border:5px dashed gray;
	}
	.reservation h2{
		margin-top:250px;
	}
	.reservation:hover{
		cursor:pointer;
		background:darkgray;
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
	<jsp:include page="modal/reservModal.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">§ 양식 설정</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">예약 확정서 양식을 설정할 수 있습니다.</h6>
				</div>
			</div>
			
			<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:40px; ">문서양식</h3>
			</div>
			<div class="contentArea3">
				<div class="reservation" onclick="openModal();">
					<h2>예약확정서</h2>
				</div>
			</div>
			<br>
			<br>
			<div align="right" style="margin-right:100px;">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick="location.href='goHotelSettingSummaryPage.set'"><b>다음</b></button>			
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function openModal(){
			$(".formModal").fadeIn();		
		}
	</script>
</body>
</html>