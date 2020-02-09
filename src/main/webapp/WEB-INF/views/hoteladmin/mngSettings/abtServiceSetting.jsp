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
	.serviceSearchArea{
		margin-top:30px;
		width:1200px;
		height:40px;
		background:#E9F3FF;
		display: flex;
		padding-top:15px;
		padding-left:10px;
	}
	.serviceSearchArea h4{
		margin-top:0;
		margin-bottom:0;
	}
	.serviceBtnArea{
		text-align:center;
		margin-left:30px;
	}
	.serviceBtn{
		width:100px;
		height:30px;
		background:#3498DB;
		color:white;
		border:0;
		cursor:pointer;
	}
	.serviceAddBtn{
		background:#3498DB;
		color:white;		
		border:0;
		cursor:pointer;
	}
	.serviceTableArea{
		margin-top:30px;
		width:1215px;
		height:400px;
		overflow-x:hidden;
		overflow-y:scroll;
		border:1px solid lightgray;
	}
	.serviceTable{
		width:1200px;
		text-align:center;
		border-collapse: collapse;
		border:1px solid lightgray;
	}
	.serviceTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.serviceTitleArea{
		width:1215px;  
		height:36px;
		padding-bottom:10px;
		border-bottom-color: lightgray;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	.serviceTitle{
		margin-top:20px; 
		border:0;
		width:180px;
		height:40px;
		font-weight: bold;
		box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.2);
		background:#3498DB;
		color:white;
	}
	/* .serviceTable tr td input{
		border:0;
		font-weight:bold;
		text-align:center;
	} */
	
</style>
</head>
<body>
<header>
	<jsp:include page="modal/serviceModal.jsp"/>
	<jsp:include page="modal/serviceDetailModal.jsp"/>
	<jsp:include page="../common/settingMenubar.jsp"/>
	<jsp:include page="../common/menubar.jsp"/>
</header>
<section>
	<div class="mainArea">
		<div class="rightAreaRoom">
			<div class="serviceTitleArea">
				<h2>서비스 설정</h2>
			</div>
			<div class="serviceSearchArea">
			<form action="searchService.st" method="post">
				<select style="height:30px;" class="serviceOption" name="serviceOption">
					<option value="">검색조건</option>
					<option value="serviceName">서비스명</option>
					<option value="serviceCode">서비스코드</option>
				</select>
				<input type="text" name="serviceValue" class="serviceValue" style="height:25px;">
				<button class="serviceBtn" onclick="return searchService();">검색</button>
			</form>
			<button type="button" class="serviceAddBtn" onclick="openServiceModal();" style="margin-left:720px; height:30px;">서비스추가</button>
			</div>
			<div class="serviceTableArea">
				<table class="serviceTable" border="1">
					<tr class="thArea">
						<th width="15%">서비스 코드</th>
						<th width="30%">서비스 명</th>
						<th width="20%">매출 구분</th>
						<th width="25%">금액</th>
						<th width="10%">사용여부</th>
					</tr>
					<c:forEach var="svcList" items="${ svcList }">
					<tr>
						<td class="svcCodeTd">${ svcList.svcCode }</td>
						<td class="svcNameTd">${ svcList.svcName }</td>
						<c:if test="${ svcList.salesType.equals('ADDTIME') }">
							<td>시간추가</td>
						</c:if>
						<c:if test="${ svcList.salesType.equals('ETC') }">
							<td>기타</td>
						</c:if>
						<td>${ svcList.svcPrice } 원</td>
						<c:if test="${ svcList.svcStatus.equals('Y') }">
							<td>사용</td>						
						</c:if>
						<c:if test="${ svcList.svcStatus.equals('N') }">
							<td>미사용</td>						
						</c:if>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	
	$(function(){
		$(".serviceTableArea .serviceTable tr:not(.thArea)").mouseenter(function(){
	 		$(this).css({"background":"lightgray", "cursor":"pointer"});
	 	}).mouseout(function(){
	 		$(this).css({"background":"white"});
	 	}).click(function(){
	 		svcCode = $(this).children(".svcCodeTd").html();
	 		
	 		$.ajax({
	 			url:"serviceDetail.st",
	 			type:"post",
	 			data:{
	 				svcCode:svcCode
	 			},
	 			success:function(data){
	 				
	 				$(".serviceCodeDetailModal").val(data.svc.svcCode);
	 				$(".serviceNameDetailModal").val(data.svc.svcName);
	 				$(".servicePriceDetailModal").val(data.svc.svcPrice);
	 				$(".serviceTypeDetailModal").val(data.svc.salesType);
	 				
	 				if(data.svc.svcStatus == "Y"){
		 				$("#usedDetailModal").prop("checked", true);
	 				}else if(data.svc.svcStatus == "N"){
		 				$("#unUseDetailModal").prop("checked", true);
	 				}
	 				
	 				$(".modalDetail").fadeIn();
	 			},
	 			error:function(data){
	 				
	 			}
	 		});
	 		
	 	});
	});

	function openServiceModal(){
		$(".modal").fadeIn();
	}
	function addService(){
		
		if($(".svcCodeTd").html() == $(".serviceCode").val()){
			alert("중복된 서비스코드 입니다.");
			return false;
		}
		if($(".svcNameTd").html() == $(".serviceName").val()){
			alert("중복된 서비스명 입니다.");
			return false;
		}
		
		if($(".serviceCode").val() == ""){
			alert("서비스 금액을 입력해주세요.");
			return false;
		}
		if($(".serviceName").val() == ""){
			alert("서비스 타입을 선택해주세요.");
			return false;
		}
		if($(".servicePrice").val() == ""){
			alert("서비스 금액을 입력해주세요.");
			return false;
		}
		if($(".serviceType").val() == ""){
			alert("서비스 타입을 선택해주세요.");
			return false;
		}
		if($(".serviceUsing").val() == ""){
			alert("서비스 사용 여부를 선택해주세요.");
			return false;
		}
		
		return true;
	}
	
	function updateService(){
		
		if($(".servicePriceDetailModal").val() == ""){
			alert("서비스 금액을 입력해주세요.");
			return false;
		}
		if(comfirm("변경사항을 저장하시겠습니까 ? ")){
			return true;
		}
	}
	function searchService(){
		
		if($(".serviceOption").val() == ""){
			alert("검색조건을 선택해주세요");
			return false;
		}
		if($(".serviceValue").val() == ""){
			alert("검색내용을 입력해주세요");
			return false;
		}
		
		return true;
	}
</script>
</body>
</html>