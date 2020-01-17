<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.contentArea{
		width:1600px;
		height:900px;
	}
	.Area3{
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
	.noticeTextArea{
		float:left;
		margin-left:10px;
	}
	.btnGroupArea{
		/* float:right; */
	}
	.tableBtn{
		width:100px;
		height:30px;
		border-radius:5px;
		background:#DDEBFF;
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
		width:1200px;
		height:600px;
		display: inline-flex;
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
	.subBtn{
		font-size: 20px;
		font-weight: bold;
		margin-top:10px;
	}
	.tableArea{
		width:850px;
		height:600px;
		text-align:center;
		border:1px solid black;
	}
	.roomTable{
		width:850px;
		text-align:center;
	}
	.roomTable input{
		border:none;
	}
	th{
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
	}
	tr{
		height:40px;
	}
	.btnGroup{
		margin-top:30px;
		vertical-align: middle;
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">객실 상세 정보</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">객실 타입 별 객실의 상세 정보를 입력하세요.</h6>
				</div>
			</div>
						<!-- 위 -->
			<div class="contentArea2">
				<h3 style="margin-left:10px; ">객실 타입별 상세 정보</h3>
				<br>
				<div style="margin-top:-9px;">
					<div class="noticeTextArea">
					</div>
				</div>
			</div>
				<!-- 위끝 -->
			<div class="btnGroupArea">
				<button class="tableBtn" onclick="addRoom();">+ 추가</button>
				<button class="tableBtn" onclick="deleteRoom();">- 삭제</button>
			</div>
			<br>
			<div class="contentArea3">
				<br>
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
			</div>
			<br>
			<div class="btnGroup" align="center">
				<button class="backBtn" onclick=""><b>이전</b></button>			
				<button class="nextBtn" onclick=""><b>다음</b></button>			
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function addRoom(){
			$("tbody:last").append("<tr><td><input type='checkbox' style='width:34px;'></td><td><select><option value=''>선택</option><option value='2'>2층</option><option value='3'>3층</option><option value='4'>4층</option><option value='5'>5층</option> <option value='6'>6층</option> <option value='7'>7층</option> <option value='8'>8층</option> <option value='9'>9층</option> <option value='10'>10층</option> <option value='11'>11층</option> <option value='12'>12층</option> <option value='13'>13층</option> </select> </td> <td> <input type='text' style='width:128px;'> </td> <td> <input type='text' style='width:337px;'> </td> <td> <input type='number' min='1' value='1' max='20' style='text-align:center;'> </td> <td> <input type='number' min='1' value='1' max='20' style='text-align:center;'> </td> </tr>");
		};
		function deleteRoom(){
			
		};
	</script>		
</body>
</html>