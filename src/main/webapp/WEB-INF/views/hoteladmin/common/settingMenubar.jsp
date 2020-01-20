<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.settingMenubarArea{
		position : fixed;
		width:250px;
		height:800px;
		float:left;
		border-right-width:1px;
		border-right-style:solid;
		border-right-color:lightgray;
	}
	.settingMenubar{
		list-style: none;
		position: relative;
		padding-left:10px;
	}
	.settingMenubar ul{
		padding-bottom:30px;
		position: relative;
	}
	.settingMenubar li{
		padding-bottom:10px;
		position: relative;
	}
	.settingMenubar label{
		padding-left:30px;
	}
	.settingMenubar ul li{
		position: relative;
	}
	.settingMenubar ul li:hover{
		background:#C7C0C0;
		cursor:pointer;
	}
	.room li{
		padding-left:30px;
	}
	.setting li{
		padding-left:30px;
	}
	.hotel li{
		padding-left:30px;
	}
	section{
		padding-left:280px;
	}
</style>
<body>
<div class="settingMenubarArea">
	<ul class="settingMenubar">
		<li>
			<img alt="" src="${ contextPath }/resources/images/settingmain.png" width="30px" height="30px" style="margin-right:10px;"><b>객실관리</b>
		<br>
		<br>
			<ul class="settingMenubar subNavv room">
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">객실타입</li>
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">객실요금</li>
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">고장객실관리</li>
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">서비스</li>
			</ul>
		</li>
		<li>
			<img alt="" src="${ contextPath }/resources/images/settingmain.png" width="30px" height="30px" style="margin-right:10px;"><b>양식관리</b>
		<br>
		<br>
			<ul class="settingMenubar subNavv setting">
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">예약확인서</li>
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">영수증</li>	
			</ul>
		</li>
		<li>
			<img alt="" src="${ contextPath }/resources/images/settingmain.png" width="30px" height="30px" style="margin-right:10px;"><b>호텔관리</b>
		<br>
		<br>
			<ul class="settingMenubar subNavv hotel">
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">호텔정보</li>
				<li><img alt="" src="${ contextPath }/resources/images/settingsub.png" width="30px" height="30px" style="margin-right:10px;">사용자등록</li>
			</ul>
		</li>
	</ul>
</div>
</body>
</html>