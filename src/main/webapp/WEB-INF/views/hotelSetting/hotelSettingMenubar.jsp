<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menubar{
		width:300px;
		height:900px;
		background:#060E33;
		margin-top:-18px;
		margin-left:-8px;
		float:left;
	}
	.logoArea{
		width:300px;
		height:70px;
		border-bottom-width:1px;
		border-bottom-style:solid;
		border-bottom-color:white;
	}
	.text{
		color:#EAC064;
	}
	.go{
		color:#EAC064;
	}
</style>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div class="menubar">
		<div class="logoArea">
			<img alt="" src="${ contextPath }/resources/images/logo.png" width="300px" height="70px">
		</div>
		<div class="text Area1">
			<p align="center">1. 호텔 정보 설정</p>
		</div>
		<div class="go">
			<p align="center">▼</p>
		</div>
		<div class="text Area2">
			<p align="center">2. 객실 타입 설정</p>
		</div>
		<div class="go">
			<p align="center">▼</p>
		</div>
		<div class="text Area3">
			<p align="center">3. 객실 상세 정보</p>
		</div>
		<div class="go">
			<p align="center">▼</p>
		</div>
		<div class="text Area4">
			<p align="center">4. 객실 요금 설정</p>
		</div>
		<div class="go">
			<p align="center">▼</p>
		</div>
		<div class="text Area5">
			<p align="center">5. 서비스 등록</p>
		</div>
		<div class="go">
			<p align="center">▼</p>
		</div>
		<div class="text Area6">
			<p align="center">6. 양식 설정</p>
		</div>
		<div class="go">
			<p align="center">▼</p>
		</div>
		<div class="text Area7">
			<p align="center">7. 설정 요약</p>
		</div>
		<div class="go">
			<p align="center">▼</p>
		</div>
		<div class="text Area8">
			<p align="center">8. 객실 이미지 등록</p>
		</div>
	</div>
</body>
</html>