<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		overflow-x:hidden;
	}
	.contentArea{
		width:1600px;
		height:900px;
	}
	.menubar{
		height:950px;
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
		cursor:pointer;
		width:100px;
		height:30px;
		border-radius:5px;
		border:0;
		background-color: #3498DB;
   		color: white;
	}
	.inLeftArea{
		width:250px;
		height:450px;
		border:1px solid black;
		margin-right:10px;
		overflow-y: scroll;
		overflow-x: hidden;
		background:#FFFAFA
	}
	.inRightArea{
		width:850px;
		height:450px;
		border:1px solid black;
		overflow-y: scroll;
		overflow-x: hidden;
	}
	.contentArea3{
		width:1200px;
		height:450px;
		display: inline-flex;
		margin-left:30px;
	}
	.contentArea2{
		margin-left:30px;
	}
	.btnGroupArea{
		float:right;
		margin-right:160px;	
		margin-bottom:20px;
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
	th{
		background-color: #f7f7f7;
		color: #005B9E;
	}
	tr{
		height:40px;
		border: 1px solid lightgray;
		text-align: center;
		height:40px;
	}
	ul.tabs {
	    margin: 0;
	    padding: 0;
	    float: left;
	    list-style: none;
	    height: 32px;
	    border-bottom: 1px solid #eee;
	    border-left: 1px solid #eee;
	    width: 100%;
	    font-family:"dotum";
	    font-size:12px;
	}
	ul.tabs li {
	    float: left;
	    text-align:center;
	    cursor: pointer;
	    width:82px;
	    height: 31px;
	    line-height: 31px;
	    border: 1px solid #eee;
	    border-left: none;
	    font-weight: bold;
	    background: #fafafa;
	    overflow: hidden;
	    position: relative;
	}
	ul.tabs li.active {
	    background: #FFFFFF;
	    border-bottom: 1px solid #FFFFFF;
	}
	.tab_container {
	    border: 1px solid #eee;
	    border-top: none;
	    clear: both;
	    float: left;
	    width: 248px;
	    background: #FFFFFF;
	}
	.tab_content {
	    padding: 5px;
	    font-size: 12px;
	    display: none;
	}
	.tab_container .tab_content ul {
	    width:100%;
	    margin:0px;
	    padding:0px;
	}
	.tab_container .tab_content ul li {
	    padding:5px;
	    list-style:none
	}
	;
	 #container {
	    width: 249px;
	    margin: 0 auto;
	}
</style>
<meta charset="UTF-8">
<title>HotelsCompile</title>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- 오른쪽 영역 -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">§ 객실 상세 정보</h1>
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
				<button class="tableBtn" id="addRoomBtn">+ 추가</button>
				<button class="tableBtn" id="deleteRoomBtn" onclick="deleteRoom();">- 삭제</button>
			</div>
			<br>
			<div class="contentArea3">
				<br>
				<div class="inLeftArea">
					<div align="center">
						<button class="allShowButton"><h2>룸 리스트</h2></button>
						<c:forEach var="roomType" items="${ sessionScope.roomTypeList }">
							<div>
								<c:set var="names" value="${ roomType.rtName }"/>
								<button class="allShowButton subBtn" onclick="showDetailArea(this);" value="${ roomType.rtName }"><span>${ roomType.rtName }</span></button>
							</div>
						</c:forEach>
					</div>					
				</div>
			<form action="goRoomFarePage.set" method="post" class="fareForm">
			<div class="inRightArea">
				<c:forEach var="roomType" items="${ sessionScope.roomTypeList }">
					<c:set var="name" value="${ roomType.rtName }"/>
					<input type="hidden" name="roomType" value="${ name }">
					<table border="1" class="roomTable" style="border-collapse: collapse;" rel="${ name }" id="${ name }">
						<tr class="thArea">
							<th width="5%"><input type="checkbox" class="roomAllCheck"></th>
							<th width="10%">층</th>
							<th width="15%">객실 번호</th>
							<th width="55%">객실 옵션</th>
							<th width="15%">기준 인원</th>
						</tr>
					</table>
				</c:forEach>
				</div>
			</form>
			</div>
			<br>
				<div class="btnGroup" align="right" style="margin-right:150px;">
					<button class="backBtn" onclick="location.href='backRoomTypeSetting.set'"><b>이전</b></button>			
					<button type="submit" class="nextBtn" onclick="return goRoomFareSetting();"><b>다음</b></button>			
				</div>
			</div>
	</div>
	<script type="text/javascript">
	

/* 		function addRoom(){
			
			//table:not([style*="display: none"])
			
			console.log($(".roomTable").is(':visible'));
			
			if($(".roomTable").is(':visible')){
				$(".roomTable:last").append("<tr><td><input type='checkbox' style='width:34px;' name='roomDetailCheck'></td><td><select><option value=''>선택</option><option value='2'>2층</option><option value='3'>3층</option><option value='4'>4층</option><option value='5'>5층</option> <option value='6'>6층</option> <option value='7'>7층</option> <option value='8'>8층</option> <option value='9'>9층</option> <option value='10'>10층</option> <option value='11'>11층</option> <option value='12'>12층</option> <option value='13'>13층</option> </select> </td> <td> <input type='text' style='width:128px;'> </td> <td> <input type='text' style='width:337px;'> </td> <td> <input type='number' min='1' value='1' max='20' style='text-align:center;'> </td> <td> <input type='number' min='1' value='1' max='20' style='text-align:center;'> </td> </tr>");
			}
		}; */

		//////////////////////////////////////////////////////
		$(function(){
			
			roomtypes = "all";
			
			$(".roomAllCheck").click(function(){
				if($(".roomAllCheck").is(":checked")){
					$("input[name='roomDetailCheck']").prop('checked',true);
				}else{
					$("input[name='roomDetailCheck']").prop('checked',false);
				}
			});		
				
			
		});
		function deleteRoom(){
			  var checkRow = "";
			  $("input[name='roomDetailCheck']:checked").each (function (){
			   	checkRow = checkRow + $(this).val()+"," ;
			  });
				checkRow = checkRow.substring(0,checkRow.lastIndexOf( ","));
			 
			  if(checkRow == ''){
			    alert("삭제할 대상을 선택하세요.");
			    return false;
			  }
			 
			  if(confirm("정보를 삭제 하시겠습니까?")){
			  	
				  $("input[name='roomDetailCheck']:checked").parent().parent().remove();  
				  
			  }
		}
		
		
/* 		function showDetailArea(typeName){
			
			//console.log(typeName.value); // 선택 값
			//var test = $(".contentArea3").children(".inRightArea").children().eq(0).val();
			//console.log(test); // 디럭스
			var xxxx = $(".contentArea3").children(".inRightArea").children().length;
			for(var i = 0; i < xxxx; i++ ){
				if(typeName.value != $(".contentArea3").children(".inRightArea").children("input").eq(i).val()){
					$(".contentArea3").children(".inRightArea").children("input").siblings(".roomTable").css("display","none");
					continue;
				}else{
					console.log(typeName.value);
					$(".contentArea3").children(".inRightArea").children("input[value='typeName.value']").siblings(".roomTable").css("display","table"); */
					/* console.log($(".contentArea3").children(".inRightArea").children().eq(i+1).attr("display","block")); */
/* 					break;
				}
			}
			
			if(typeName.value == $(".inRightArea").children("input[type='hidden']").val()){
				 $(".contentArea3").children(".inRightArea").children("input[type='hidden']").siblings("table").attr("display","block");
			}
		} */
		function showDetailArea(obj){
			roomtypes = obj.value;
		    $(".subBtn").removeClass("active").css("color", "#333");
		    $(obj).addClass("active").css("color", "darkred");
		    $(".roomTable").hide();
		    activeTab = obj.value;
		    $("#" + activeTab).fadeIn();
		    
		}
		$(function () {
			
			$("#addRoomBtn").click(function(){
				if(roomtypes != "all"){
				 	$("#" + activeTab + " tbody:last").after("<tr><td><input type='hidden' name='rtName' value='"+activeTab+"'><input type='checkbox' style='width:34px;' name='roomDetailCheck'></td><td><select class='floor' name='floor'><option value=''>선택</option><option value='2'>2층</option><option value='3'>3층</option><option value='4'>4층</option><option value='5'>5층</option> <option value='6'>6층</option> <option value='7'>7층</option> <option value='8'>8층</option> <option value='9'>9층</option> <option value='10'>10층</option> <option value='11'>11층</option> <option value='12'>12층</option> <option value='13'>13층</option> </select> </td> <td> <input type='text' style='width:128px;' class='rmNum' name='rmNum'> </td> <td> <input type='text' style='width:337px;' name='rmOption' class='rmOption'> </td> <td> <input type='number' min='1' value='1' max='20' style='text-align:center;' class='stdPer' name='stdPer'> </td></tr>");
				}else{
					alert("룸타입을 선택해주세요.");
				}
			});

		    $(".roomTable").hide();
		    $(".roomTable:first").show();

	
		});
		
		function goRoomFareSetting(){
			
			if(roomtypes == "all"){
				alert("객실 상세 설정을 해주세요.");
				return false;
			}else{
				if($("#" + activeTab).find("input[name='roomDetailCheck']").length == 0){
					alert("객실 상세 설정을 해주세요.");
					return false;
				}else{
					if($(".floor").val() == ""){
						alert("층을 선택해주세요.");
						return false;
					}
					if($(".rmNum").val() == ""){
						alert("호실을 입력해주세요.");
						return false;
					}
					if($(".rmOption").val() == ""){
						alert("객실 옵션을 입력해주세요.");
						return false;
					}
					$(".fareForm").submit();
				}
			}
			return false;
		};
	</script>		
</body>
</html>