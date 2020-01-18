<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		width:1600px;
		height:900px;
		margin:0 auto;
		background:#060E33;
	}
	.loginArea{
		text-align:center;
		margin-top:200px;
	}
	.logoImg{
		width:300px;
		height:70px;
	}
	.idInput, .pwdInput{
		width:300px;
		height:40px;
		border-radius: 10px;
		background:#23295F;
		color:white;
		border: 0;
		outline: 0;
		padding-left:5px;
	}
	table button{
		width:300px;
		height:40px;
		border-radius: 10px;
		background:#232434;
		border:0;
		font-weight:bold;
		color:white;
		cursor:pointer;
		outline: 0;
	}
	table button:hover{
		background:darkgray;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div class="loginArea">
	<form action="login.me" method="post">
		<table align="center">
			<tr>
				<td>
					<img alt="" src="${ contextPath }/resources/images/logo.png" class="logoImg">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" placeholder="  ID" class="idInput" name="userId">
				</td>
			</tr>
			<tr>	
				<td>
					<input type="password" placeholder="  PASSWORD" class="pwdInput" name="userPwd">
				</td>
			</tr>
			<tr>
				<td>
					<button>Login</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>