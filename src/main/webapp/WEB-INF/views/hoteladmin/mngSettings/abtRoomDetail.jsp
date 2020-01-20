<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:900px;
		float:right;
	}
	.roomBtn{
		margin-top:20px; 
		border:0;
		width:180px;
		height:40px;
		font-weight: bold;
		box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.2);
	}
	.roomBtn:hover{
		cursor:pointer;
	}
	.roomTypeBtn{
		background:#3498DB;
		color:white;
	}
	.roomDetailBtn{
		background:white;
		color:#3498DB;
	}
	.roomTitleArea{
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
		height:600px;
		border:1px solid black;
		margin-right:10px;
		overflow-y: scroll;
		overflow-x: hidden;
		background:#FFFAFA
	}
	.inRightArea{
		width:850px;
		height:600px;
		border:1px solid black;
		overflow-y: scroll;
		overflow-x: hidden;
	}
	.contentArea3{
		margin-top:10px;
		width:1200px;
		height:600px;
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
		width:850px;
		text-align:center;
	}
	.roomTable th{
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
	}
	.roomTable tr{
		height:40px;
	}
	.saveBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border-radius:5px;
		border:0;
		color:#EAC064;
	}
	.saveBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
	.bGroup{
		float:right;
		margin-right:190px;
	}
	.setbutton{
		border:0;
		width:100px;
		cursor:pointer;
		background:#DDEBFF;
	}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="mainArea">
	<jsp:include page="../common/settingMenubar.jsp"/>
	<div class="rightAreaRoom">
		<div class="roomTitleArea">
			<div class="btnGroup">
				<button class="roomBtn roomTypeBtn">객실 타입 설정</button>
				<button class="roomBtn roomDetailBtn">객실 상세 정보</button>
			</div>
			<br>
		</div>
		<br>
		<div class="bGroup">
			<button class="setbutton addBtn"> + 추가 </button>
			<button class="setbutton disable">비활성화</button>
			<button class="setbutton enable">활성화</button>
		</div>
		<div class="contentArea3">
			<div class="inLeftArea">
				<div align="center">
					<button class="allShowButton"><h2>전체내역</h2></button>
					<button class="allShowButton subBtn"><span>디럭스</span><span>0</span></button>
					<button class="allShowButton subBtn"><span>프리미엄</span><span>0</span></button>
					<button class="allShowButton subBtn"><span>스위트룸</span><span>0</span></button>
					<button class="allShowButton subBtn"><span>스파룸</span><span>0</span></button>
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
		<div align="center" style="margin-top:10px;">
			<button class="saveBtn">저장</button>
		</div>
	</div>
</div>
</body>
</html>