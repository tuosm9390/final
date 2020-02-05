<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsComplie</title>
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:600px;
	}
	.newTrArea input{
		text-align:center;
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
		background:#3498DB;
		color:white;
	}
	.roomDetailBtn{
		background:white;
		color:#3498DB;
	}
	.roomTitleArea{
		width:1270px;
		padding-bottom:20px;
		border-bottom-color: lightgray;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	.roomTableArea{
		margin-top:30px;
		margin-right:30px;
	}
	.textArea{
		float:left;
	}
	.addRoomType{
		float:right;
		cursor:pointer;
		width:100px;
		height:30px;
		border-radius:5px;
		border:0;
		background-color: #3498DB;
   		color: white;
	}
	.addRoomType:hover{
		background:#AAEBFF;
	}
	.roomTable{
		width:1270px;
		hegith:380px;
		text-align: center;
		border:1px solid lightgray;
	}
	.roomTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
	}
	.roomTable tr{
		height:40px;
	}
	.roomTable input{
		border:0;
	}
	.tableAreaRoom{
		margin-top:30px;
		width:1270px;
		height:380px;
		border:1px solid black;
		overflow-y:scroll;
		overflow-x:hidden;
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
</style>
</head>
<body>
<header>
	<jsp:include page="modal/roomDetailModal.jsp"/>
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
			<h2>객실 타입 설정</h2>
			<div class="roomTableArea">
				<label class="textArea">객실타입은 수정 및 삭제가 불가능 합니다. 신규로 생성할 수 있습니다.</label>
				<button class="addRoomType" onclick="addRoomType();">+ 추가</button>
				<br>
				<form action="addRoomType.st" method="post">
					<div class="tableAreaRoom">
						<table border="1" class="roomTable" style="border-collapse: collapse;">
							<tr class="thArea">
								<th width="25%">객실 타입</th>
								<th width="15%">객실 수</th>
								<th width="15%">기준 인원</th>
								<th width="15%">최대 인원</th>
								<th width="20%">정상가</th>
							</tr>
							<c:forEach var="roomTypeList" items="${ roomTypeList }">
								<tr>
									<td>${ roomTypeList.rtName } <input type="hidden" value="${ roomTypeList.rtNo }" class="roomTypeNo"> <input type="hidden" value="${ roomTypeList.rtName }" class="roomTypeName"></td>
									<td>${ roomTypeList.roomCount }</td>
									<td>${ roomTypeList.minPer }</td>
									<td>${ roomTypeList.maxPer }</td>
									<td>${ roomTypeList.limitprc }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div align="right" style="margin-top:10px;">
						<button type="reset" class="saveBtn resetBtn" onclick="return resetRoomType();">취소</button>
						<button type="submit" class="saveBtn" onclick="return saveRoomType();">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	function addRoomType(){

		$(".modalRoomDetail").fadeIn();
		/* $(".minPer").each(function(){
			$(this).change(function(){
				$(this).parent().siblings().children(".maxPer").attr("min", $(this).val());
				$(this).parent().siblings().children(".maxPer").attr("value", $(this).val());
			});
		}) */
	};
	function saveRoomType(){
		if($(".newTrArea").length < 1){
			alert("추가할 객실 타입을 입력해주세요.");
			return false;
		}
		
		$(".roomTypeName").each(function(index, item){
			
			$(".rtNames").each(function(index, items){
				if(items.value == ""){
					alert("객실 타입 명을 입력해주세요.");
					return false;
				}
				if(items.value == item.value){
					alert("같은 타입의 객실명을 입력하실 수 없습니다.");
					return false;
				}
				
				return false;
			});

		});
		
		$(".limitprc").each(function(index, item){
			if(item.value == ""){
				alert("객실 가격을 입력해주세요.");
				return false;
			}
			return false;
		});
		
		if(confirm("객실 유형을 등록하시겠습니까? ")){
			return true;
		}
		
		return false;
	};
	function resetRoomType(){
		$(".newTrArea").remove();
	};
</script>
</body>
</html>