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
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/settingMenubar.jsp"/>
	<%-- <jsp:include page="../common/productMenubar.jsp"/> 
	<jsp:include page="../common/cmsMenubar.jsp"/> --%>
	
	<%-- <jsp:forward page="login.jsp"/> --%>
	<jsp:forward page="../mngSettings/abtHotel/userInsert.jsp"/>
</body>
</html>