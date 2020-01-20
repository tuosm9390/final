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
	.serviceSearchArea{
		width:1280px;
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
		width:1280px;
		height:600px;
		overflow-x:hidden;
		overflow-y:scroll;
		border:1px solid lightgray;
	}
	.serviceTable{
		width:1265px;
		text-align:center;
		border-collapse: collapse;
	}
	.serviceTable th{
		height:30px;
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
	}
</style>
</head>
<body>
<jsp:include page="modal/serviceModal.jsp"/>
<jsp:include page="../common/menubar.jsp"/>
<div class="mainArea">
	<jsp:include page="../common/settingMenubar.jsp"/>
	<div class="rightAreaRoom">
		<div class="serviceTitelArea">
			<h3>서비스 설정</h3>
		</div>
		<div class="serviceSearchArea">
			<h4>서비스명 / 코드</h4>
			<div class="serviceBtnArea">
				<input type="text">
				<button class="serviceBtn">조회</button>
				<button class="serviceAddBtn" onclick="openServiceModal();">서비스추가</button>
			</div>
		</div>
		<div class="serviceTableArea">
			<table class="serviceTable" border="1">
				<tr>
					<th width="15%">서비스 코드</th>
					<th width="30%">서비스 명</th>
					<th width="20%">매출 구분</th>
					<th width="25%">금액</th>
					<th width="10%">사용</th>
				</tr>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	function openServiceModal(){
		
		$(".modal").fadeIn();
		
	}
</script>
</body>
</html>