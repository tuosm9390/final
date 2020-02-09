<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:600px;
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
		border:1px solid lightgray;
		text-align:center;
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
		height:36px; 
		padding-bottom:10px;
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
				<h2>고장 객실 관리</h2>
			</div>
			<div class="brokenRoomDate">
				<h4>고장기간</h4>
				<form action="searchBrokenRoom.st" method="post" class="searchForm">
				<table>
					<tr>
						<td width="50%"></td>
						<td><input type="text" id="brokenStart" name="brokenStart"></td>
						<td> ~ </td>
						<td width="50%"></td>
						<td><input type="text" id="brokenEnd" name="brokenEnd"></td>
					</tr>
				</table>
				</form>
				<div class="brokenBtnGroup">
					<button class="brokenBtn" type="submit" onclick="return searchBrokenRoom();">검색</button>
					<button class="brokenBtn" onclick="openBrokenModal();" style="margin-left:550px;">고장등록</button>
					<button class="brokenBtn" style="background:darkgray;" onclick="return brokenDelete();">고장해지</button>
				</div>
			</div>
			<div class="brokenTableArea">
				<table border="1" class="brokenRoomTable" style="border-collapse: collapse;">
					<tr class="thArea">
						<th width="5%"></th>
						<th width="20%">객실 번호</th>
						<th width="20%">시작 일자</th>
						<th width="20%">종료 일자</th>
						<th width="35%">고장 사유</th>
					</tr>
					<c:forEach var="brokenRoomList" items="${ brokenRoomList }">
						<tr>
							<td><input type="checkbox" class="checkBoxBroken" onclick="oneCheckbox2(this);"><input type="hidden" value="${ brokenRoomList.rmNo }" class="rmNo" name="rmNo"></td>
							<td>${ brokenRoomList.rmNum }</td>
							<td class="brkBegin">${ brokenRoomList.brkBegin.substring(0,10) }</td>
							<td>${ brokenRoomList.brkEnd.substring(0,10) }</td>
							<td>${ brokenRoomList.brkRsn }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<input type="hidden" value="${ sessionScope.loginUser.mno }" name="staffMno" class="staffMno">
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
		
		$.ajax({
			url:"brokenAddRoomList.st",
			type:"post",
			data:{
				
			},
			success:function(data){
				$(".floorTable tr:not(.floorTableThArea)").remove();
				$.each(data.roomList.floorList, function(index,floorList){
					$(".floorTable tbody:last").after("<tr><td class='broken"+floorList+"'>"+floorList+"</td></tr>")
					
					$(".broken"+floorList).click(function(){
						//$(".floorRoomTable tr:not(.thAreaBrokenModal) td").html("");
						if($(this).html() == floorList){
							var room = new Array();
							for( var i = 0; i < data.roomList.roomInfoList.length; i++){
								if(data.roomList.roomInfoList[i].floor == floorList){
									room.push(data.roomList.roomInfoList[i]);
									console.log(room);
								}								
							}
							for(var i = 0; i < room.length; i++){
								if($(".floorRoomTable .floorRoom"+room[i].floor).length < room.length){
									$(".floorRoomTable tbody:last").after("<tr class='floorRoom"+room[i].floor+"'><td><input type='checkbox' onclick='oneCheckbox(this)' class='modalCheckBox'><input type='hidden' name='rmNo' class='rmNo' value='"+room[i].rmNo+"'></td><td>"+room[i].rmNum+"</td><td>"+room[i].rtName+"</td><td>"+room[i].rmStatus+"</td><td></td></tr>");
								}else{
									
								}
							}
							$(".floorRoomTable tr:not(.floorRoom"+floorList+", .thAreaBrokenModal)").remove();
							$(".floorRoom"+floorList).show();
						}
					})
				})
				
				//$(".floorTable tbody:last").
			},
			error:function(data){
				
			}
		});
		
		$(".modal").fadeIn();		
	}
	function addBrokenRoom(){
		
		if($(".modalBrokenStart").val() == ""){
			alert("고장 등록일자를 입력해주세요.");
			return false;
		}
		if($(".modalBrokenEnd").val() == ""){
			alert("고장 등록일자를 입력해주세요.");
			return false;
		}
		if($(".modalCheckBox").is(":checked") == false ){
			alert("고장객실을 선택해주세요.");
			return false;
		}
		if($(".brokenResponse").val() == ""){
			alert("고장사유를 입력해주세요.");
			return false;
		}
		
		if(confirm("고장객실을 등록하시겠습니까?")){
			
			var startDate = $(".modalBrokenStart").val();
			var endDate = $(".modalBrokenEnd").val();
			
			var check = $(".modalCheckBox:checked");
			var brkRsn = $(".brokenResponse").val();
			//console.log(check);
			
			//console.log(check.parent().children(".rmNo").val());
			//console.log($(".modalCheckBox").is(":checked").siblings(".rmNo").val());
			
			var rmNo = check.parent().children(".rmNo").val();
			var mno = $(".staffMno").val();
			
			location.href="addBrokenRoom.st?brkBegin="+startDate+"&brkEnd="+endDate+"&rmNo="+rmNo+"&mno="+mno+"&brkRsn="+brkRsn;
		}
		
	}
	function oneCheckbox(a){

        var obj = $(".modalCheckBox");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }

    }
	function oneCheckbox2(a){

        var obj = $(".checkBoxBroken");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }

    }
	function brokenDelete(){
		
		var checkBox = $(".checkBoxBroken:checked");
		
		var rmNo = checkBox.parent().children(".rmNo").val();
		
		var brkBegin = checkBox.parent().parent().children(".brkBegin").html();

		if($(".checkBoxBroken").is(":checked") == false ){
			alert("해지할 객실을 선택해주세요.");
			return false;
		}
		
		if(confirm("고장객실을 해지하시겠습니까 ? ")){
			location.href="updateBrokenRoom.st?rmNo="+rmNo+"&brkBegin="+brkBegin;
		}
	}
	function searchBrokenRoom(){
		
		if($("#brokenStart").val() == ""){
			alert("시작날짜를 입력해주세요.");
			return false;
		}
		if($("#brokenEnd").val() == ""){
			alert("종료날짜를 입력해주세요.");
			return false;
		}
		$(".searchForm").submit();
	}
</script>
</body>
</html>