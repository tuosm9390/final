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
   		cursor:pointer;
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
				<form action="goRoomDetailPage.set" method="post">
				<div class="tableArea">
					<table border="1" class="roomTable" style="border-collapse: collapse;">
						<tr class="thArea">
							<th width="5%"><input type="checkbox" class="roomAllCheck"></th>
							<th width="40%">객실 타입</th>
							<th width="15%">최소 인원</th>
							<th width="15%">최대 인원</th>
							<th width="15%">객실 요금</th>
						</tr>
					</table>
				</div>
				<br>
				<div align="right">
					<button type="button" class="backBtn" onclick="location.href='backHotelInfoSettingPage.set'"><b>이전</b></button>			
					<button type="submit" class="nextBtn" onclick="return goRoomDetail();"><b>다음</b></button>			
				</div>
				</form>
			</div>
		</div><!-- 오른쪽영역 끝 -->
	</div>
	<script type="text/javascript">
		function addRoomType(){
			$("tbody:last").append("<tr><td><input type='checkbox' name='roomTypeCheck'></td><td><input type='text' style='width:400px;height:30px;' name='rtName'></td><td><input type='number' min='1' value='1' max='20' style='text-align:center;' name='minPer'></td><td><input type='number' min='1' value='1' max='20' style='text-align:center;' name='maxPer'></td><td><input type='text' style='width:100px;height:30px;' name='limitprc'></td></tr>");
		};
		$(function(){
		
			$(".roomAllCheck").click(function(){
				if($(".roomAllCheck").is(":checked")){
					$("input[name='roomTypeCheck']").prop('checked',true);
				}else{
					$("input[name='roomTypeCheck']").prop('checked',false);
				}
			});		
				
			
		});
		function deleteRoomType(){
			  var checkRow = "";
			  $("input[name='roomTypeCheck']:checked").each (function (){
			   	checkRow = checkRow + $(this).val()+"," ;
			  });
				checkRow = checkRow.substring(0,checkRow.lastIndexOf( ","));
			 
			  if(checkRow == ''){
			    alert("삭제할 대상을 선택하세요.");
			    return false;
			  }
			 
			  if(confirm("정보를 삭제 하시겠습니까?")){
			  	
				  $("input[name='roomTypeCheck']:checked").parent().parent().remove();  
				  
			  }
		}
		function goRoomDetail(){
			
			if($("input[name='rtName']").val() == ""){
				alert("객실 타입을 입력해주세요.");
				return false;
			}
			if($("input[name='minPer']").val() == ""){
				alert("최소 인원을 입력해주세요.");
				return false;
			}
			if($("input[name='maxPer']").val() == ""){
				alert("최대 인원을 입력해주세요.");
				return false;
			}
			if($("input[name='limitprc']").val() == ""){
				alert("객실 가격을 입력해주세요.");
				return false;
			}
			if($("input[name='maxPer']").val() < $("input[name='minPer']").val()){
				alert("최대인원은 최소인원을 넘을수 없습니다.");
				return false;
			}
			if($("input[name='rtName']").length == 0){
				alert("객실 타입을 추가해주세요.");
				return false;
			}
			if($("input[name='rtName']").length >= 2){
				for(var i = 0; i <= $("input[name='rtName']").length ; i++){
					if($("input[name='rtName']")[i].value == $("input[name='rtName']")[i+1].value){
						alert("객실 타입은 중복될 수 없습니다.");
						return false;
					}
				}
				return false;
			}
			return true;
		}
	</script>
</body>
</html>