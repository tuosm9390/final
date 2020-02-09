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
		border:1px solid lightgray;
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
		border: 1px solid lightgray;
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
	.roomTable input{
		text-align:center;
		border:0;
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
			<button class="setbutton addBtn" type="button" id="addRoomBtn"> + 추가 </button>
			<div class="bGroup">
				<button class="setbutton disable" type="button">비활성화</button>
				<button class="setbutton enable" type="button">활성화</button>
			</div>
			
			<div class="contentArea3">
				<div class="inLeftArea">
					<div align="center">
						<h2>객실유형내역</h2>
						<c:forEach var="roomType" items="${ roomTypeList }">
							<button class="allShowButton subBtn" onclick="showDetailArea(this);" style="padding-left:45px;text-align:left;" value="${ roomType.rtNo }"><span>${ roomType.rtName } </span><span> ( ${ roomType.roomCount } )</span></button>
						</c:forEach>
					</div>					
				</div>
				<form action="addNewRoomDetail.st" method="post" class="addNewRoomDetail">
				<div class="inRightArea">
				<c:forEach var="roomType" items="${ roomTypeList }">
					<table border="1" class="roomTable" style="border-collapse: collapse;" id="${ roomType.rtNo }">
						<tr class="thArea">
							<th width="5%"></th>
							<th width="10%">층</th>
							<th width="15%">객실 번호</th>
							<th width="40%">객실 옵션</th>
							<th width="10%">기준 인원</th>
							<th width="10%">최대 인원</th>
							<th width="10%">상태</th>
						</tr>
					</table>
				</c:forEach>
				</div>
			</form>
			<br>
			</div>
			<div align="right" style="margin-top:10px; margin-right:35px;">
				<button class="saveBtn" onclick="return saveRoomDetail();" type="submit">저장</button>
			</div>
		</div>
	</div>
</section>
	<script type="text/javascript">
	function saveRoomDetail(){
		
		$(".rmNum").each(function(){
			if($(this).val() == $(".rmNumNew").val()){
				alert("객실 번호가 중복됩니다.");
				return false;
			}
		});
		
		$(".floorNew").each(function(){
			if($(this).val() == ""){
				alert("층을 선택해주세요.");
				return false;
			}
		});
		
		$(".rmOptionNew").each(function(){
			if($(this).val() == ""){
				alert("객실 옵션을 입력해주세요.");
				return false;
			}
		});
		
		$(".statusNew").each(function(){
			if($(this).val() == ""){
				alert("사용 여부를 선택해주세요.");
				return false;
			}
		});
		
		if(confirm("객실을 추가하시겠습니까?")){
			
			$(".addNewRoomDetail").submit();
			return true;
			
		}
		
	}
	$(function(){
		activeTab = "";
		roomtypes = "all";
		/* $("#addRoomBtn").click(function(){
			if(roomtypes != "all"){
			 	$("#" + activeTab).append("<tr><td><input type='hidden' name='rtNo' value='"+activeTab+"'><input type='checkbox' style='width:34px;' name='roomDetailCheck'></td><td><select class='floor' name='floor'><option value=''>선택</option><option value='2'>2층</option><option value='3'>3층</option><option value='4'>4층</option><option value='5'>5층</option> <option value='6'>6층</option> <option value='7'>7층</option> <option value='8'>8층</option> <option value='9'>9층</option> <option value='10'>10층</option> <option value='11'>11층</option> <option value='12'>12층</option> <option value='13'>13층</option> </select> </td> <td> <input type='text' style='width:128px;' class='rmNum' name='rmNum'> </td> <td> <input type='text' style='width:337px;' name='rmOption' class='rmOption'> </td> <td> <input type='number' disabled='disabled' min='1' value='1' max='20' style='text-align:center;' class='stdPer' name='stdPer'> </td><td> <input type='number' disabled='disabled' min='1' value='1' max='20' style='text-align:center;' class='maxPer' name='maxPer'></td><td>상태</td></tr>");
			}else{
				alert("룸타입을 선택해주세요.");
			}
		}); */

	    $(".roomTable").hide();
	    $(".roomTable:first").show();
	    
	    $("#addRoomBtn").click(function(){
	    	
	    	if(activeTab == ""){
	    		alert("객실 타입을 선택해주세요.");
		    	console.log(activeTab);
	    	}else{
	    		$.ajax({
	    			url:"minPerAndmaxPer.st",
	    			type:"post",
	    			data:{
	    				activeTab:activeTab
	    			},
	    			success:function(data){
	    				$("#" + activeTab+" tbody:last").after("<tr class='newTr'><td><input type='hidden' name='rtNoNew' value='"+activeTab+"'><input type='checkbox' style='width:34px;' name='roomDetailCheckNew'></td><td><select class='floorNew' name='floorNew'><option value=''>선택</option><option value='2'>2층</option><option value='3'>3층</option><option value='4'>4층</option><option value='5'>5층</option> <option value='6'>6층</option> <option value='7'>7층</option> <option value='8'>8층</option> <option value='9'>9층</option> <option value='10'>10층</option> <option value='11'>11층</option> <option value='12'>12층</option> <option value='13'>13층</option> </select> </td> <td> <input type='text' style='width:128px;' class='rmNumNew' name='rmNumNew'> </td> <td> <input type='text' style='width:337px;' name='rmOptionNew' class='rmOptionNew'> </td> <td> <input type='number' min='"+data.roomTypeMinPerMaxPer.minPer+"' value='"+data.roomTypeMinPerMaxPer.minPer+"' max='"+data.roomTypeMinPerMaxPer.maxPer+"' style='text-align:center;' class='stdPerNew' name='stdPerNew'> </td><td> <input type='number' disabled='disabled' min='1' value='"+data.roomTypeMinPerMaxPer.maxPer+"' max='20' style='text-align:center;' class='maxPerNew' name='maxPerNew'></td><td><select class='statusNew' name='statusNew'><option value=''>사용구분</option><option value='Y'>사용</option><option value='N'>미사용</option></select></td></tr>");                                               
	    			},
	    			error:function(data){
	    				
	    			}
	    		});
	    		
		    	console.log(activeTab);
	    	}
	    	
	    })
	    
	    $(".disable").click(function(){
	    
	    	var rmNoArr = new Array();
	    	var rmNo = "";
	    	var roomStatus = "";
	    	
		    $(".roomCheckBox").each(function(){
				
		    	if($(this).is(":checked") == true){
		    		
			    	rmNo = $(this).prop("checked", true).siblings(".rmNo").val();
			    	rmNoArr.push(rmNo)
			    	
			    	if($(this).parent().parent().children(".status").html() == 'N'){
			    		alert("이미 비활성화된 객실입니다.");
			    		roomStatus = "N";
			    	}
			    	
		    	}
		    	
		    	
			});
		    
		    if(rmNoArr == ""){
		    	alert("비활성화할 객실을 선택해주세요.");
		    }else if(roomStatus != "N"){
		    	if(confirm("객실을 비활성화 처리 하시겠습니까?")){
			    	location.href="disableRoom.st?rmNoArr="+rmNoArr;
		    	}
		    }
	    	
	    });
	    
	    $(".enable").click(function(){
	    
	    	var rmNoArr = new Array();
	    	var rmNo = "";
	    	var roomStatus = "";
	    	
		    $(".roomCheckBox").each(function(){
				
		    	if($(this).is(":checked") == true){
		    		
			    	rmNo = $(this).prop("checked", true).siblings(".rmNo").val();
			    	rmNoArr.push(rmNo)
			    	
			    	if($(this).parent().parent().children(".status").html() == 'Y'){
			    		alert("활성화된 객실입니다.");
			    		roomStatus = "N";
			    	}
			    	
		    	}
		    	
		    	
			});
		    
		    if(rmNoArr == ""){
		    	alert("활성화할 객실을 선택해주세요.");
		    }else if(roomStatus != "Y"){
		    	if(confirm("객실을 활성화 처리 하시겠습니까?")){
			    	location.href="enableRoom.st?rmNoArr="+rmNoArr;
		    	}
		    }
	    	
	    });
	    
	   
	});
	
	function showDetailArea(obj){
		roomtypes = obj.value;
	    $(".subBtn").removeClass("active").css("color", "#333");
	    $(obj).addClass("active").css("color", "darkred");
	    $(".roomTable").hide();
	    activeTab = obj.value;
	    console.log(activeTab);
	    $("#"+activeTab+" tr:not(.thArea)").remove();
	    $.ajax({
	    	url:"roomDetailList.st",
	    	type:"post",
	    	data:{
	    		roomtypes:roomtypes
	    	},
	    	success:function(data){
	    		$.each(data.roomDetailList, function(index, roomDetailList){
				    if(roomDetailList != null){
		    			$("#" + activeTab +" tbody:last").after("<tr class='existing'><td><input type='hidden' name='rtNo' value='"+activeTab+"'><input type='hidden' name='rmNo' class='rmNo' value='"+roomDetailList.rmNo+"'><input type='checkbox' style='width:34px;' name='roomDetailCheck' class='roomCheckBox'></td><td><select class='floor' name='floor'><option value=''>선택</option><option value='"+roomDetailList.floor+"' selected>"+roomDetailList.floor+"<option value='2'>2층</option><option value='3'>3층</option><option value='4'>4층</option><option value='5'>5층</option> <option value='6'>6층</option> <option value='7'>7층</option> <option value='8'>8층</option> <option value='9'>9층</option> <option value='10'>10층</option> <option value='11'>11층</option> <option value='12'>12층</option> <option value='13'>13층</option> </select> </td> <td> <input type='text' style='width:128px;' class='rmNum' name='rmNum' value='"+roomDetailList.rmNum+"'> </td> <td> <input type='text' style='width:337px;' name='rmOption' class='rmOption' value='"+roomDetailList.rmOption+"'> </td> <td> <input type='number' disabled='disabled' min='"+roomDetailList.minPer+"'  max='"+roomDetailList.maxPer+"' style='text-align:center;' class='stdPer2' name='stdPer' value='"+roomDetailList.stdPer+"'></td><td><input type='number' disabled='disabled' min='"+roomDetailList.minPer+"' max='"+roomDetailList.maxPer+"' style='text-align:center;' class='maxPer' name='maxPer' value='"+roomDetailList.maxPer+"'> </td><td class='status'>"+roomDetailList.rmStatus+"</td></tr>");
				    }
	    		});
	    		
	    			
			/*     $("#addRoomBtn").click(function(){
					if(roomtypes != "all"){
					 	$("#" + activeTab+" tbody:last").after("<tr class='newTr'><td><input type='hidden' name='rtNoNew' value='"+activeTab+"'><input type='checkbox' style='width:34px;' name='roomDetailCheckNew'></td><td><select class='floorNew' name='floorNew'><option value=''>선택</option><option value='2'>2층</option><option value='3'>3층</option><option value='4'>4층</option><option value='5'>5층</option> <option value='6'>6층</option> <option value='7'>7층</option> <option value='8'>8층</option> <option value='9'>9층</option> <option value='10'>10층</option> <option value='11'>11층</option> <option value='12'>12층</option> <option value='13'>13층</option> </select> </td> <td> <input type='text' style='width:128px;' class='rmNumNew' name='rmNumNew'> </td> <td> <input type='text' style='width:337px;' name='rmOptionNew' class='rmOptionNew'> </td> <td> <input type='number' min='1' value='' max='20' style='text-align:center;' class='stdPerNew' name='stdPerNew'> </td><td> <input type='number' disabled='disabled' min='1' value='"+data.roomDetailList.maxPer+"' max='20' style='text-align:center;' class='maxPerNew' name='maxPerNew'></td><td>상태</td></tr>");
					}else{
						alert("룸타입을 선택해주세요.");
					}
				}); */
	    			
	    		
			    $("#" + activeTab).fadeIn();
			    
			    
	    	},
	    	error:function(data){
	    		
	    	}
	    });
	    
	    
	}
	</script>
</body>
</html>