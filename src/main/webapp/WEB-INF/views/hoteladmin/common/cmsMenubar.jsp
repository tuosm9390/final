<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.cmsMenubarArea{
		position:fixed;
		padding-top:100px;
		width:250px;
		height:800px;
		float:left;
		border-right-width:1px;
		border-right-style:solid;
		border-right-color:lightgray;
	}
	.cmsMenubar{
		list-style: none;
		font-weight: bold;
		padding-left:15px;
	}
	.cmsMenubar ul{
		padding-bottom:30px;
		display: inline-block;
	}
	.cmsMenubar li{
		padding-bottom:30px;
	}
	.cmsdiv:hover{
		background:#C7C0C0;
		cursor:pointer;
	}
	section{
		padding-left:280px;
	}
	
</style>
</head>
<body>
<div class="cmsMenubarArea" align="left">
	<ul class="cmsMenubar">
		<li>
			<div class="cmsdiv" onclick="location.href='viewList.cl'">
				<img alt="" src="${ contextPath }/resources/images/customer.png" width="30px" height="30px" style="margin-right:10px;">고객관리
			</div>
		</li>
		<li>
			<div class="cmsdiv" onclick="location.href='viewBlackList.cl'">
				<img alt="" src="${ contextPath }/resources/images/blackRist.png" width="30px" height="30px" style="margin-right:10px;">블랙리스트
			</div>
		</li>
		<li>
			<div class="cmsdiv" onclick="location.href='question.cl'">
				<img alt="" src="${ contextPath }/resources/images/customerQnA.png" width="30px" height="30px" style="margin-right:10px;">고객문의
			</div>
		</li>
	</ul>
</div>
</body>
</html>