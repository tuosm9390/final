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
	}
	.serviceTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.serviceTitleArea{
		padding-top:10px;
		width:1215px;  
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
</style>
</head>
<body>
<header>
	<jsp:include page="modal/serviceModal.jsp"/>
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
				<select style="height:25px;">
					<option>검색조건</option>
					<option>서비스명</option>
					<option>서비스코드</option>
				</select>
				<div class="serviceBtnArea" style="margin-left:5px;">
					<input type="text">
					<button class="serviceBtn">검색</button>
					<button class="serviceAddBtn" onclick="openServiceModal();" style="margin-left:780px;">서비스추가</button>
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
</section>
<script type="text/javascript">
	function openServiceModal(){
		
		$(".modal").fadeIn();
		
	}
</script>
</body>
</html>