<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:600px;
		float:right;
	}
	.roomBtn{
		margin-top:20px; 
		border:0;
		width:130px;
		height:30px;
		font-weight: bold;
		box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.2);
	}
	.roomBtn:hover{
		cursor:pointer;
	}
	.roomTypeBtn{
		background:white;
		color:#3498DB;
	}
	.roomDetailBtn{
		background:#3498DB;
		color:white;
	}
	.roomTitleArea{
		width:1265px; 
		padding-bottom:20px;
		border-bottom-color: lightgray;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	.roomTableArea{
		margin-top:30px;
	}
	.inLeftArea{
		width:250px;
		height:400px;
		border:1px solid black;
		margin-right:10px;
		overflow-y: scroll;
		overflow-x: hidden;
		background:#FFFAFA
	}
	.inRightArea{
		width:1000px; 
		height:400px;
		border:1px solid black;
		overflow-y: scroll;
		overflow-x: hidden;
	}
	.contentArea3{
		margin-top:10px;
		width:1300px;
		height:400px;
		display: inline-flex;
	}
	.subBtn{
		font-size: 20px;
		font-weight: bold;
		margin-top:10px;
	}
	.allShowButton{
		border:0;
		background:0;
		width: 250px;
	}
	.allShowButton:hover{
		background:lightgray;
		cursor:pointer;
	}
	.roomTable{
		width:985px;
		text-align:center;
	}
	.roomTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.saveBtn{
		width:100px;
		height:30px;
 		border-radius:5px;
		border:0;
		background:#3498DB;
		color:white;
	}
	.saveBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
	.bGroup{
		float:right;
		margin-right:35px;
	}
	.setbutton{
		border:0;
		width:100px;
		height:30px;
		border-radius:5px;
		cursor:pointer;
		background:#3498DB;
		color:white;
	}
	.disable{
		border:1px solid gray;	
		background:white;
		color:gray;
		width:80px;	
	}
	.enable{
		background:#3498DB;
		color:white;
		border:1px solid #3498DB;	
		width:80px;	
	}
</style>
</head>
<body>
<header>
	<jsp:include page="../common/settingMenubar.jsp"/>
	<jsp:include page="../common/menubar.jsp"/>
</header>
<section>
	<div class="mainArea">
		<div class="rightAreaRoom">
			<div class="roomTitleArea">
				<div class="btnGroup">
					<button class="roomBtn roomTypeBtn" onclick="location.href='goRoomType.st'">객실 타입 설정</button>
					<button class="roomBtn roomDetailBtn" onclick="location.href='goRoomDetail.st'">객실 상세 정보</button>
				</div>
			</div>
			<h2>객실 상세 정보</h2>
			<button class="setbutton addBtn"> + 추가 </button>
			<div class="bGroup">
				<button class="setbutton disable">비활성화</button>
				<button class="setbutton enable">활성화</button>
			</div>
			<div class="contentArea3">
				<div class="inLeftArea">
					<div align="center">
						<button class="allShowButton"><h2>전체내역</h2></button>
						<button class="allShowButton subBtn"><span>디럭스 </span><span> ( 0 )</span></button>
						<button class="allShowButton subBtn"><span>프리미엄 </span><span> ( 0 )</span></button>
						<button class="allShowButton subBtn"><span>스위트룸 </span><span> ( 0 )</span></button>
						<button class="allShowButton subBtn"><span>스파룸 </span><span> ( 0 )</span></button>
					</div>					
				</div>
				<div class="inRightArea">
					<table border="1" class="roomTable" style="border-collapse: collapse;">
						<tr class="thArea">
							<th width="5%"><input type="checkbox"></th>
							<th width="10%">층</th>
							<th width="15%">객실 번호</th>
							<th width="40%">객실 옵션</th>
							<th width="15%">기준 인원</th>
							<th width="15%">최대 인원</th>
						</tr>
					</table>
				</div>
				<br>
			</div>
			<div align="right" style="margin-top:10px; margin-right:35px;">
				<button class="saveBtn">저장</button>
			</div>
		</div>
	</div>
</section>
</body>
</html>