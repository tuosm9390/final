<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.Area1{
		font-weight: bold;
	}
	.contentArea{
		width:1300px;
		height:900px;
	}
	.titleArea{
		float:right;
		width:1300px;
		height:80px;
		border-bottom-width: 1px;
		border-bottom-color: black;
		border-bottom-style: solid;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<jsp:include page="hotelSettingMenubar.jsp"/>
	<div class="contentArea">
		<div class="titleArea">
			<h1>호텔 정보 설정</h1>
		</div>
	</div>
</body>
</html>