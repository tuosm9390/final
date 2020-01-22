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
		height:600px;
		float:right;
	}
	.brokenRoomDate{
		width:1200px;
		display: flex;
		margin-top:30px;
		background:#E9F3FF;
		padding-top:13px;
		padding-left:10px;
	}
	.brokenRoomDate h4{
		margin-top:4px;
	}
	.brokenBtnGroup{
		text-align:center;
	}
	.brokenBtn{
		background:#3498DB;
		color:white;
		border:0;
		cursor:pointer;
		margin-top:5px;
	}
	.brokenTableArea{
		width:1215px;
		height:400px;
		border:1px solid lightgray;
		margin-top:30px;
		overflow-x:hidden;
		overflow-y:scroll;
	}
	.brokenRoomTable{
		width:1200px;
		border-color:lightgray;
	}
	.brokenRoomTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
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
	.brokenRoomBtn{
		background:#3498DB;
		color:white;
	}
	.brokenRoomTitleArea{
		width:1215px;  
		padding-bottom:30px;
		border-bottom-color: lightgray;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
</style>
</head>
<body>
<header>
	<jsp:include page="modal/brokenModal.jsp"/>
	<jsp:include page="../common/settingMenubar.jsp"/>
	<jsp:include page="../common/menubar.jsp"/>
</header>
<section>
	<div class="mainArea">
		<div class="rightAreaRoom">
			<div class="brokenRoomTitleArea">
				<div class="btnGroup">
					<button class="roomBtn brokenRoomBtn">고장 객실 관리</button>
				</div>
			</div>
			<div class="brokenRoomDate">
				<h4>고장기간</h4>
				<table>
					<tr>
						<td width="50%"></td>
						<td><input type="text" id="brokenStart" name="brokenStart"></td>
					</tr>
				</table>
				~
				<table>
					<tr>
						<td width="50%"></td>
						<td><input type="text" id="brokenEnd" name="brokenEnd"></td>
					</tr>
				</table>
				<div class="brokenBtnGroup">
					<button class="brokenBtn">조회</button>
					<button class="brokenBtn" onclick="openBrokenModal();">고장등록</button>
					<button class="brokenBtn">고장해지</button>
				</div>
			</div>
			<div class="brokenTableArea">
				<table border="1" class="brokenRoomTable" style="border-collapse: collapse;">
					<tr class="thArea">
						<th width="5%"><input type="checkbox"></th>
						<th width="20%">객실 번호</th>
						<th width="20%">시작 일자</th>
						<th width="20%">종료 일자</th>
						<th width="35%">고장 사유</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	//datepicker
	$(function() {
		date = new Date();
	
		checkIn = $("#brokenStart").datepicker({
			autoClose : true,
			//선택한 날짜를 가져옴
			onSelect : function(date) {
				endNum = date;
				//종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
				$("#brokenEnd").datepicker({
					minDate : new Date(endNum),
				});
			}
		}).data('datepicker');
	
		checkOut = $("#brokenEnd").datepicker({
			autoClose : true,
			//선택한 날짜를 가져옴
			onSelect : function(date) {
				startNum = date;
				$('#brokenStart').datepicker({
					//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
					maxDate : new Date(startNum),
				});
			}
		}).data('datepicker');
		
	});
	
	function openBrokenModal(){
		$(".modal").fadeIn();		
	}
</script>
</body>
</html>