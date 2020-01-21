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
		height:600px;
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
		height:30px;
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
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