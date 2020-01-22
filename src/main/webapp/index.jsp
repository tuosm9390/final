<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<button onclick="location.href='goMain.hmain'">호텔 메인으로</button>	
	<button onclick="location.href='goMain.hadmin'">호텔 관리자로</button>
	<button onclick="location.href='goSettingMain.main'">설정으로</button>
</body>
</html>